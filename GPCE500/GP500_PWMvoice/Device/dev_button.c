#include "../inc/includes.h"

#define KEY_LONGCLI_MS (800)

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
enum
{
    Btn_Step_Detect = 0,
    Btn_Step_Debounce,
    Btn_Step_Hold,
    Btn_Step_Release,
};
btnval_t scan_btn_object(btn_obj *btn, osvar_t ms)
{
    btnval_t res = BTN_IDLE;
    bool level;
    level = gpio_read_level(btn->pin->io.port, btn->pin->io.pin);
    switch (btn->step)
    {
    case Btn_Step_Detect:
        if (level == btn->pin->effective)
        {
            btn->debounce = 0;
            btn->step = Btn_Step_Debounce;
        }
        break;

    case Btn_Step_Debounce:
        if (level == btn->pin->effective)
        {
            btn->debounce += ms;
            if (btn->debounce > KEY_LONGCLI_MS)
            {
                btn->debounce = 0;
                btn->step = Btn_Step_Hold;
                res = BTN_HOLD;
            }
        }
        else
        {
            if (btn->debounce > btn->pin->threshold)
            {
                btn->debounce = 0;
                btn->step = Btn_Step_Release;
                res = BTN_CLICK;
            }
            else
            {
                btn->step = Btn_Step_Detect;
            }
        }
        break;

    case Btn_Step_Hold:
        if (level == btn->pin->effective)
        {
            res = BTN_HOLD;
            btn->debounce = 0;
        }
        else
        {
            btn->debounce += ms;
            if (btn->debounce > btn->pin->release)
            {
                btn->debounce = 0;
                btn->step = Btn_Step_Detect;
            }
        }
        break;

    default:
        if (level == btn->pin->effective)
        {
            btn->debounce = 0;
        }
        else
        {
            btn->debounce += ms;
            if (btn->debounce > btn->pin->release)
            {
                btn->debounce = 0;
                btn->step = Btn_Step_Detect;
            }
        }
        break;
    }
    return res;
}
