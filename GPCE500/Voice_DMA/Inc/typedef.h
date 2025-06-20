#ifndef _SPIN_DRV_H_
#define _SPIN_DRV_H_

#include "GPCE36_CE5.h"

#define IRQ_DISABLE_GLOBAL __asm("INT OFF")
#define IRQ_ENABLE_GLOBAL __asm("INT FIQ,IRQ")

typedef volatile unsigned int handle_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long int u32;
typedef unsigned long long u64;

typedef signed char s8;
typedef signed short s16;
typedef signed long int s32;
typedef signed long long s64;

typedef uint8_t osvar_t;

#define null 0

typedef struct
{
    u8 r;
    u8 g;
    u8 b;
} rgb_t;

typedef enum
{
    FALSE = 0,
    false = 0,
    TRUE = 1,
    true = 1,
} bool;

typedef enum
{
    op_success = 0,
    op_para_error,
    op_time_out,
    op_busy,
    op_failed,
    op_max,
    op_empty,
} op_res;

typedef struct
{
    uint8_t step;
    uint16_t period;
} event_t;

typedef enum
{
    BTN_IDLE,
    BTN_CLICK,
    BTN_HOLD,
    BTN_END
} btnval_t;

typedef struct
{
    uint16_t tick;
    uint16_t range;
} debounce_t;

typedef struct
{
    uint16_t sum;
    uint16_t average;
} filter_t;

#endif