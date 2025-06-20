#ifndef _SPIN_DRIVER_GPIO_H_
#define _SPIN_DRIVER_GPIO_H_

#define GPCE_PA (handle_t *)0X3000
#define GPCE_PB (handle_t *)0X3004
#define GPCE_PC (handle_t *)0X3008

typedef enum
{
    io_data_read = 0,
    io_buff_rewr,
    io_direction,
    io_attribute,
} GPIO_Offset;

typedef enum
{
    io_input_pulldown = 0,
    io_input_pullup,
    io_input_float,
    io_output_normal,
    io_output_inverted,
} GPIO_Pattern;

typedef struct
{
    handle_t *port;
    u8 pin;
} gpio_obj;

void gpio_init_pattern(handle_t *port, uint8_t pin, GPIO_Pattern pattern);
bool gpio_read_level(handle_t *port, uint8_t pin);
void gpio_write_level(handle_t *port, uint8_t pin, bool lev);
void gpio_invert_level(handle_t *port, uint8_t pin);
void gpio_setout_with_level(handle_t *port, uint8_t pin, bool lev);
#endif
