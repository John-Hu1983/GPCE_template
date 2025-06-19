#include "../inc/includes.h"

typedef union
{
  u16 word;
  struct
  {
    unsigned ccp_mode_sel : 2; // 00: disable; 01: capture; 02: comparison; 03: reserve;
    unsigned cap_sel : 1;      // 0: capture falling edge ; 1: capture rising edeg;
    unsigned cmp_sel : 1;      // 0: comparison out; 1: fixed out;
    unsigned ccp_io_sel : 4;   // 0~9 : IOB[n]
    unsigned ccp_dma_en : 1;   // 0: disable; 1: enable
    unsigned b15_9 : 7;        // reserve;
  } bits;
} ccp_ctr_t;
/*
 * argument in	:
 * argument out	:
 * descrition	:
 */
void open_comparison_mode(u8 cn)
{
  ccp_ctr_t ccp;

  // *P_Timer_Ctrl |= C_TimerC_SYSCLK;
  // *P_TimerC_Data = 0xFFC7;
  // *P_TimerC_CNTR = 0xFFC7;

  // *P_CCP_Ctrl = C_CCP_IOB9 | C_CCP_CmpOutputNormal | C_CCP_CmpEnable;
  // *P_IOB_Dir |= bitset(9);
  // *P_IOB_Attrib |= bitset(9);
  // *P_IOB_Buffer |= bitset(9);

  // *P_CCP_CNTR = 0xFFE1;
  gpio_setout_with_level(GPCE_PB, cn, 0);

  *P_Timer_Ctrl &= ~(u16)(0xf << 8);
  *P_Timer_Ctrl |= C_TimerC_SYSCLK;
  *P_TimerC_Data = 0xff80;
  *P_TimerC_CNTR = 0xff80;

  ccp.word = 0;
  ccp.bits.ccp_io_sel = cn;
  ccp.bits.cmp_sel = 0;
  ccp.bits.ccp_mode_sel = 2;

  *P_CCP_Ctrl = ccp.word;
  *P_CCP_CNTR = 0xffbf;
}
