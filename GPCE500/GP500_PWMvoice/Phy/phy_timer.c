#include "../inc/includes.h"

const Timer_User t_buf[] = {
    {P_TimerA_Data, P_TimerA_CNTR, 0, 15},
    {P_TimerB_Data, P_TimerB_CNTR, 4, 14},
    {P_TimerC_Data, P_TimerC_CNTR, 8, 13},
};

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void open_realtime_irq(void)
{
    *P_INT2_Ctrl |= bitset(C_IRQ6_2048Hz_NUM);
    *P_INT2_Status |= bitset(C_IRQ6_2048Hz_NUM);
}

/*
 * argument in	:
 * argument out	:
 * descrition	:
 */
void open_timer_isr(timer_name name, u16 us)
{
    Timer_User *tim = (Timer_User *)&t_buf[name];
    *tim->reload = us;
    *tim->counter = 0;
    *P_Timer_Ctrl |= Prescaler_Fsysclk_div16 << tim->clk_bit;
    *P_INT_Ctrl |= bitset(tim->isr_bit);
    *P_INT_Status |= bitset(tim->isr_bit);
    *P_FIQ_Sel &= ~bitset(tim->isr_bit);
}

/*
 * argument in	:
 * argument out	:
 * descrition	:
 */
void close_timer_isr(timer_name name)
{
    Timer_User *tim = (Timer_User *)&t_buf[name];
    *P_Timer_Ctrl &= ~(u16)(0xf << tim->clk_bit);
    *P_INT_Ctrl &= ~bitset(tim->isr_bit);
    *P_INT_Status |= bitset(tim->isr_bit);
}

/*
 * argument in	:
 * argument out	:
 * descrition	:
 */
void cb_irq0_tima(void)
{
}

/*
 * argument in	:
 * argument out	:
 * descrition	:
 */
void cb_irq1_timb(void)
{
}

/*
 * argument in	:
 * argument out	:
 * descrition	:
 */
void cb_irq2_timc(void)
{
}
