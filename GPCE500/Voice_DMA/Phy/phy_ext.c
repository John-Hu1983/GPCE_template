#include "../inc/includes.h"

ext_flag_t flag;
/*********************************************************************************
 * function     :
 * argument in  :
 * argument out :
 * description  :
 *********************************************************************************/
void init_ext_detection(ext_cn_t cn, ext_edge_t edge)
{
    GPIO_Pattern dir;
    dir = (edge == EDGE_RISING) ? io_input_pulldown : io_input_pullup;

    switch (cn)
    {
    case Ext1_IO_B11:
        *P_IO_Ctrl |= bitset(10);            // enablue schmitt trigger
        *P_IO_Ctrl |= edge << 2;             // set edge pattern
        gpio_init_pattern(GPCE_PB, 11, dir); // config IO pattern
        *P_INT_Ctrl |= bitset(1);            // enable IRQ5_EXT1
        *P_INT_Status |= bitset(1);          // clear IRQ5_EXT1
        *P_FIQ_Sel &= ~bitset(1);            // choose IRQ5_EXT1
        break;

    case Ext2_IO_B10:
        *P_IO_Ctrl |= bitset(11);            // enablue schmitt trigger
        *P_IO_Ctrl |= edge << 4;             // set edge pattern
        gpio_init_pattern(GPCE_PB, 10, dir); // config IO pattern
        *P_INT_Ctrl |= bitset(0);            // enable IRQ5_EXT2
        *P_INT_Status |= bitset(0);          // clear IRQ5_EXT2
        *P_FIQ_Sel &= ~bitset(0);            // choose IRQ5_EXT2
        break;

    case EXT_CN_TOTAL:
        *P_IO_Ctrl |= bitset(11) | bitset(10) | (edge << 4) | (edge << 2);
        gpio_init_pattern(GPCE_PB, 11, dir);
        gpio_init_pattern(GPCE_PB, 10, dir);
        *P_INT_Ctrl |= bitset(0) | bitset(1);
        *P_INT_Status |= bitset(0) | bitset(1);
        *P_FIQ_Sel &= ~(bitset(0) | bitset(1));
        break;
    }
    flag.byte = 0;
}

/*********************************************************************************
 * function     :
 * argument in  :
 * argument out :
 * description  :
 *********************************************************************************/
void cb_ext_irq5(void)
{
    if ((*P_INT_Status & bitset(0)) || (*P_INT_Status & bitset(1)))
    {
        if (*P_INT_Status & bitset(1)) // ext1
        {
            *P_INT_Status |= bitset(1);
            flag.bits.cn1 = 1;
        }

        if (*P_INT_Status & bitset(0)) // ext2
        {
            *P_INT_Status |= bitset(0);
            flag.bits.cn2 = 1;
        }
    }
}

/*********************************************************************************
 * function     :
 * argument in  :
 * argument out :
 * description  :
 *********************************************************************************/
bool is_ext_has_been_occured(ext_cn_t cn)
{
    bool val = FALSE;
    if (cn == Ext1_IO_B11)
    {
        if (flag.bits.cn1)
        {
            flag.bits.cn1 = 0;
            val = TRUE;
        }
    }
    else if (cn == Ext2_IO_B10)
    {
        if (flag.bits.cn2)
        {
            flag.bits.cn2 = 0;
            val = TRUE;
        }
    }

    return val;
}
