#include "../inc/includes.h"

#define ADC_CN_IOA11 (1)
#define ADC_CN_IOA10 (0)
#define ADC_CN_IOA09 (0)
#define ADC_CN_IOA08 (0)
#define ADC_CN_IOA07 (1)
#define ADC_CN_PGAO (0)
#define ADC_CN_HALF_V50 (0)
#define ADC_CN_IN_V12 (1) // V12 = 1.162V

const adc_attribute_t attribute[] = {
#if ADC_CN_IOA11
    {C_CMPADC_INN_IOA11, 3},
#endif

#if ADC_CN_IOA10
    {C_CMPADC_INN_IOA10, 3},
#endif

#if ADC_CN_IOA09
    {C_CMPADC_INN_IOA9, 3},
#endif

#if ADC_CN_IOA08
    {C_CMPADC_INN_IOA8, 3},
#endif

#if ADC_CN_IOA07
    {C_CMPADC_INN_IOA7, 3},
#endif

#if ADC_CN_PGAO
    {C_CMPADC_INN_PGAO, 3},
#endif

#if ADC_CN_HALF_V50
    {C_CMPADC_INN_V50_DIV2, 3},
#endif

#if ADC_CN_IN_V12
    {C_CMPADC_INN_V12, 3},
#endif

};
const u8 ADC_SIZE = sizeof(attribute) / sizeof(attribute[0]);
adc_obj adc_group[sizeof(attribute) / sizeof(attribute[0])];
adc_ctr adc_dev;

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void init_adc_equipment(void)
{
    u8 i;
    memset((void *)&adc_dev, 0, sizeof(adc_dev));
    for (i = 0; i < ADC_SIZE; i++)
    {
        adc_group[i].attr = (adc_attribute_t *)&attribute[i];
        adc_group[i].average = 0;
        adc_group[i].count = 0;
    }
#if ADC_TRIGGER_BY_TIM == 0
    enable_adc_channel();
#endif

#if ADC_CN_IOA11
    gpio_init_pattern(GPCE_PA, 11, io_input_float);
#endif

#if ADC_CN_IOA10
    gpio_init_pattern(GPCE_PA, 10, io_input_float);
#endif

#if ADC_CN_IOA09
    gpio_init_pattern(GPCE_PA, 9, io_input_float);
#endif

#if ADC_CN_IOA08
    gpio_init_pattern(GPCE_PA, 8, io_input_float);
#endif

#if ADC_CN_IOA07
    gpio_init_pattern(GPCE_PA, 7, io_input_float);
#endif

    *P_CMPADC_Ctrl0 = C_CMPADC_Discharge_Enable |
                      C_CMPADC_SH_4us |
                      C_CMPADC_Hysteresis_Enable |
                      C_CMPADC_IBIAS_30uA |
                      C_CMPADC_Enable;

    *P_CMPADC_Ctrl1 = C_CMPADC_Auto_Disable |
                      C_CMPADC_CMPO_None |
                      C_CMPADC_Manual |
                      C_CMPADC_Start;

    *P_CMPADC_Status = C_CMPADC_INT_Flag |
                       C_CMPADC_Timeout_Flag;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void open_adc_channel(u8 idx)
{
    if (idx >= ADC_SIZE)
    {
        idx = 0;
    }

    *P_CMPADC_Ctrl0 &= ~C_CMPADC_INN_Sel;
    *P_CMPADC_Ctrl0 |= adc_group[idx].attr->channel;
    *P_CMPADC_Ctrl0 &= ~(C_CMPADC_Discharge_Enable);
    adc_dev.flag.bits.go = TRUE;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void enable_adc_channel(void)
{
    adc_dev.index = 0;
    adc_dev.flag.byte = 0;
    adc_dev.flag.bits.enable = TRUE;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void pause_adc_conversion(void)
{
    adc_dev.flag.bits.enable = FALSE;
}

/*
 * argument in	:
                    C_CMPADC_INN_IOA11
                    C_CMPADC_INN_IOA10
                    C_CMPADC_INN_IOA9
                    C_CMPADC_INN_IOA8
                    C_CMPADC_INN_IOA7
                    C_CMPADC_INN_PGAO
                    C_CMPADC_INN_V50_DIV2
                    C_CMPADC_INN_V12
 * argument out	:	none
 * descrition	:
 */
u16 read_adc_by_cn(u16 cn)
{
    u16 i, val = 0;
    for (i = 0; i < ADC_SIZE; i++)
    {
        if (cn == adc_group[i].attr->channel)
        {
            val = adc_group[i].average;
            break;
        }
    }
    return val;
}

/*
 * argument in	:
                    C_CMPADC_INN_IOA11
                    C_CMPADC_INN_IOA10
                    C_CMPADC_INN_IOA9
                    C_CMPADC_INN_IOA8
                    C_CMPADC_INN_IOA7
                    C_CMPADC_INN_PGAO
                    C_CMPADC_INN_V50_DIV2
                    C_CMPADC_INN_V12
 * argument out	:	none
 * descrition	:
 */
#define VOL_REFERENCE_MV (1230)
u16 read_adc_vol_mv(u16 adc_id)
{
    u16 half_vdd, target, voltage;
    half_vdd = read_adc_by_cn(C_CMPADC_INN_V12);
    target = read_adc_by_cn(adc_id);
    voltage = (float)target * (float)VOL_REFERENCE_MV / half_vdd;
    return voltage;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void hal_adc_process(osvar_t ms)
{
    u16 adc;

    if (!adc_dev.flag.bits.enable)
    {
        return;
    }

    if (adc_dev.flag.bits.go)
    {
        if (*P_CMPADC_Status & C_CMPADC_INT_Flag)
        {
            *P_CMPADC_Ctrl0 |= C_CMPADC_Discharge_Enable;
            *P_CMPADC_Status = C_CMPADC_INT_Flag | C_CMPADC_Timeout_Flag;
            adc = *P_CMPADC_Data;

            adc_dev.flag.bits.go = 0;

            adc_group[adc_dev.index].count += adc;
            adc_group[adc_dev.index].average = adc_group[adc_dev.index].count >> adc_group[adc_dev.index].attr->filter;
            adc_group[adc_dev.index].count -= adc_group[adc_dev.index].average;

            adc_dev.index++;
            if (adc_dev.index >= ADC_SIZE)
            {
                adc_dev.flag.bits.enable = FALSE;
#if ADC_TRIGGER_BY_TIM == 0
                enable_adc_channel();
#endif
            }
        }
    }
    else
    {
        open_adc_channel(adc_dev.index);
    }
}
