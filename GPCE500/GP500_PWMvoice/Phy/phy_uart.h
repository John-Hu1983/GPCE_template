#ifndef _HAL_UART_H_
#define _HAL_UART_H_

#define UART_MEM_LEN (64)
typedef struct
{
    uint8_t buf[UART_MEM_LEN];
    uint8_t insert;
    uint8_t drag;
    uint8_t size;
} Uartmem_t;

typedef enum
{
    Baud_1200 = 0x10a9,
    Baud_2400 = 0x0854,
    Baud_9600 = 0x0214,
    Baud_14400 = 0x0162,
    Baud_19200 = 0x0109,
    Baud_28800 = 0x00b0,
    Baud_38400 = 0x0084,
    Baud_57600 = 0x0057,
    Baud_76800 = 0x0041,
    Baud_115200 = 0x002b,
    Baud_230400 = 0x0015,
    Baud_460800 = 0x000a,
} Baud_t;

#define UART_GPIO_A (0)
#define UART_GPIO_B (1)
#define UART_GPIO_SET (UART_GPIO_A)

#if UART_GPIO_SET == UART_GPIO_A

#define UART_PIN_TX (bitset(3))        // IOA3
#define UART_PIN_RX (bitset(2))        // IOA2
#define UART_GPIO_ATTRIBUTE (P_IOA_Attrib) // attribute
#define UART_GPIO_BUFFER (P_IOA_Buffer)    // buffer
#define UART_GPIO_DIR (P_IOA_Dir)          // direction
#define UART_GPIO_BASE (ADDR_BASE_PORTA)   // base memory

#else

#define UART_PIN_TX (bitset(15))       // IOB15
#define UART_PIN_RX (bitset(14))       // IOB14
#define UART_GPIO_ATTRIBUTE (P_IOB_Attrib) // attribute
#define UART_GPIO_BUFFER (P_IOB_Buffer)    // buffer
#define UART_GPIO_DIR(P_IOB_Dir)           // direction
#define UART_GPIO_BASE (ADDR_BASE_PORTB)   // base memory

#endif

typedef union
{
    uint16_t byte;
    struct
    {
        unsigned SB : 1;    // b0
        unsigned PEN : 1;   // b1
        unsigned PSEL : 1;  // b2
        unsigned SBSEL : 1; // b3
        unsigned FEN : 1;   // b4
        unsigned WLSEL : 2; // b6 ~ b5
        unsigned NOUSE : 4; // b10 ~ b7
        unsigned RST : 1;   // b11
        unsigned UEN : 1;   // b12
        unsigned RTIE : 1;  // b13
        unsigned TXIE : 1;  // b14
        unsigned RXIE : 1;  // b15
    } bits;
} Uart_Ctrl;

typedef union
{
    uint16_t byte;
    struct
    {
        unsigned UARTDATA : 8; // b7 ~ b0
        unsigned FE : 1;       // b8
        unsigned PE : 1;       // b9
        unsigned BE : 1;       // b10
        unsigned OE : 1;       // b11
        unsigned NOUSE : 4;    // b15 ~ b12
    } bits;
} Uart_Data;

typedef union
{
    uint16_t byte;
    struct
    {
        unsigned FE : 1;     // b0
        unsigned PE : 1;     // b1
        unsigned BE : 1;     // b2
        unsigned OE : 1;     // b3
        unsigned NOUSE : 12; // b15 ~ b4
    } bits;
} Uart_RX_Status;

typedef union
{
    uint16_t byte;
    struct
    {
        unsigned B2B0 : 3;
        unsigned BUSYF : 1;

        unsigned RXEF : 1;
        unsigned TXFF : 1;
        unsigned RXFF : 1;
        unsigned TXEF : 1;

        unsigned B12B8 : 5;
        unsigned RTIF : 1;
        unsigned TXIF : 1;
        unsigned RXIF : 1;
    } bits;
} Uart_Status;

void init_uart_equipment(Baud_t baudround);
void task_uart_process(osvar_t ms);
void insert_tx_fifo(char *fifo);
bool is_uart_tx_free(void);
op_res extract_rx_byte(u8 *rd);

#endif
