#include "../inc/includes.h"

static event_state os = {
    .words = 0,
};
/*
 * argument in  :
 * argument out :
 * description  :
 */
void init_operate_app(void)
{
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
enum
{
  Step_Init_Own = 0,
  Step_init_Pan1026,
};
void task_operate_event(osvar_t ms)
{
  u16 cap;

  if (os.bits.step > Step_Init_Own)
  {
    cap = read_cap_value();
  }

  switch (os.bits.step)
  {
  case Step_Init_Own:
    init_operate_app();
    os.bits.step = Step_init_Pan1026;
    break;

  case Step_init_Pan1026:
    if (cap)
    {
      play_a1800_decimal(cap, true);
    }
    break;

  default:
    break;
  }
}
