#include "../inc/includes.h"

const cts_io cts_gpio[] = {
		{CTS_IOB, 0},
		{CTS_IOB, 1},
		{CTS_IOB, 2},
};
const u8 cts_pads = sizeof(cts_gpio) / sizeof(cts_gpio[0]);
static cts_user cap_io[sizeof(cts_gpio) / sizeof(cts_gpio[0])];
static cts_conctrol control;

/*
 * argument in  :   none
 * argument out :
 * description  :	osc = 81.92M / 32 = 2.56M
 * 					period = 1000000us / 2560000 = 0.390625us
 * 					1ms tick = 1000 / 0.390625 = 2560
 * 					cycle = 0.390625 * 4096 = 1.6ms
 */
void enable_cap_touch(void)
{
	cts_ctrl0 ctr0;
	cts_ctrl1 ctr1;
	memset((void *)&control, 0, sizeof(control));
	memset((void *)&cap_io, 0, sizeof(cap_io));

	ctr0.bytes = 0;
	ctr0.bits.ctsen = 1;
	ctr0.bits.isel = CTS_25_UA;
	ctr0.bits.autostop = 1;
	ctr0.bits.ref_clk_en = 1;
	ctr0.bits.port = CTS_NOUSE;
	*P_CTS_Ctrl0 = ctr0.bytes;

	ctr1.bytes = 0;
	ctr1.bits.port = CTS_NOUSE;
	ctr1.bits.tmb_clk = CTS_CLK_REF;
	ctr1.bits.tmb_en = 1;
	ctr1.bits.tma_clk = CTS_CLK_SYS_DIV32;
	*P_CTS_Ctrl1 = ctr1.bytes;

	*P_CTS_HighTime = 10;
	*P_CTS_DebTime = 10;

	*P_CTS_TMADATA = 65535 - 4096;
	*P_CTS_TMBDATA = 0;
	*P_INT2_Ctrl |= C_IRQ6_CTSTMA;
	*P_INT2_Status |= C_IRQ6_CTSTMA;
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void disable_cap_touch(void)
{
	memset((void *)&control, 0, sizeof(control));
	memset((void *)&cap_io, 0, sizeof(cap_io));
	*P_INT2_Ctrl &= ~C_IRQ6_CTSTMA;
	*P_INT2_Status |= C_IRQ6_CTSTMA;
	*P_CTS_Ctrl0 = 0;
	*P_CTS_Ctrl1 = 0;
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void isr_cts_tma(void)
{
	control.conversion = *P_CTS_CAPTMB;
	control.state.bits.ok = 1;
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void open_cts_conversion(cts_io *io)
{
	cts_ctrl0 ctr0;

	control.state.bits.ok = 0;

	ctr0.bytes = *P_CTS_Ctrl0;
	ctr0.bits.port = io->port;
	ctr0.bits.pin = io->pin;
	*P_CTS_Ctrl0 = ctr0.bytes;

	*P_CTS_TMBCNT = 0;
	cts_ctrl_start();
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
u8 how_many_cts_pads(void)
{
	return cts_pads;
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
u16 read_cts_value(u16 channel)
{
	if (channel >= cts_pads)
	{
		return 0;
	}
	return cap_io[channel].buf[0];
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
#define CTS_TOUCH_SENSITIVE (100)	 // the smaller value ,the higher sensitive
#define CTS_EFFECTIVE_DEBOUNCE (3) // valid value for debouce
#define CTS_WAVE_TOLERANCE (50)		 // CTS_TOUCH_SENSITIVE / 2
void process_cap_measure(cts_user *fifo, u16 dat)
{
	u16 i, min, max, diff, average, amount;
	// squeeze a byte into array
	for (i = CTS_FIFO_DEEP - 1; i > 0; i--)
	{
		fifo->buf[i] = fifo->buf[i - 1];
	}
	fifo->buf[0] = dat;

	// check whether has been ready
	for (i = 0; i < CTS_FIFO_DEEP; i++)
	{
		if (fifo->buf[i] == 0)
			return;
	}

	// find out the maximum and minimum value
	max = 0;
	min = 0xffff;
	for (i = 0; i < CTS_FIFO_DEEP; i++)
	{
		min = (fifo->buf[i] <= min) ? fifo->buf[i] : min;
		max = (fifo->buf[i] >= max) ? fifo->buf[i] : max;
	}

	// renew the key variables
	diff = max - min;
	average = (u32)(max + min) / 2;
	if (diff < CTS_WAVE_TOLERANCE)
	{
		if (average > fifo->threshold_value)
		{
			fifo->idle_value = average;
			fifo->threshold_value = fifo->idle_value - CTS_TOUCH_SENSITIVE;
			fifo->state.bits.reported = 0;
		}
		return;
	}

	// report event
	if (fifo->state.bits.reported == 0)
	{
		amount = 0;
		for (i = 0; i < CTS_FIFO_DEEP; i++)
		{
			if (fifo->buf[i] < fifo->threshold_value)
			{
				amount++;
				if (amount > CTS_EFFECTIVE_DEBOUNCE)
				{
					fifo->state.bits.active = 1;
					fifo->state.bits.reported = 1;
				}
			}
		}
	}
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void task_cts_process(osvar_t ms)
{
	switch (control.step)
	{
	case 0:
		open_cts_conversion((cts_io *)&cts_gpio[control.index]);
		control.step++;
		break;

	default:
		if (control.state.bits.ok)
		{
			process_cap_measure(&cap_io[control.index], control.conversion);
			if (cap_io[control.index].state.bits.active)
			{
				cap_io[control.index].state.bits.active = 0;
				control.result = bitset(control.index);
			}

			control.index++;
			if (control.index >= cts_pads)
			{
				control.index = 0;
			}
			control.step = 0;
		}
		break;
	}
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
u16 read_cap_value(void)
{
	u16 res;
	res = control.result;
	control.result = 0;
	return res;
}
