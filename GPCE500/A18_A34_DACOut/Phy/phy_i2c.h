#ifndef _PHY_I2C_H_
#define _PHY_I2C_H_

typedef enum
{
  I2c_Nack = 0,
  I2c_Ack,
} I2c_ack_t;

void i2c_init_interface(void);
void i2c_start_signal(void);
void i2c_stop_signal(void);
void i2c_send_byte(u8 txd);
u8 i2c_read_byte(unsigned char ack);
u8 i2c_wait_ack(void);
void i2c_ack_signal(void);
void i2c_NOack_signal(void);

void IIC_Write_One_Byte(u8 daddr, u8 addr, u8 data);
u8 IIC_Read_One_Byte(u8 daddr, u8 addr);
#endif
