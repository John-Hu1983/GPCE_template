#include "../inc/includes.h"

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
    memset((void *)&adc_group, 0, sizeof(adc_group));
    for (i = 0; i < ADC_SIZE; i++)
    {
        adc_group[i].attr = (adc_attribute_t *)&attribute[i];
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
                      C_CMPADC_SH_8us |
                      C_CMPADC_Hysteresis_Enable |
                      C_CMPADC_IBIAS_60uA |
                      C_CMPADC_Enable;

    *P_CMPADC_Ctrl1 = C_CMPADC_Auto_Disable |
                      C_CMPADC_CMPO_None |
                      C_CMPADC_Manual |
                      C_CMPADC_Start;

    *P_CMPADC_Status = C_CMPADC_INT_Flag |
                       C_CMPADC_Timeout_Flag;

#if ADC_CONVERT_ISR
    open_adc_convertion();
    *P_INT_Ctrl |= bitset(C_IRQ3_ADC);
    *P_INT_Status |= bitset(C_IRQ3_ADC_NUM);
#endif
}

#if ADC_CONVERT_ISR
/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void open_adc_convertion(void)
{
    *P_CMPADC_Ctrl0 &= ~C_CMPADC_INN_Sel;
    *P_CMPADC_Ctrl0 |= C_CMPADC_INN_IOA11;
    adc_dev.index++;
    if (adc_dev.index >= ADC_SIZE)
    {
        adc_dev.index = 0;
    }
    *P_CMPADC_Ctrl0 |= C_CMPADC_Discharge_Enable;
}

#else
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
    *P_CMPADC_Ctrl0 &= ~C_CMPADC_Discharge_Enable;
    adc_dev.flag.bits.go = TRUE;
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
#if ADC_MEMORY_FILTER
            val = adc_group[i].value.average;
#else
            val = adc_group[adc_dev.index].fifo[0];
#endif
            break;
        }
    }
    return val;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
#define HALF_VDD_MV (1650)
u16 read_adc_vol_mv(u16 adc_id)
{
    u16 half_vdd, target, voltage;
    half_vdd = read_adc_by_cn(C_CMPADC_INN_V50_DIV2);
    target = read_adc_by_cn(adc_id);
    voltage = (u32)target * (u32)HALF_VDD_MV / half_vdd;
    return voltage;
}
#endif
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
static void save_value_warehouse(u16 adc)
{
#if ADC_MEMORY_FILTER
    adc_group[adc_dev.index].value.sum += adc;
    adc_group[adc_dev.index].value.average = adc_group[adc_dev.index].value.sum >> adc_group[adc_dev.index].attr->filter;
    adc_group[adc_dev.index].value.sum -= adc_group[adc_dev.index].value.average;
#else
    u16 i;
    for (i = ADC_CACHE_SIZE - 1; i > 0; i--)
    {
        adc_group[adc_dev.index].fifo[i] = adc_group[adc_dev.index].fifo[i - 1];
    }
    adc_group[adc_dev.index].fifo[0] = adc;
#endif
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
static void shift_adc_channel(void)
{
    adc_dev.index++;
    if (adc_dev.index >= ADC_SIZE)
    {
        adc_dev.flag.bits.enable = FALSE;
#if ADC_TRIGGER_BY_TIM == 0
        enable_adc_channel();
#endif
    }
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void hal_adc_process(osvar_t ms)
{
#if ADC_CONVERT_ISR == 0
    if (!adc_dev.flag.bits.enable)
    {
        return;
    }

    if (!adc_dev.flag.bits.go)
    {
        open_adc_channel(adc_dev.index);
        return;
    }

    if (*P_CMPADC_Status & C_CMPADC_INT_Flag)
    {
        adc_dev.flag.bits.go = 0;
        *P_CMPADC_Ctrl0 |= C_CMPADC_Discharge_Enable;
        *P_CMPADC_Status = C_CMPADC_INT_Flag | C_CMPADC_Timeout_Flag;
        save_value_warehouse(*P_CMPADC_Data);
        shift_adc_channel();
    }

#endif
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void cb_adc_interrupt(void)
{
}
