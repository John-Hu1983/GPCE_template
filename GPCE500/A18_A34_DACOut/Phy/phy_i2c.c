#include "../inc/includes.h"

static const gpio_obj I2C_SDA = {GPCE_PA, 7};
static const gpio_obj I2C_SCL = {GPCE_PA, 8};

#define I2C_SDA_READ gpio_read_level(I2C_SDA.port, I2C_SDA.pin)
#define I2C_SDA_SET gpio_write_level(I2C_SDA.port, I2C_SDA.pin, TRUE)
#define I2C_SDA_CLR gpio_write_level(I2C_SDA.port, I2C_SDA.pin, FALSE)
#define I2C_SCL_SET gpio_write_level(I2C_SCL.port, I2C_SCL.pin, TRUE)
#define I2C_SCL_CLR gpio_write_level(I2C_SCL.port, I2C_SCL.pin, FALSE)

/*
 * purpose			:	initialize I2C interface
 * argument in	:	none
 * argument out	:	none
 */
void i2c_init_interface(void)
{
	gpio_setout_with_level(I2C_SDA.port, I2C_SDA.pin, TRUE);
	gpio_setout_with_level(I2C_SCL.port, I2C_SCL.pin, TRUE);
}

/*
 * purpose			:	set SDA direction as output
 * argument in	:	none
 * argument out	:	none
 */
void i2c_SDA_outdir(void)
{
	gpio_init_pattern(I2C_SDA.port, I2C_SDA.pin, io_output_normal);
}

/*
 * purpose			:	set SDA direction as input
 * argument in	:	none
 * argument out	:	none
 */
void i2c_SDA_input(void)
{
	gpio_init_pattern(I2C_SDA.port, I2C_SDA.pin, io_input_pullup);
}

/*
 * purpose			:	generate Start signal
 * argument in	:	none
 * argument out	:	none
 */
void i2c_start_signal(void)
{
	i2c_SDA_outdir();
	I2C_SDA_SET;
	I2C_SCL_SET;
	delay_us(4);
	I2C_SDA_CLR;
	delay_us(4);
	I2C_SCL_CLR;
}

/*
 * purpose			:	generate Stop signal
 * argument in	:	none
 * argument out	:	none
 */
void i2c_stop_signal(void)
{
	i2c_SDA_outdir();
	I2C_SCL_CLR;
	I2C_SDA_CLR;
	delay_us(4);
	I2C_SCL_SET;
	I2C_SDA_SET;
	delay_us(4);
}

/*
 * purpose			:	wait ack signal
 * argument in	:	none
 * argument out	:	0 success; 1 fail
 */
u8 i2c_wait_ack(void)
{
	u8 ucErrTime = 0;
	i2c_SDA_input();
	I2C_SDA_SET;
	delay_us(1);
	I2C_SCL_SET;
	delay_us(1);
	while (I2C_SDA_READ)
	{
		ucErrTime++;
		if (ucErrTime > 250)
		{
			i2c_stop_signal();
			return 1;
		}
	}
	I2C_SCL_CLR;
	return 0;
}

/*
 * purpose			:	generate ack signal
 * argument in	:	none
 * argument out	:	0 success; 1 fail
 */
void i2c_ack_signal(void)
{
	I2C_SCL_CLR;
	i2c_SDA_outdir();
	I2C_SDA_CLR;
	delay_us(2);
	I2C_SCL_SET;
	delay_us(2);
	I2C_SCL_CLR;
}

/*
 * purpose			:	generate NOack signal
 * argument in	:	none
 * argument out	:	0 success; 1 fail
 */
void i2c_NOack_signal(void)
{
	I2C_SCL_CLR;
	i2c_SDA_outdir();
	I2C_SDA_SET;
	delay_us(2);
	I2C_SCL_SET;
	delay_us(2);
	I2C_SCL_CLR;
}

/*
 * purpose			:	send 1 byte
 * argument in	:	none
 * argument out	:
 */
void i2c_send_byte(u8 txd)
{
	u8 t;
	i2c_SDA_outdir();
	I2C_SCL_CLR;

	for (t = 0; t < 8; t++)
	{
		((txd & 0x80) >> 7) ? I2C_SDA_SET : I2C_SDA_CLR;
		txd <<= 1;
		delay_us(2);
		I2C_SCL_SET;
		delay_us(2);
		I2C_SCL_CLR;
		delay_us(2);
	}
}

/*
 * purpose			:	read 1 byte
 * argument in	:	1 send ack; 0 send NOack
 * argument out	:
 */
u8 i2c_read_byte(u8 ack)
{
	u8 i, receive = 0;
	i2c_SDA_input();
	for (i = 0; i < 8; i++)
	{
		I2C_SCL_CLR;
		delay_us(2);
		I2C_SCL_SET;
		receive <<= 1;
		if (I2C_SDA_READ)
			receive++;
		delay_us(1);
	}

	(ack) ? i2c_ack_signal() : i2c_NOack_signal();
	return receive;
}
