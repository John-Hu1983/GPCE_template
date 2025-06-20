#ifndef _DEV_BUTTON_H_
#define _DEV_BUTTON_H_

typedef struct
{
    gpio_obj io;
    GPIO_Pattern patt;
    bool effective;
    u16 threshold;
    u16 release;
} btn_io;

typedef struct
{
    btn_io *pin;
    u8 step;
    u16 debounce;
} btn_obj;

btnval_t scan_btn_object(btn_obj *btn, osvar_t ms);
#endif
