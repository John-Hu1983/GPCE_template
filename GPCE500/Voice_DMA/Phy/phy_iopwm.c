#include "../inc/includes.h"

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:   different from GPCE100, GPCE500 have 9 channels IOPWM
 */
#define IOPWM_CN_MAX (9)
op_res set_iopwm_pattern(u8 cn, iopwm_clk_t clk_s, u16 pulse)
{
    handle_t *first = (handle_t *)0x3020;
    handle_t *p;
    iopwm_ctr_t reg, orighin;

    if (cn >= IOPWM_CN_MAX)
    {
        return (op_para_error);
    }

    p = first + cn;
    orighin.words = *p;
    if (orighin.bits.clk != clk_s || orighin.bits.duty != pulse)
    {
        *p = C_IOPWM_CNT_Clear;
        reg.words = 0;
        reg.bits.clear = 0;
        reg.bits.en = TRUE;
        reg.bits.mask = 0;
        reg.bits.clk = clk_s;
        reg.bits.duty = pulse;
        *p = reg.words;
    }
    return op_success;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void write_iopwm_by_struct(iopwm_obj *dev, u16 duty)
{
    (void)set_iopwm_pattern(dev->cn, dev->clk, duty);
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
