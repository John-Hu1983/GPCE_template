#include "../inc/includes.h"

const gpio_obj i2c_ios[I2C_IO_MAX] = {
    {GPCE_PB, 0},
    {GPCE_PB, 1},
};

#define IIC_SLAVE_ADDR 0x78

#define OLED_SDA_SET() gpio_write_level(i2c_ios[I2C_IO_SDA].port, i2c_ios[I2C_IO_SDA].pin, 1)
#define OLED_SDA_CLR() gpio_write_level(i2c_ios[I2C_IO_SDA].port, i2c_ios[I2C_IO_SDA].pin, 0)

#define OLED_SCL_SET() gpio_write_level(i2c_ios[I2C_IO_SCL].port, i2c_ios[I2C_IO_SCL].pin, 1)
#define OLED_SCL_CLR() gpio_write_level(i2c_ios[I2C_IO_SCL].port, i2c_ios[I2C_IO_SCL].pin, 0)

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void init_i2c_gpio(void)
{
    gpio_init_pattern(i2c_ios[I2C_IO_SCL].port, i2c_ios[I2C_IO_SCL].pin, io_output_normal);
    gpio_init_pattern(i2c_ios[I2C_IO_SDA].port, i2c_ios[I2C_IO_SDA].pin, io_output_normal);
    gpio_write_level(i2c_ios[I2C_IO_SDA].port, i2c_ios[I2C_IO_SDA].pin, 1);
    gpio_write_level(i2c_ios[I2C_IO_SCL].port, i2c_ios[I2C_IO_SCL].pin, 1);
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void IIC_Start(void)
{
    OLED_SCL_SET();
    OLED_SDA_SET();
    OLED_SDA_CLR();
    OLED_SCL_CLR();
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void IIC_Stop(void)
{
    OLED_SCL_SET();
    OLED_SDA_CLR();
    OLED_SDA_SET();
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void IIC_Wait_Ack(void)
{
    OLED_SCL_SET();
    OLED_SCL_CLR();
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void Write_IIC_Byte(u8 IIC_Byte)
{
    u8 i;
    u8 m, da;
    da = IIC_Byte;
    OLED_SCL_CLR();
    for (i = 0; i < 8; i++)
    {
        m = da;
        m = m & 0x80;
        if (m == 0x80)
        {
            OLED_SDA_SET();
        }
        else
        {
            OLED_SDA_CLR();
        }
        da = da << 1;
        OLED_SCL_SET();
        OLED_SCL_CLR();
    }
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void Write_IIC_Command(u8 IIC_Command)
{
    IIC_Start();
    Write_IIC_Byte(IIC_SLAVE_ADDR); // Slave address,SA0=0
    IIC_Wait_Ack();
    Write_IIC_Byte(0x00); // write command
    IIC_Wait_Ack();
    Write_IIC_Byte(IIC_Command);
    IIC_Wait_Ack();
    IIC_Stop();
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void Write_IIC_Data(u8 IIC_Data)
{
    IIC_Start();
    Write_IIC_Byte(IIC_SLAVE_ADDR); // D/C#=0; R/W#=0
    IIC_Wait_Ack();
    Write_IIC_Byte(0x40); // write data
    IIC_Wait_Ack();
    Write_IIC_Byte(IIC_Data);
    IIC_Wait_Ack();
    IIC_Stop();
}
