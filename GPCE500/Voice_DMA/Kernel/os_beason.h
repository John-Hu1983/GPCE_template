#ifndef _OS_BEACON_H_
#define _OS_BEACON_H_

#define SOFTTIME_COUNT_MAX 0x7fff
#define SOFTTIME_COUNT_MIN 0
typedef enum
{
  Soft_Tp_Increase = 0,
  Soft_Tp_Decrease,
} Timer_Pat_t;
struct soft_t
{
  union
  {
    u16 word;
    struct
    {
      unsigned pat : 1; // Inc or Dec
      unsigned ms : 15; // maximum 32768
    } member;
  } timer;
  struct soft_t *next;
};

typedef union
{
  u32 words;
  struct
  {
    unsigned ms_tick : 2;
    unsigned ms_counter : 16;
  } bits;
} kernel_var;

void init_soft_link(void);
void create_soft_timer(struct soft_t *node, Timer_Pat_t pat);
void delay_us(u32 us);
void delay_ms(u16 ms);
void callback_2048hz_service(void);
void open_2048hz_irq(void);
void close_2048hz_irq(void);
#endif
