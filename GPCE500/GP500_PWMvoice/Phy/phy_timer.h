#ifndef _HAL_TIMER_H_
#define _HAL_TIMER_H_

typedef enum
{
    prescaler_Null = 0,
    Prescaler_One,
    Prescaler_Ext2,
    Prescaler_Fosc32k,
    Prescaler_Fsysclk,
    Prescaler_Zero,
    Prescaler_Faudclk,
    Prescaler_Faudclk_div8,
    Prescaler_Fsysclk_div1,
    Prescaler_Fsysclk_div2,
    Prescaler_Fsysclk_div4,
    Prescaler_Fsysclk_div8,
    Prescaler_Fsysclk_div16,
    Prescaler_Fsysclk_div32,
    Prescaler_Fsysclk_div64,
    Prescaler_Fsysclk_div128,
    Prescaler_range,
} Tim_Prescaler;

#define DIV16_ISR_10US (65484) // 0xffff-52

typedef enum
{
    Timer_A = 0,
    Timer_B,
    Timer_C,
} timer_name;

typedef struct
{
    handle_t *reload;
    handle_t *counter;
    u16 clk_bit;
    u16 isr_bit;
} Timer_User;

void open_timer_isr(timer_name name, u16 us);
void close_timer_isr(timer_name name);
void cb_irq0_tima(void);
void cb_irq1_timb(void);
void cb_irq2_timc(void);

#endif
