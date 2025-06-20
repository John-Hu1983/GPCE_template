//==========================================================================
// File Name   : SACM_MS02PN_USER.asm
// Description : Users implement functions for GPCE100B or GPCE3400A
// Written by  : Benjamin Xu
// Last modified date:
//              2019/10/16
// Note: The address of the section named "MS02PN_LibCallback_SEC" can not be changed.
//==========================================================================
//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc
.include SACM_Mixer_CH2_Constant.inc


//**************************************************************************
// Contant Defintion Area
//**************************************************************************


//**************************************************************************
// Variable Publication Area
//**************************************************************************


//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public  _SACM_Mixer_CH2_Init
.public F_SACM_Mixer_CH2_Init
.public  _SACM_Mixer_CH2_Play
.public F_SACM_Mixer_CH2_Play
.public  _SACM_Mixer_CH2_ServiceLoop
.public F_SACM_Mixer_CH2_ServiceLoop
.public F_ISR_Service_SACM_Mixer_CH2
.public  _SACM_Mixer_CH2_Stop
.public F_SACM_Mixer_CH2_Stop
.public  _SACM_Mixer_CH2_Status
.public F_SACM_Mixer_CH2_Status
.public  _SACM_Mixer_CH2_Pause
.public F_SACM_Mixer_CH2_Pause
.public  _SACM_Mixer_CH2_Resume
.public F_SACM_Mixer_CH2_Resume


.public R_Mixer_CH2_DacOutData

//**************************************************************************
// External Function Declaration
//**************************************************************************
.external F_SP_RampUpDAC1
.external F_SP_RampUpDAC2
.external F_SP_RampDnDAC1
.external F_SP_RampDnDAC2


//**************************************************************************
// External Table Declaration
//**************************************************************************


//**************************************************************************
// RAM Definition Area
//**************************************************************************
.IRAM
R_SACM_Mixer_Play_Flag:		.dw  	1		dup(0)

OVERLAP_MIXER_CH2_RAM_BLOCK:	.section	.ORAM						
R_SACM_Mixer_DAC_Out_Buffer:
.dw 2 * C_CH2_DECODE_OUT_LENGTH dup(?)
.var R_SACM_Mixer_DAC_Out_PTR_Play
.var R_SACM_Mixer_DAC_Out_PTR_Decode	
.var R_ShiftStore_ServiceLoop	
.var R_Mixer_CH2_DacOutData	

OVERLAP_MIXER_CH2_DECOUT_RAM_BLOCK:	.section	.ORAM		
R_SACM_DECODE_OUT_Buffer:
.dw C_CH2_DECODE_OUT_LENGTH dup(?)

	
							
//**************************************************************************
// CODE Definition Area
//**************************************************************************
.CODE
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SACM_Mixer_CH2_Init:	.proc
F_SACM_Mixer_CH2_Init:	
	FIR_MOV OFF;
	
	[R_SACM_Mixer_Play_Flag] = R1 - R1
	
	R1 = C_Timer_Setting_16K;	// default value
	[P_TimerA_Data] = R1;

	R1 = [P_Timer_Ctrl]
	R1 |= C_TimerA_SYSCLK;				// TimerB CKA=Fosc/2 CKB=1 Tout:off
	[P_Timer_Ctrl] = R1;
	
	[P_TimerA_CNTR] = R1;

	R1 = [P_AUDIO_Ctrl2];
	R1 |= C_AUD_CH2_Up_Sample_Enable | C_AUD_CH2_TMR_Sel_TimerA | C_AUD_CH2_Half_Vol_Enable;
	[P_AUDIO_Ctrl2] = R1;

	R1 = C_AUDIO_PWMIP_Enable | C_AUDIO_PWM_Enable | C_AUDIO_Gain_Sel | C_MuteControl_DATACHAGE;
	[P_AUDIO_Ctrl1] = R1;
	
	R1 = C_PWM_sData;
	[P_AUDIO_Ctrl3] = R1;
	
	R1 = R_SACM_DECODE_OUT_Buffer
	R2 = 0
