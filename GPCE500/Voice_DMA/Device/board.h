#ifndef _BOARD_H_
#define _BOARD_H_

void init_board_global(void);
void open_interrupt_global(void);
void close_interrupt_global(void);
void power_on_circuit(void);
void push_recursion_array(void *arr, u16 len, u16 new);
u32 bitset(u8 bits);
uint16_t read_cpu_identifier(void);
#endif
