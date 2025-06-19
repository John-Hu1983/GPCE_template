#ifndef _HAL_SPI_H_
#define _HAL_SPI_H_

#define SPI_GPIO_IOA 0
#define SPI_GPIO_IOB 1
#define SPI_GPIO_SET SPI_GPIO_IOB

#if SPI_GPIO_SET == SPI_GPIO_IOA
#define C_SPI_MOSI_Bit (bitset(3))
#define C_SPI_MISO_Bit (bitset(2))
#define C_SPI_SCK_Bit (bitset(1))

#define PP_SPI_Dir (P_IOA_Dir)
#define PP_SPI_Attrib (P_IOA_Attrib)
#define PP_SPI_Buffer (P_IOA_Buffer)

#else
#define C_SPI_MOSI_Bit (bitset(15))
#define C_SPI_MISO_Bit (bitset(14))
#define C_SPI_SCK_Bit (bitset(13))

#define PP_SPI_Dir (P_IOB_Dir)
#define PP_SPI_Attrib (P_IOB_Attrib)
#define PP_SPI_Buffer (P_IOB_Buffer)
#endif

#define PP_SPI_Ctrl (P_SPI2_Ctrl)
#define PP_SPI_TX_Status (P_SPI2_TX_Status)
#define PP_SPI_TX_Data (P_SPI2_TX_Data)
#define PP_SPI_RX_Status (P_SPI2_RX_Status)
#define PP_SPI_RX_Data (P_SPI2_RX_Data)
#define PP_SPI_Misc (P_SPI2_Misc)

#define SPI_SEND_BUSY while (*PP_SPI_Misc & C_SPI_Busy_Flag)
#define SPI_READ_BUSY while (!(*PP_SPI_RX_Status & 0xf))
#define WAIT_SPI_TX_NONFULL while (!(*PP_SPI_Misc & C_SPI_TX_NonFull_Flag))

void open_spi_module(void);
void write_spi_byte(u8 reg, u8 dat, gpio_obj *cs);
u8 read_spi_byte(u8 reg, gpio_obj *cs);
void write_spi_batch(u8 *buf, u16 len);
void read_spi_batch(u8 *buf, u16 len);

void start_spidma_sent(u8 *dat, u16 len);
bool_t is_spidma_sent_over(void);
void cb_resume_cs_for_gpio(void);
#endif
