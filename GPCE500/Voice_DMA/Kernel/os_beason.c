#include "../Inc/includes.h"

volatile struct soft_t *tim_head = null;
kernel_var rt = {0};
/**
 * @brief
 * @note
 * @param
 * @retval
 */
void init_soft_link(void)
{
  tim_head = null;
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void open_2048hz_irq(void)
{
  *P_INT2_Ctrl |= C_IRQ6_2048Hz;
  *P_INT2_Status |= C_IRQ6_2048Hz;
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void close_2048hz_irq(void)
{
  *P_INT2_Ctrl &= ~C_IRQ6_2048Hz;
  *P_INT2_Status |= C_IRQ6_2048Hz;
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void create_soft_timer(struct soft_t *node, Timer_Pat_t pat)
{
  node->timer.member.pat = pat;
  node->timer.member.ms = 0;
  if (tim_head == null)
  {
    tim_head = node;
    tim_head->next = null;
  }
  else
  {
    node->next = tim_head->next;
    tim_head->next = node;
  }
}

/*
 * argument in	:	none
 * argument out	:	none
 * descrition	:
 */
void cb_soft_timer(void)
{
  struct soft_t *node;
  node = (struct soft_t *)tim_head;

  while (node != null)
  {
    if (node->timer.member.pat == Soft_Tp_Increase)
    {
      if (node->timer.member.ms < SOFTTIME_COUNT_MAX)
      {
        node->timer.member.ms++;
      }
    }
    else
    {
      if (node->timer.member.ms > SOFTTIME_COUNT_MIN)
      {
        node->timer.member.ms--;
      }
    }

    node = node->next;
  }
}

/*
 * Argument in  :
 * Argument out :
 * Description  : 488us
 */
void callback_2048hz_service(void)
{
  rt.bits.ms_tick++;
  if (rt.bits.ms_tick >= 2)
  {
    rt.bits.ms_tick = 0;

    if (rt.bits.ms_counter)
    {
      rt.bits.ms_counter--;
    }

    Callback_os_timer();
    cb_soft_timer();
  }
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void delay_us(u32 us)
{
  u32 i;
  u8 tick;

  for (i = 0; i < us; i++)
  {
    WatchdogClear();
    tick = 80;
    while (tick)
      tick--;
  }
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void delay_ms(u16 ms)
{
  if (*P_INT2_Ctrl & C_IRQ6_2048Hz)
  {
    rt.bits.ms_counter = ms;
    while (rt.bits.ms_counter)
    {
      WatchdogClear();
    }
  }
  else
  {
    delay_us(1000 * ms);
  }
}
