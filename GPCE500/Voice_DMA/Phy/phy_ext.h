#ifndef _HAL_EXT_H_
#define _HAL_EXT_H_

typedef enum
{
    Ext1_IO_B11 = 0,
    Ext2_IO_B10,
    EXT_CN_TOTAL,
} ext_cn_t;

typedef enum
{
    EDGE_RISING = 0x0,
    EDGE_FALLING = 0x1,
} ext_edge_t;

typedef union
{
    unsigned char byte;
    struct
    {
        unsigned cn1 : 1;
        unsigned cn2 : 1;
    } bits;
} ext_flag_t;

void init_ext_detection(ext_cn_t cn, ext_edge_t edge);
bool_t is_ext_has_been_occured(ext_cn_t cn);
#endif
