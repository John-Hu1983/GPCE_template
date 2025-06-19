
#ifndef _DEV_CTS_PRIVATE_H_
#define _DEV_CTS_PRIVATE_H_

#define cts_ctrl_start() (*P_CTS_Ctrl1 |= 0x0001)
#define cts_ctrl_stop() (*P_CTS_Ctrl1 &= 0xfffe)

typedef union
{
	u16 bytes;
	struct
	{
		unsigned ctsen : 1;			 // 0: disable 1: C_CTS_Enable
		unsigned isel : 1;			 // 0: 25ua 1: 50ua
		unsigned autostop : 1;	 // 0: disable 1: C_CTS_Enable
		unsigned b7_b3 : 5;			 // reserve
		unsigned ref_clk_en : 1; // 0: disable 1: C_CTS_Enable
		unsigned b9 : 1;				 // reserve
		unsigned port : 2;			 // 00: IOA 01: IOB 1X: no
		unsigned pin : 4;				 // IOX0~ IOX15
	} bits;
} cts_ctrl0;

typedef union
{
	u16 bytes;
	struct
	{
		unsigned start : 1;		// 0: stop 1: start
		unsigned b1 : 1;			// reserve
		unsigned port : 2;		// 00: IOA 01: IOB 1X: no
		unsigned pin : 4;			// IOX0~ IOX15
		unsigned tmb_en : 1;	// 0: disable 1: C_CTS_Enable
		unsigned tma_en : 1;	// 0: disable 1: C_CTS_Enable
		unsigned tma_clk : 3; // see specification
		unsigned tmb_clk : 3; // see specification
	} bits;
} cts_ctrl1;

typedef enum
{
	CTS_25_UA = 0,
	CTS_50_UA,
} Cts_cur_sel;

typedef enum
{
	CTS_CLK_OFF = 0,
	CTS_CLK_REF,
	CTS_CLK_SYS,
	CTS_CLK_SYS_DIV2,
	CTS_CLK_SYS_DIV4,
	CTS_CLK_SYS_DIV8,
	CTS_CLK_SYS_DIV16,
	CTS_CLK_SYS_DIV32,
} Cts_clk_sel;

typedef enum
{
	CTS_IOA = 0,
	CTS_IOB,
	CTS_NOUSE,
} Cts_IOport_t;

typedef struct
{
	Cts_IOport_t port;
	u8 pin;
} cts_io;

typedef struct
{
	union
	{
		u8 words;
		struct
		{
			unsigned ok : 1;
		} bits;
	} state;
	u16 result;
	u16 conversion;
	u8 index;
	u8 step;
} cts_conctrol;

#define CTS_FIFO_DEEP (32)
typedef struct
{
	u16 buf[CTS_FIFO_DEEP];
	u16 idle_value;
	u16 threshold_value;
	union
	{
		u16 words;
		struct
		{
			unsigned active : 1;
			unsigned reported : 1;
		} bits;
	} state;
} cts_user;

void enable_cap_touch(void);
void disable_cap_touch(void);
u8 how_many_cts_pads(void);
u16 read_cts_value(u16 channel);
void task_cts_process(osvar_t ms);
u16 read_cap_value(void);
#endif