L_Loop?:	
	[R1++] = R2
	cmp R1, R_SACM_DECODE_OUT_Buffer + C_CH2_DECODE_OUT_LENGTH
	jne L_Loop?

//	R1 = [P_INT_Ctrl];
//	R1 |= C_IRQ0_TMA;
//	[P_INT_Ctrl] = R1;
//
//	R1 = [P_FIQ_Sel];
//	R1 |= C_IRQ0_TMA;
//	[P_FIQ_Sel] = R1;
	
	IRQ on;
	FIQ on;
	retf
	.endp
	
	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SACM_Mixer_CH2_Play: .proc
	R2 = SP + 3;
	R1 = [R2++];								// DAC channel
	R2 = [R2];									// ramp up/down setting
F_SACM_Mixer_CH2_Play:
	push R5 to [SP];							// C function must protect R5
	
?L_StartPlay:									// encryption check pass
	[R_SACM_Mixer_Play_Flag] = R1 - R1;
	
	R3 = C_SACM_MIXER_PLAY;

	tstb R1, 0									// check DAC1 enable
	jz ?L_Branch_0;

	setb R3, C_SACM_MIXER_ENABLE_DAC1_Num 		// DAC1 enable

?L_Branch_0:
   	tstb R1, 1									// check DAC2 enable
   	jz ?L_Branch_1;

   	setb R3, C_SACM_MIXER_ENABLE_DAC2_Num		// DAC2 enable

?L_Branch_1:
   	tstb R2, 0									// check ramp up
   	jz ?L_Branch_2;

   	setb R3, C_SACM_MIXER_RAMP_UP_ENABLE_Num	
   	tstb R3, C_SACM_MIXER_ENABLE_DAC1_Num	
   	jz ?L_Branch_3;

	call F_SP_RampUpDAC1;					// ramp up DAC1

?L_Branch_3:
   	tstb R3, C_SACM_MIXER_ENABLE_DAC2_Num	
   	jz ?L_Branch_2;

	call F_SP_RampUpDAC2;					// ramp up DAC2

?L_Branch_2: 
   	tstb R2, 1								// check ramp down
   	jz ?L_Branch_4;

   	setb R3, C_SACM_MIXER_RAMP_DN_ENABLE_Num	//R4 |= C_SACM_MS02PN_RAMP_DN_ENABLE;

?L_Branch_4:
	[R_SACM_Mixer_Play_Flag] = R3; 

?L_DecodeInProcess:
	R1 = 0x0000;
	R2 = R_SACM_Mixer_DAC_Out_Buffer;		// clear DAC_OUT buffer
	R3 = R2 + C_CH2_DECODE_OUT_LENGTH + C_CH2_DECODE_OUT_LENGTH; // AB Buffer

?L_Loop_0:
	[R2++] = R1;
	cmp R2, R3;
	jne ?L_Loop_0;

	R1 = R_SACM_Mixer_DAC_Out_Buffer;
	[R_SACM_Mixer_DAC_Out_PTR_Play] = R1;	// initial Play pointer
	R1 = R_SACM_Mixer_DAC_Out_Buffer + C_CH2_DECODE_OUT_LENGTH;
	[R_SACM_Mixer_DAC_Out_PTR_Decode] = R1;	// initial DAC_OUT buffer pointer
	R1 = [R_SACM_Mixer_Play_Flag];
	R1 |= (C_SACM_MIXER_DECODE_WORK + C_SACM_MIXER_DECODE_ODD + C_SACM_MIXER_FIQ_SOUND + C_SACM_MIXER_FIQ_EVEN);
	[R_SACM_Mixer_Play_Flag] = R1;			// set play flag

	call F_SACM_Mixer_CH2_StartPlay;			// 2007.10.03 Ray
?L_Play_End:
	pop R5 from [SP];
	retf;
	.endp	
	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SACM_Mixer_CH2_Stop: .proc
