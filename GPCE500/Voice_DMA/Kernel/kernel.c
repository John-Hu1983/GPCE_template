#include "../Inc/includes.h"

task_t APPS[] = {
    {0, 0, task_idle_process},
    {5, 5, task_operate_event},
};
const u16 TASK_SIZE = sizeof(APPS) / sizeof(APPS[0]);

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void task_idle_process(osvar_t ms)
{
  WatchdogClear();
  hal_adc_process(ms);
  Kernel_SACM_Process();
#if CAP_TOUCH_EN
  task_cts_process(ms);
#endif
#if SHELL_LOG_EN
  task_uart_process(ms);
  task_shell_log(ms);
#endif
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void Callback_os_timer(void)
{
  u16 inx;
  for (inx = 0; inx < TASK_SIZE; inx++)
  {
    if (APPS[inx].counter)
    {
      APPS[inx].counter--;
    }
  }
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void open_app_process(void)
{
  static u16 tick_weak = 0;
  u16 inx;
  while (1)
  {
    if (*P_INT2_Ctrl & C_IRQ6_2048Hz)
    {
      tick_weak = 0;
    }
    else
    {
      if (++tick_weak > 40)
      {
        tick_weak = 0;
        callback_2048hz_service();
      }
    }

    for (inx = 0; inx < TASK_SIZE; inx++)
    {
      if (APPS[inx].counter == 0)
      {
        APPS[inx].counter = APPS[inx].set;
        APPS[inx].func(APPS[inx].counter);
      }
    }
  }
}
