#include "../inc/includes.h"

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:   for example
 *                  	gpio_init_pattern(GPCE_PB, 4, io_output_normal);
 *	                    gpio_init_pattern(GPCE_PB, 5, io_output_inverted);
 */
void gpio_init_pattern(handle_t *port, uint8_t pin, GPIO_Pattern pattern)
{
    switch (pattern)
    {
    case io_input_pulldown:
        *((handle_t *)(port + io_direction)) &= (~bitset(pin));
        *((handle_t *)(port + io_attribute)) &= (~bitset(pin));
        *((handle_t *)(port + io_buff_rewr)) &= (~bitset(pin));
        break;

    case io_input_pullup:
        *((handle_t *)(port + io_direction)) &= (~bitset(pin));
        *((handle_t *)(port + io_attribute)) &= (~bitset(pin));
        *((handle_t *)(port + io_buff_rewr)) |= bitset(pin);
        break;

    case io_input_float:
        *((handle_t *)(port + io_direction)) &= (~bitset(pin));
        *((handle_t *)(port + io_attribute)) |= bitset(pin);
        *((handle_t *)(port + io_buff_rewr)) &= (~bitset(pin));
        break;

    case io_output_normal:
        *((handle_t *)(port + io_direction)) |= bitset(pin);
        *((handle_t *)(port + io_attribute)) |= bitset(pin);
        break;

    case io_output_inverted:
        *((handle_t *)(port + io_direction)) |= bitset(pin);
        *((handle_t *)(port + io_attribute)) &= (~bitset(pin));
        break;
    }
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void gpio_setout_with_level(handle_t *port, uint8_t pin, bool lev)
{
    gpio_init_pattern(port, pin, io_output_normal);
    gpio_write_level(port, pin, lev);
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
bool gpio_read_level(handle_t *port, uint8_t pin)
{
    bool lev = 0;
    if (*((handle_t *)(port + io_data_read)) & bitset(pin))
        lev = 1;

    return lev;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void gpio_write_level(handle_t *port, uint8_t pin, bool lev)
{
    if (lev)
        *((handle_t *)(port + io_buff_rewr)) |= bitset(pin);
    else
        *((handle_t *)(port + io_buff_rewr)) &= (~bitset(pin));
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void gpio_invert_level(handle_t *port, uint8_t pin)
{
    if (*((handle_t *)(port + io_buff_rewr)) & bitset(pin))
        *((handle_t *)(port + io_buff_rewr)) &= (~bitset(pin));
    else
        *((handle_t *)(port + io_buff_rewr)) |= bitset(pin);
}
