#include "../inc/includes.h"

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 *                  IOA00: CS -> Output High
                    IOA01: CLK -> Output Low
                    IOA02: MISO -> Input pull low
                    IOA03: MOSI -> Output Low

                    IOB12: CS -> Output High
                    IOB13: CLK -> Output Low
                    IOB14: MISO -> Input pull low
                    IOB15: MOSI -> Output Low
 */
void open_spi_private(void)
{
#if SPI_GPIO_SET == SPI_GPIO_IOA
    *P_IO_Ctrl &= ~(C_Bit0);
    gpio_setout_with_level(GPCE_PA, 3, 0);
    gpio_init_pattern(GPCE_PA, 2, io_input_pulldown);
    gpio_setout_with_level(GPCE_PA, 1, 0);
#else
    *P_IO_Ctrl |= C_Bit0;
    gpio_setout_with_level(GPCE_PB, 15, 0);
    gpio_init_pattern(GPCE_PB, 14, io_input_pulldown);
    gpio_setout_with_level(GPCE_PB, 13, 0);
    // gpio_setout_with_level(GPCE_PB, 12, 1);
#endif

    *P_SPI2_Ctrl = C_SPI_Enable |             // enable
                   C_SPI_CS_GPIO |            // cs by GPIO
                   C_SPI_MultiIO_Sel_1IO |    // 1 data pattern
                   C_MasterMode |             // host mode
                   C_SPI_Clock_Phase_Normal | // 0- rising edge 1- falling edge
                   C_SPI_Clock_Pol_Normal |   // 0 - idle low lever 1- idle high lever
                   C_SPI_SCK_SYSCLK_Div_16;   // clock division

#if SPI_DMA_EN
    *P_SPI2_Man_Ctrl = C_SPI_Manual_Output;
#endif

    *P_SPI2_TX_Status = C_SPI_TX_INT_Flag | C_SPI_TX_INT_DIS | C_SPI_TX_FIFO_Level_0;
    *P_SPI_RX_Status = C_SPI_RX_INT_Flag | C_SPI_RX_INT_DIS | C_SPI_RX_FIFO_Level_1;
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void start_spidma_sent(u8 *dat, u16 len)
{
#if SPI_DMA_EN
    if (len)
    {
        *P_SPI2_Ctrl |= C_SPI_CS_SPI;
        *P_DMA1_DTN = len;
        *P_DMA1_SRCADR = (unsigned)(unsigned long)dat;
        *P_DMA1_DSTADR = (unsigned)P_SPI2_TX_Data;

        *P_DMA_INTSTS |= C_DMA1_TX_Done_Flag;
        *P_DMA1_CTRL0 = C_DMA_Request_SPI2 | C_DMA_Src_Inc_Enable |
                        C_DMA_Dest_Inc_Disable | C_DMA_Enable;
        *P_SPI2_Man_Ctrl |= C_SPI_TX_DMA_Enable;
        while (!is_spidma_sent_over())
        {
            WatchdogClear();
        }
        *P_SPI2_Ctrl &= ~C_SPI_CS_SPI;
    }
#endif
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
bool is_spidma_sent_over(void)
{
    bool res = TRUE;
    if (*P_DMA1_CTRL1 & C_DMA_Busy_Flag || *P_SPI2_Misc & C_SPI_Busy_Flag)
    {
        res = FALSE;
    }
    return res;
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void transmit_spi_fifo(u8 *buf, u8 len)
{
    u8 sent = 0;
    while (1)
    {
#if WATCH_DOG_ENABLE > 0
        WatchdogClear();
#endif

        if (*PP_SPI_Misc & C_SPI_TX_NonFull_Flag) // b1 = 1 , transmit fifo is not full
        {
            *PP_SPI_TX_Data = buf[sent];
            sent++;
        }

        if (sent >= len)
        {
            break;
        }
    }
    SPI_SEND_BUSY;
    *PP_SPI_Misc = 0;
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
u8 receive_spi_fifo(u8 *rec)
{
    u8 len = 0;
    while (*PP_SPI_Misc & bitset(2))
    {
        rec[len++] = *PP_SPI_RX_Data;
    }
    return len;
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void write_spi_byte(u8 reg, u8 dat, gpio_obj *cs)
{
    gpio_write_level(cs->port, cs->pin, FALSE);
    *PP_SPI_TX_Data = reg;
    *PP_SPI_TX_Data = dat;
    SPI_SEND_BUSY;
    *PP_SPI_Misc = 0;
    gpio_write_level(cs->port, cs->pin, TRUE);
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
u8 read_spi_byte(u8 reg, gpio_obj *cs)
{
    u8 rd;
    while (*PP_SPI_Misc & bitset(2)) // clear FIFO
    {
        rd = *PP_SPI_RX_Data;
    }
    gpio_write_level(cs->port, cs->pin, FALSE);

    *PP_SPI_TX_Data = reg;
    *PP_SPI_TX_Data = 0x00;
    SPI_SEND_BUSY;
    SPI_READ_BUSY;
    while (*PP_SPI_Misc & bitset(2))
    {
        rd = *PP_SPI_RX_Data;
    }
    *PP_SPI_Misc = 0;
    gpio_write_level(cs->port, cs->pin, TRUE);
    return rd;
}
