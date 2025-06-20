#include "../Inc/includes.h"

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
const u32 bitsetval[32] __attribute__((section(".data"))) = {
    0x00000001,
    0x00000002,
    0x00000004,
    0x00000008,

    0x00000010,
    0x00000020,
    0x00000040,
    0x00000080,

    0x00000100,
    0x00000200,
    0x00000400,
    0x00000800,

    0x00001000,
    0x00002000,
    0x00004000,
    0x00008000,

    0x00010000,
    0x00020000,
    0x00040000,
    0x00080000,

    0x00100000,
    0x00200000,
    0x00400000,
    0x00800000,

    0x01000000,
    0x02000000,
    0x04000000,
    0x08000000,

    0x10000000,
    0x20000000,
    0x40000000,
    0x80000000,
};
u32 bitset(u8 bits)
{
  return (bits > 31) ? 0 : bitsetval[bits];
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void push_recursion_array(void *arr, u16 len, u16 new)
{
  unsigned *array;
  u16 i;

  array = arr;
  for (i = len - 1; i > 0; i--)
  {
    array[i] = array[i - 1];
  }
  array[0] = new;
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void open_interrupt_global(void)
{
  __asm("INT FIQ,IRQ");
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void close_interrupt_global(void)
{
  __asm("INT OFF");
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void init_board_global(void)
{
  // system layer
  System_Initial();
  init_soft_link();

  // power control
  power_on_circuit();

  // physical module
  init_adc_equipment();
#if CAP_TOUCH_EN
  enable_cap_touch();
#endif
#if SHELL_LOG_EN
  init_uart_equipment(Baud_460800);
#endif

  // device layer
  init_audio_equipment();
  init_operate_app();

  // schedule
  open_2048hz_irq();
  open_interrupt_global();

  // play_a1800_music(N000_A18, true);
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void power_on_circuit(void)
{
}

/*
 * function   :
 * input      :
 * output     :
 */
uint16_t read_cpu_identifier(void)
{
  return 0x1135;
}
