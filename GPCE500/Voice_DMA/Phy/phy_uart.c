#include "../inc/includes.h"

#define UART_SEND_EN (1)
#define UART_RECV_EN (1)

#if UART_SEND_EN
Uartmem_t tx_fifo;
#endif

#if UART_RECV_EN
Uartmem_t rx_fifo;
#endif

#if UART_GPIO_SET == UART_GPIO_A
const gpio_obj RXD = {GPCE_PA, 2};
const gpio_obj TXD = {GPCE_PA, 3};
#else
const gpio_obj RXD = {GPCE_PB, 14};
const gpio_obj TXD = {GPCE_PB, 15};
#endif

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void init_uart_equipment(Baud_t baudround)
{
    Uart_Ctrl uartctr;

#if UART_GPIO_SET == UART_GPIO_A
    *P_IO_Ctrl &= ~bitset(1);
#else
    *P_IO_Ctrl |= bitset(1);
#endif
    gpio_init_pattern(RXD.port, RXD.pin, io_input_pullup);
    gpio_init_pattern(RXD.port, TXD.pin, io_output_normal);

    for (;;)
    {
        uartctr.byte = 0; // initialize
#if UART_RECV_EN
        uartctr.bits.FEN = 0;  // FIFO
        uartctr.bits.RXIE = 1; // receive irq enable
#else
        uartctr.bits.FEN = 1;  // FIFO
        uartctr.bits.RXIE = 0; // receive irq enable
#endif
        uartctr.bits.UEN = 1;        // URAT interface ENABLE
        uartctr.bits.RST = 1;        // clear FIFO
        uartctr.bits.WLSEL = 3;      // (00) 5bit (01) 6bit (10) 7bit (11) 8bit
        uartctr.bits.SBSEL = 0;      // (0) 1stop bit  (1) 2 stop bit
        uartctr.bits.PSEL = 0;       // (0) Odd parity (1) even parity
        uartctr.bits.PEN = 0;        // (0) parity checking disenable (1) parity checking enable
        uartctr.bits.SB = 0;         // (0) Normal operation (1) Send break signal
        *P_UART_Ctrl = uartctr.byte; // load config
        if ((uartctr.byte & (~bitset(11))) != *P_UART_Ctrl)
            continue;
        break;
    }
    *P_UART_BaudRate = baudround;    // load baud rate
    *P_INT2_Status |= bitset(3); // clear flag

#if UART_SEND_EN
    memset((void *)&tx_fifo, 0, sizeof(tx_fifo));
#endif

#if UART_RECV_EN
    memset((void *)&rx_fifo, 0, sizeof(rx_fifo));
    *P_INT2_Ctrl |= C_IRQ7_UART;
    *P_INT2_Status |= C_IRQ7_UART;
#endif
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void insert_tx_fifo(char *fifo)
{
    while (1)
    {
        if (*fifo == '\0')
        {
            break;
        }

        tx_fifo.buf[tx_fifo.insert++] = *fifo;
        tx_fifo.size++;
        if (tx_fifo.insert >= UART_MEM_LEN)
        {
            tx_fifo.insert = 0;
        }

        if (++fifo == null)
        {
            break;
        }
    }
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
op_res extract_rx_byte(u8 *rd)
{
    op_res res;
    if (rx_fifo.size == 0)
    {
        res = op_empty;
    }
    else
    {
        res = op_success;
        *rd = rx_fifo.buf[rx_fifo.drag++];
        if (rx_fifo.drag >= UART_MEM_LEN)
        {
            rx_fifo.drag = 0;
        }
        rx_fifo.size--;
    }
    return res;
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void cb_uart_irq7(void)
{
    u8 rec;
    if (*P_INT2_Status & C_IRQ7_UART)
    {
        *P_INT2_Status |= C_IRQ7_UART;
        if (!(*P_UART_Status & C_UART_RX_FIFO_Empty_Flag))
        {
            rec = *P_UART_Data;
            rx_fifo.buf[rx_fifo.insert++] = rec & 0xff;
            if (rx_fifo.insert >= UART_MEM_LEN)
            {
                rx_fifo.insert = 0;
            }
            rx_fifo.size++;
        }
    }
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
bool_t is_uart_tx_free(void)
{
    return (tx_fifo.size) ? false : true;
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void task_uart_process(osvar_t ms)
{
    if (!(*P_UART_Status & C_UART_TX_FIFO_Full_Flag) && tx_fifo.size)
    {
        *P_UART_Data = tx_fifo.buf[tx_fifo.drag++];
        tx_fifo.size--;
        if (tx_fifo.drag >= UART_MEM_LEN)
        {
            tx_fifo.drag = 0;
        }
    }
}
