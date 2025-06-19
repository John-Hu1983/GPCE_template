#ifndef _HAL_ADC_H_
#define _HAL_ADC_H_

#define ADC_CONVERT_ISR (0)
#define ADC_MEMORY_FILTER (1)

#define ADC_CN_IOA11 (0)
#define ADC_CN_IOA10 (0)
#define ADC_CN_IOA09 (0)
#define ADC_CN_IOA08 (0)
#define ADC_CN_IOA07 (0)
#define ADC_CN_PGAO (0)
#define ADC_CN_HALF_V50 (0)
#define ADC_CN_IN_V12 (1)

typedef struct
{
    u16 channel;
    u16 filter;
} adc_attribute_t;

typedef struct
{
    adc_attribute_t *attr;
#if ADC_MEMORY_FILTER
    filter_t value;
#else
#define ADC_CACHE_SIZE (16)
    u16 fifo[ADC_CACHE_SIZE];
#endif
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
void hal_adc_process(osvar_t ms);
void cb_adc_interrupt(void);

#if ADC_CONVERT_ISR == 0
void enable_adc_channel(void);
void pause_adc_conversion(void);
u16 read_adc_by_cn(u16 cn);
u16 read_adc_vol_mv(u16 adc_id);

#else
void open_adc_convertion(void);

#endif

#endif