F_SACM_Mixer_CH2_Stop:
	R1 = [R_SACM_Mixer_Play_Flag];
	tstb R1, C_SACM_MIXER_PLAY_Num				// check playing
	jz ?L_Branch_0;

	clrb R1, C_SACM_MIXER_FIQ_SOUND_Num
	[R_SACM_Mixer_Play_Flag] = R1;

	tstb R1, C_SACM_MIXER_RAMP_DN_ENABLE_Num    // check ramp down setting
	jz ?L_Branch_0;

	tstb R1, C_SACM_MIXER_ENABLE_DAC1_Num		// check DAC1 enable
	jz ?L_Branch_1;

	call F_SP_RampDnDAC1;					// ramp down DAC1

?L_Branch_1:
	tstb R1, C_SACM_MIXER_ENABLE_DAC2_Num 	//test R1, C_SACM_MS02_ENABLE_DAC2;		// check DAC2 enable
	jz ?L_Branch_0;

	call F_SP_RampDnDAC2;					// ramp down DAC2

?L_Branch_0:
	[R_SACM_Mixer_Play_Flag] = R1 - R1;			// clear play flag

	call F_SACM_Mixer_CH2_EndPlay;				// for users implement
	retf;
	.endp	


//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SACM_Mixer_CH2_Status: .proc
F_SACM_Mixer_CH2_Status:
	R1 = [R_SACM_Mixer_Play_Flag];			// return play flag
	retf;
	.endp	
	

//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SACM_Mixer_CH2_Pause: .proc
F_SACM_Mixer_CH2_Pause:
	push R1 to [SP];
	R1 = [R_SACM_Mixer_Play_Flag];
	tstb R1, C_SACM_MIXER_PLAY_Num 			// check recording/playing
	jz ?L_Branch_0;

	setb R1, C_SACM_MIXER_PAUSE_Num 		// set PAUSE flag
	clrb R1, C_SACM_MIXER_FIQ_SOUND_Num		// clear FIQ_SOUND flag
	[R_SACM_Mixer_Play_Flag] = R1;

?L_Branch_0:
	pop R1 from [SP];
	retf;
	.endp

//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SACM_Mixer_CH2_Resume: .proc
F_SACM_Mixer_CH2_Resume:
	push R1 to [SP];
	R1 = [R_SACM_Mixer_Play_Flag];
	tstb R1, C_SACM_MIXER_PAUSE_Num			// check paused
	jz ?L_Branch_0;

	clrb R1, C_SACM_MIXER_PAUSE_Num			// clear PAUSE flag
	setb R1, C_SACM_MIXER_FIQ_SOUND_Num 		// set FIQ_SOUND flag
	[R_SACM_Mixer_Play_Flag] = R1;

?L_Branch_0:
	pop R1 from [SP];
	retf;
.endp	
	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_SACM_Mixer_CH2_Decode_Process:	.proc
	.external R_SACM_A1800_fptr_DAC_Out_PTR_Play
	.external R_SACM_A1800_fptr_DAC_Out_PTR_Decode
	.external R_SACM_A1800_fptr_Play_Gain
	.external R_SACM_A1800_fptr_Play_Flag
	.external _SACM_A1800_fptr_ServiceLoop
	.external F_ISR_Service_SACM_A1800_fptr
	

	R1 -= R1
	R2 = [R_SACM_Mixer_DAC_Out_PTR_Decode]
	R3 = R2 + C_CH2_DECODE_OUT_LENGTH
?L_BufClrLoop:	
	[R2++] = R1
	cmp R2, R3
	jne ?L_BufClrLoop
	
L_A18_Ch1:
	R2 = R_SACM_DECODE_OUT_Buffer
	[R_SACM_A1800_fptr_DAC_Out_PTR_Decode] = R2
	[R_SACM_A1800_fptr_DAC_Out_PTR_Play] = R2
	R1 = R_SACM_A1800_fptr_Play_Flag
	tstb [R1], C_SACM_MIXER_PAUSE_Num
	jne L_NextChannel?
	setb [R1], C_SACM_MIXER_DECODE_WORK_Num
	setb [R1], C_SACM_MIXER_FIQ_EVEN_Num
	call _SACM_A1800_fptr_ServiceLoop
