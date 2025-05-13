#ifndef _APP_OPERATE_H_
#define _APP_OPERATE_H_

typedef union
{
  u16 words;
  struct
  {
    unsigned en : 1;
    unsigned period : 12;
  };
} finger_alarm_t;
 
void task_operate_event(osvar_t ms);
#endif

