#ifndef _APP_SHELL_H_
#define _APP_SHELL_H_

#define SHELL_MEM_LEN (32)
typedef struct
{
  u8 buf[SHELL_MEM_LEN];
  u8 inx;
} shell_cmd_t;

typedef struct
{
  char *str;
  void (*func)(float);
} shell_remote_ctr;

void init_task_equipment(void);
void logout_by_channel(u8 cn, int val);
void task_shell_log(osvar_t ms);
#endif