L_Brach0?:	
	R2 = [R_SACM_Mixer_DAC_Out_PTR_Decode]
	R3 = C_CH2_DECODE_OUT_LENGTH
	R3 += R2
	[R_Mixer_CH2_DacOutData] = R4 - R4
L_Loop?:	
	call F_ISR_Service_SACM_A1800_fptr
	R4 = [R_Mixer_CH2_DacOutData]
	[R2++] = R4
	cmp R3, R2
	jne L_Loop?
L_NextChannel?:	    	
	retf
	.endp	
	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SACM_Mixer_CH2_ServiceLoop:	.proc
F_SACM_Mixer_CH2_ServiceLoop: 
 	push R1, R5 to [SP];
	R1 = [R_SACM_Mixer_Play_Flag];
	tstb R1, C_SACM_MIXER_DECODE_WORK_Num	// check if Decode_Out buffer empty
	jnz ?L_Check_Play;
	pop R1, R5 from [SP];
	retf;
	
?L_Check_Play:
	tstb R1, C_SACM_MIXER_PLAY_Num	//test R1, C_SACM_MS02PN_PLAY;				// check playing
	jnz ?L_Check_Pause;
	pop R1, R5 from [SP];
	retf;

?L_Check_Pause:
	tstb R1, C_SACM_MIXER_PAUSE_Num	//test R1, C_SACM_MS02PN_PAUSE;			// check pause
	jz ?L_Continue_1;
	pop R1, R5 from [SP];
	retf;

?L_Continue_1:								// one of Decode_Out buffer empty
	R2 = 0;
	R2 = R2 rol 4;
	[R_ShiftStore_ServiceLoop] = R2;		// Save 4-bit Shift Buffer

	clrb [R_SACM_Mixer_Play_Flag], C_SACM_MIXER_DECODE_WORK_Num	
	call F_SACM_Mixer_CH2_Decode_Process;		// decode one frame data
	R2 = R_SACM_Mixer_DAC_Out_Buffer;
	R1 = [R_SACM_Mixer_Play_Flag];
	tstb R1, C_SACM_MIXER_DECODE_ODD_Num	// check Decode_Out buffer 0
	jnz ?L_Branch_0;

	R2 += C_CH2_DECODE_OUT_LENGTH;				// set Decode_Out buffer pointer to buffer1
?L_Branch_0:
	[R_SACM_Mixer_DAC_Out_PTR_Decode] = R2;	// set Decode_Out pointer
	invb R1, C_SACM_MIXER_DECODE_ODD_Num	//R1 ^= C_SACM_MS02PN_DECODE_ODD;			// change Decode_Out buffer
	[R_SACM_Mixer_Play_Flag] = R1;
?L_Branch_2:
	R2 = [R_ShiftStore_ServiceLoop];
	R2 = R2 lsr 4;							// Retore 4-bit Shift Buffer
	pop R1, R5 from [SP];
	retf;
	.endp
 	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_SACM_Mixer_CH2_StartPlay:	.proc
	R1 = C_CH2_DECODE_OUT_LENGTH
	[P_DMA1_DTN] = R1
	
	R1 = R_SACM_Mixer_DAC_Out_Buffer
	[P_DMA1_SRCADR] = R1
	
	R1 = P_AUDIO_CH2_Data
	[P_DMA1_DSTADR] = R1
	
	R1 = C_DMA_Request_DAC2 | C_DMA_Cont_Enable | C_DMA_Src_Inc_Enable | C_DMA_Dest_Inc_Disable | C_DMA_Circular_Enable | C_DMA_Done_INT_Enable | C_DMA_Enable
	[P_DMA1_CTRL0] = R1
	
	R1 = C_DMA_Double_Buf_Enable | C_DMA_Start
	[P_DMA1_CTRL1] = R1
	
	R1 = [P_AUDIO_Ctrl1];
	R1 |= C_AUD_CH2_DMA_Enable
	[P_AUDIO_Ctrl1] = R1;
	
	R1 = [P_INT_Ctrl]
	R1 |= C_IRQ3_DMA1
	[P_INT_Ctrl] = R1

	R1 = [P_AUDIO_Ctrl1]
	R1 |= C_AUDIO_PWM_Enable
	[P_AUDIO_Ctrl1] = R1;
	
	retf
	.endp	
	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_SACM_Mixer_CH2_EndPlay:	.proc									
	nop;
	retf;
	.endp		

