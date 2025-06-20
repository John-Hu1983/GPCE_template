#include "../inc/includes.h"
const btn_io Btn_IO[] = {
    {{GPCE_PA, 0}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 1}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 2}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 3}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 4}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 5}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 6}, io_input_pulldown, TRUE, 10, 50},
    {{GPCE_PA, 7}, io_input_pulldown, TRUE, 10, 50},
};
btn_obj button[sizeof(Btn_IO) / sizeof(Btn_IO[0])];
/*
 * argument in  :
 * argument out :
 * description  :
 */
void init_operate_app(void)
{
  u16 i;
  u16 Btn_Amount;

  Btn_Amount = sizeof(Btn_IO) / sizeof(Btn_IO[0]);
  for (i = 0; i < Btn_Amount; i++)
  {
    gpio_init_pattern(Btn_IO[i].io.port, Btn_IO[i].io.pin, Btn_IO[i].patt);
    memset((void *)&button[i], 0, sizeof(button[i]));
    button[i].pin = (btn_io *)&Btn_IO[i];
  }
  gpio_setout_with_level(GPCE_PB, 0, 0);
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void test_irq3_period(void)
{
  static unsigned flag = 0;
  if (flag == 0)
  {
    gpio_write_level(GPCE_PB, 0, 1);
    flag = 1;
  }
  else
  {
    gpio_write_level(GPCE_PB, 0, 0);
    flag = 0;
  }
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
btnval_t btn_v[sizeof(Btn_IO) / sizeof(Btn_IO[0])];
void task_operate_event(osvar_t ms)
{
  u16 temp;
  u16 Btn_Amount = sizeof(Btn_IO) / sizeof(Btn_IO[0]);
  for (temp = 0; temp < Btn_Amount; temp++)
  {
    btn_v[temp] = scan_btn_object((btn_obj *)&button[temp], ms);
    if (btn_v[temp])
    {
      play_a1800_decimal(temp, true);
    }
  }
}
