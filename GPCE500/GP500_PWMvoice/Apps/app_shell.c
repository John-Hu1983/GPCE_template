#include "../inc/includes.h"

#if SHELL_LOG_EN

static shell_cmd_t cmd;
const char *log_cmd[11] __attribute__((section(".data"))) = {
    "\n",
    "AT+CN0:%d\n",
    "AT+CN1:%d\n",
    "AT+CN2:%d\n",
    "AT+CN3:%d\n",
    "AT+CN4:%d\n",
    "AT+CN5:%d\n",
    "AT+CN6:%d\n",
    "AT+CN7:%d\n",
    "AT+CN8:%d\n",
    "AT+CN9:%d\n",
};

const shell_remote_ctr terminal[] = {
    // {"AT+PID-P:", set_pid_proportion},
    // {"AT+PID-I:", set_pid_integral},
    // {"AT+PID-D:", set_pid_differential},
    // {"AT+PID-G:", set_pid_goal},
    // {"AT+PID-C:", set_pid_period},
};
const u16 terminal_len = sizeof(terminal) / sizeof(terminal[0]);

/*
 * argument in  :
 * argument out :
 * description  :
 */
void init_task_equipment(void)
{
  memset((void *)&cmd, 0, sizeof(cmd));
  init_uart_equipment(Baud_460800);
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void logout_by_channel(u8 cn, int val)
{
  u8 buf[64];
  if (cn < 1)
    cn = 1;
  else if (cn > 9)
    cn = 9;
  memset(buf, '\0', sizeof(buf));
  sprintf(buf, log_cmd[cn], val);
  insert_tx_fifo(buf);
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void extract_terminal_parameter(char *message)
{
  u16 i, len;
  char *value_str;
  float proportion_value;

  len = strlen(message);
  for (i = 0; i < terminal_len; i++)
  {
    if (strncmp(message, terminal[i].str, strlen(terminal[i].str)) == 0)
    {
      // load_voice_single(DI_WAV_A18, true);
      value_str = strchr(message, ':'); // Find the colon in the message
      if (value_str != NULL)
      {
        value_str++;
        proportion_value = strtof(value_str, NULL);
        terminal[i].func(proportion_value);
        break;
      }
    }
  }
}

/*
 * argument in  :
 * argument out :
 * description  :
 */

void task_shell_log(osvar_t ms)
{
  u8 rd;
  op_res res;

  /*
   * reception event
   */
  res = extract_rx_byte(&rd);
  if (res == op_success)
  {
    cmd.buf[cmd.inx++] = rd & 0xff;
    if (cmd.inx >= SHELL_MEM_LEN)
    {
      cmd.inx = 0;
    }

    if (rd == '\n')
    {
      extract_terminal_parameter(cmd.buf);
      memset((void *)&cmd, 0, sizeof(cmd));
    }
  }
}

#endif
