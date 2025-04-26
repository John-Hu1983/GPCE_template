#include "../inc/includes.h"

#define IOPWM_CN_MAX (9)
/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void write_iopwm_duty(iopwm_obj *dev, u16 duty)
{
    handle_t *p;
    Pwm_Reg reg, orighin;

    if (dev->cn >= IOPWM_CN_MAX)
    {
        return;
    }
    p = P_PWM0_Ctrl + dev->cn;
    orighin.words = *p;
    if (orighin.bits.clk != dev->clk || orighin.bits.duty != duty)
    {
        *p = C_IOPWM_CNT_Clear;
        reg.words = 0;
        reg.bits.en = TRUE;
        reg.bits.clk = dev->clk;
        reg.bits.duty = duty;
        *p = reg.words;
    }
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void increase_iopwm_duty(iopwm_obj *dev, u16 max)
{
    handle_t *p;
    Pwm_Reg reg;
    if (dev->cn >= IOPWM_CN_MAX)
    {
        return;
    }
    p = P_PWM0_Ctrl + dev->cn;
    reg.words = *p;
    if (reg.bits.en == false)
    {
        reg.words = 0;
        reg.bits.en = TRUE;
        reg.bits.clk = dev->clk;
        reg.bits.duty = 1;
    }
    else
    {
        if (reg.bits.duty < max)
        {
            reg.bits.duty++;
        }
    }
    *p = reg.words;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void close_iopwm_total(void)
{
    *P_PWM0_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM1_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM2_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM3_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM4_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM5_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM6_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM7_Ctrl = C_IOPWM_CNT_Clear;
    *P_PWM8_Ctrl = C_IOPWM_CNT_Clear;
}
