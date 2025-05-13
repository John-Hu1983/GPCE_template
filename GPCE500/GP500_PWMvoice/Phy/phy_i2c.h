#ifndef HAL_I2C_H_
#define HAL_I2C_H_
typedef enum
{
    I2C_IO_SCL = 0,
    I2C_IO_SDA,
    I2C_IO_MAX,
} i2c_io_name;

void init_i2c_gpio(void);
void IIC_Start(void);
void IIC_Stop(void);
void IIC_Wait_Ack(void);
void Write_IIC_Byte(u8 IIC_Byte);
void Write_IIC_Command(u8 IIC_Command);
void Write_IIC_Data(u8 IIC_Data);
#endif
