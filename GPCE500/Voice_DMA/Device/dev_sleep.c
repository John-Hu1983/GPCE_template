#include "../inc/includes.h"

/*****************************************************************
 * function		:
 * argument in	:
 * argument out	:
 * descrition	:
 * ***************************************************************/
void sleep_init_gpio(void)
{
    u8 level = 0;
    gpio_setout_with_level(GPCE_PA, 0, 0);
    gpio_setout_with_level(GPCE_PA, 1, 0);
    gpio_setout_with_level(GPCE_PA, 2, 0);
    gpio_setout_with_level(GPCE_PA, 3, 0);
    gpio_setout_with_level(GPCE_PA, 4, 0);
    gpio_setout_with_level(GPCE_PA, 5, 0);
    gpio_setout_with_level(GPCE_PA, 6, 0);
    gpio_setout_with_level(GPCE_PA, 7, 0);
    gpio_setout_with_level(GPCE_PA, 8, 0);
#if 1
    gpio_init_pattern(GPCE_PA, 9, io_input_float);
    gpio_init_pattern(GPCE_PA, 10, io_input_float);
#else
    gpio_setout_with_level(GPCE_PA, 9, 0);
    gpio_setout_with_level(GPCE_PA, 10, 0);
#endif
    gpio_setout_with_level(GPCE_PA, 11, 0);
    gpio_setout_with_level(GPCE_PA, 12, 0);
    gpio_setout_with_level(GPCE_PA, 13, 0);
    gpio_setout_with_level(GPCE_PA, 14, 0);
    gpio_setout_with_level(GPCE_PA, 15, 0);

    *P_IOB_PL1M |= 0X3;
    if (gpio_read_level(GPCE_PB, 0))
        level |= bitset(0);
    if (gpio_read_level(GPCE_PB, 1))
        level |= bitset(1);

    switch (level)
    {
    case 0:
        gpio_init_pattern(GPCE_PB, 0, io_input_pulldown);
        gpio_init_pattern(GPCE_PB, 1, io_input_pulldown);
        break;

    case 1:
        gpio_init_pattern(GPCE_PB, 0, io_input_float);
        gpio_init_pattern(GPCE_PB, 1, io_input_pulldown);
        break;

    case 2:
        gpio_init_pattern(GPCE_PB, 0, io_input_pulldown);
        gpio_init_pattern(GPCE_PB, 1, io_input_float);
        break;

    case 3:
        gpio_init_pattern(GPCE_PB, 0, io_input_pulldown);
        gpio_init_pattern(GPCE_PB, 1, io_input_float);
        break;
    }

    gpio_setout_with_level(GPCE_PB, 2, 0);
    gpio_init_pattern(GPCE_PB, 3, io_input_pulldown);
    gpio_setout_with_level(GPCE_PB, 4, 1);
    gpio_setout_with_level(GPCE_PB, 5, 0);
    gpio_setout_with_level(GPCE_PB, 6, 1);
    gpio_setout_with_level(GPCE_PB, 7, 1);
    gpio_setout_with_level(GPCE_PB, 8, 0);
    gpio_setout_with_level(GPCE_PB, 9, 1);
    gpio_setout_with_level(GPCE_PB, 10, 0);
    gpio_setout_with_level(GPCE_PB, 11, 0);
    gpio_setout_with_level(GPCE_PB, 12, 1);
    gpio_setout_with_level(GPCE_PB, 13, 1);
    gpio_setout_with_level(GPCE_PB, 14, 1);
    gpio_setout_with_level(GPCE_PB, 15, 1);
}

/*****************************************************************
 * function		   :
 * argument in	   :	none
 * argument out	:	none
 * descrition	:
 * ***************************************************************/
void sleep_go_event(void)
{
    u16 debounce;
    close_iopwm_total();
    sleep_init_gpio();
    *P_IO_Ctrl = 0;
    *P_CTS_Ctrl1 = 0;
    *P_INT2_Ctrl &= ~C_IRQ6_CTSTMA;
    *P_UART_Ctrl = 0;
    GotoSleep(0);
    debounce = 0; 
    while (gpio_read_level(GPCE_PB, 3))
    {
        delay_ms(1);
        debounce++;
        if (debounce > 500)
            break;
    }

    init_board_global();
}
