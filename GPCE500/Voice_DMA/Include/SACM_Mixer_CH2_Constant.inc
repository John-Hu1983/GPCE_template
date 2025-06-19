//==========================================================================
// File Name   : SACM_Mixer_CH2_Constant.inc
// Description : Play flag and buffer size definition
// Modified by : Benjamin
// Last modified date:
//              2021/07/23
//==========================================================================
.ifndef __SACM_MIXER_CH2_CONSTANT_INC__
.define __SACM_MIXER_CH2_CONSTANT_INC__

// Constants Definition for R_SACM_Mixer_Play_Flag
.define C_SACM_MIXER_PLAY_Num					0
.define C_SACM_RESERVE_2_Num					1
.define C_SACM_MIXER_PAUSE_Num					2
.define	C_SACM_MIXER_RAMP_DN_ENABLE_Num			3
.define C_SACM_MIXER_RAMP_UP_ENABLE_Num			4
.define C_SACM_MIXER_ENABLE_DAC1_Num			5
.define C_SACM_MIXER_ENABLE_DAC2_Num			6
.define	C_SACM_MIXER_AUTO_Num					7
.define C_SACM_MIXER_DECODE_WORK_Num			8
.define	C_SACM_MIXER_DECODE_ODD_Num				9
.define C_SACM_MIXER_DECODE_END_Num				10
.define C_SACM_MIXER_REC_Mon_ON_Num				11
.define C_SACM_MIXER_FIQ_SOUND_Num				12
.define	C_SACM_MIXER_FIQ_EVEN_Num				13
.define C_SACM_MIXER_STOP_Num					14
.define	C_SACM_RESERVE_Num						15


.define C_SACM_MIXER_PLAY						0x0001 << C_SACM_MIXER_PLAY_Num
.define C_SACM_RESERVE_2						0x0001 << C_SACM_RESERVE_2_Num
.define C_SACM_MIXER_PAUSE						0x0001 << C_SACM_MIXER_PAUSE_Num
.define	C_SACM_MIXER_RAMP_DN_ENABLE				0x0001 << C_SACM_MIXER_RAMP_DN_ENABLE_Num
.define C_SACM_MIXER_RAMP_UP_ENABLE				0x0001 << C_SACM_MIXER_RAMP_UP_ENABLE_Num
.define C_SACM_MIXER_ENABLE_DAC1				0x0001 << C_SACM_MIXER_ENABLE_DAC1_Num
.define C_SACM_MIXER_ENABLE_DAC2				0x0001 << C_SACM_MIXER_ENABLE_DAC2_Num
.define	C_SACM_MIXER_AUTO						0x0001 << C_SACM_MIXER_AUTO_Num
.define C_SACM_MIXER_DECODE_WORK				0x0001 << C_SACM_MIXER_DECODE_WORK_Num
.define	C_SACM_MIXER_DECODE_ODD					0x0001 << C_SACM_MIXER_DECODE_ODD_Num
.define C_SACM_MIXER_DECODE_END					0x0001 << C_SACM_MIXER_DECODE_END_Num
.define C_SACM_MIXER_REC_Mon_ON					0x0001 << C_SACM_MIXER_REC_Mon_ON_Num
.define C_SACM_MIXER_FIQ_SOUND					0x0001 << C_SACM_MIXER_FIQ_SOUND_Num
.define	C_SACM_MIXER_FIQ_EVEN					0x0001 << C_SACM_MIXER_FIQ_EVEN_Num
.define C_SACM_MIXER_STOP						0x0001 << C_SACM_MIXER_STOP_Num
.define	C_SACM_RESERVE							0x0001 << C_SACM_RESERVE_Num


.define C_CH2_DECODE_OUT_LENGTH		320

.endif
