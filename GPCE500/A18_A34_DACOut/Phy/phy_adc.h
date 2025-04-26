#ifndef _HAL_ADC_H_
#define _HAL_ADC_H_

typedef struct
{
    u16 channel;
    u16 filter;
} adc_attribute_t;

typedef struct
{
    adc_attribute_t *attr;
    u16 count;
    u16 average;
} adc_obj;

typedef struct
{
    union
    {
        u8 byte;
        struct
        {
            unsigned enable : 1;
            unsigned go : 1;
        } bits;
    } flag;

    u8 index;
} adc_ctr;

void init_adc_equipment(void);
void enable_adc_channel(void);
void pause_adc_conversion(void);
u16 read_adc_by_cn(u16 cn);
u16 read_adc_vol_mv(u16 adc_id);
void hal_adc_process(osvar_t ms);
#endif
