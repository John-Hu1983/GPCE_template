#ifndef _HAL_IOPWM_H_
#define _HAL_IOPWM_H_

typedef enum
{
    IOPWM_CLK_F32K_DIV2 = 0,
    IOPWM_CLK_TIMA,
    IOPWM_CLK_TIMB,
    IOPWM_CLK_TIMC,
    IOPWM_CLK_FOSC,
    IOPWM_CLK_FDIV_8,
    IOPWM_CLK_FDIV_64,
    IOPWM_CLK_FDIV_1024,
} iopwm_clk_t;

typedef union
{
    u16 words;
    struct
    {
        unsigned duty : 9;  // [8:0] 0~256
        unsigned clk : 3;   // [11:9]
        unsigned mask : 1;  // [12]
        unsigned b13 : 1;   // [13]
        unsigned en : 1;    // [14]
        unsigned clear : 1; // [15]
    } bits;
} iopwm_ctr_t;

typedef struct
{
    u8 cn;
    iopwm_clk_t clk;
} iopwm_obj;

op_res set_iopwm_pattern(u8 cn, iopwm_clk_t clk_s, u16 pulse);
void write_iopwm_by_struct(iopwm_obj *dev, u16 duty);
void close_iopwm_total(void);
#endif