//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
F_SACM_Mixer_CH2_SendDAC1:	.proc							
	[P_AUDIO_CH1_Data] = R4;
	retf;
	.endp

//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
F_SACM_Mixer_CH2_SendDAC2:	.proc								
    [P_AUDIO_CH2_Data] = R4;
	retf; 
	.endp
	
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//**************************************************************** 	
Mixer_CH2_ISR_Service_ROMBLOCK:	.section	.code
F_ISR_Service_SACM_Mixer_CH2:
	push R2,R5 to [SP];

	R1 = [R_SACM_Mixer_Play_Flag];
	tstb R1, C_SACM_MIXER_FIQ_SOUND_Num		// check sound output
	je ?L_FIQ_Decode_End

	R2 = [R_SACM_Mixer_DAC_Out_PTR_Play];
	R4 = [R2++];							// get data from DAC_OUT buffer

	tstb R1, C_SACM_MIXER_ENABLE_DAC1_Num	//test R1, C_SACM_MS02PN_ENABLE_DAC1;
	jz ?L_DAC2Check;
	push R1, R5 to [SP];							// 2007.10.03 Ray
	call F_SACM_Mixer_CH2_SendDAC1;
	pop R1, R5 from [SP];							// 2007.10.03 Ray

?L_DAC2Check:
	tstb R1, C_SACM_MIXER_ENABLE_DAC2_Num	//test R1, C_SACM_MS02PN_ENABLE_DAC2;
	jz ?L_NoDAC
	push R1, R5 to [SP];							// 2007.10.03 Ray
	call F_SACM_Mixer_CH2_SendDAC2;
	pop R1, R5 from [SP];							// 2007.10.03 Ray

?L_NoDAC:
	R3 = R_SACM_Mixer_DAC_Out_Buffer + C_CH2_DECODE_OUT_LENGTH;
	R4 = R3;								// buffer 1 start address
	tstb R1, C_SACM_MIXER_FIQ_EVEN_Num		// check play buffer
	jnz ?L_CheckPointerEnd;
	R3 += C_CH2_DECODE_OUT_LENGTH;				// buffer 1 end address, EVEN = '0'
	R4 -= C_CH2_DECODE_OUT_LENGTH;				// buffer 0 start address
?L_CheckPointerEnd:
	cmp R2, R3;								// check if Play pointer point to buffer end
	jae ?L_Switch_DAC_Out_Buffer;
	[R_SACM_Mixer_DAC_Out_PTR_Play] = R2;	// Play pointer does not point to buffer end
	jmp ?L_FIQ_Decode_End;
	
?L_Switch_DAC_Out_Buffer:					// switch Play buffer
	setb R1, C_SACM_MIXER_DECODE_WORK_Num	// not play end, set DECODE_WORK flag
	invb R1, C_SACM_MIXER_FIQ_EVEN_Num		// switch play buffer
	[R_SACM_Mixer_Play_Flag] = R1;
	[R_SACM_Mixer_DAC_Out_PTR_Play] = R4;	// update new Play pointer

?L_FIQ_Decode_End:
	R1 = [R_SACM_Mixer_Play_Flag];
	pop R2,R5 from [SP];
	retf; 		

//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//**************************************************************** 	
.external _test_irq3_period
.public F_ISR_DMA_Ser_SACM_Mixer_Ch2
F_ISR_DMA_Ser_SACM_Mixer_Ch2:	.proc
  call _test_irq3_period
	setb [R_SACM_Mixer_Play_Flag], C_SACM_MIXER_DECODE_WORK_Num	// not play end, set DECODE_WORK flag
	retf; 	
	.endp






	
