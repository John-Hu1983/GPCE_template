//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc

//**************************************************************************
// External Table Declaration
//**************************************************************************
.external 	T_SPUSpeech_Table
.external 	T_ChMap
.external 	T_ChEnableLB
.external 	T_ChEnableHB
.external 	T_ChDisableLB
.external 	T_ChDisableHB

.external 	R_ChSpeechStatus

//**************************************************************************
// Contant Defintion Area
//**************************************************************************
.define		D_ChannelNo		8
.define 	D_ON			1
.define 	D_OFF 			0

//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public 	_SpeechPowerUpInitial
.public 	F_SpeechPowerUpInitial
.public 	_PlaySPUSpeech
.public 	F_PlaySPUSpeech
.public 	_SpuIrqSpeechService
.public 	F_SpuIrqSpeechService
.public 	_StopSPUSpeech
.public 	F_StopSPUSpeech
.public 	_SetSPUChVolume
.public 	F_SetSPUChVolume

.public 	_g_SPUVol
//**************************************************************************
// RAM Definition Area
//**************************************************************************
.RAM
_g_SPUVol: 		.dw 	1 	DUP(?)	

.var 	R_SpeechStatus
.var 	R_SpeechIndex
.var	R_RepeatCounter	
.var	R_SpeechSPU_FS	
.var	R_SpeechSPU_SR		
R_SpeechAddr_BS: 		.dw 	2 	DUP(?)	
.define 	R_SpeechAddr_DS 	R_SpeechAddr_BS + 1


//R_ChSpeechStatus:       .dw     D_ChannelNo 	DUP(?)     //For each SPU channel
.define		D_SpeechPlaying 	0x0008
.define		D_SpeechRepeat      0x0004	
.define		D_SpeechPause   	0x0002	
.define		D_SpeechZCJump  	0x0001 

//*****************************************************************************
// Table Definition Area
//*****************************************************************************
.TEXT

    
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
 _SpeechPowerUpInitial:	.proc
F_SpeechPowerUpInitial:
	push R1 to [sp]
	R1 = [R_SpeechStatus]
	R1 -= [R_SpeechStatus]
	[R_SpeechStatus] = R1
	
	R1 = [P_INT_Ctrl];
	R1 |= C_IRQ5_SPU;
	[P_INT_Ctrl] = R1;
	
	pop R1 from [sp]
	retf
	.endp

//****************************************************************
// Function    : F_PlaySPUSpeech
// Description : 
// Destory     : 
// Parameter   : R1 = Speech index, R2 = Channel number, R3 = Sample Rata, R4 = Algorithm
// Return      : 
// Note        : 
//****************************************************************	    
 _PlaySPUSpeech:	.proc    
 	R4 = SP + 3
 	R1 = [R4++]
 	R2 = [R4++]
 	R3 = [R4++]
 	R4 = [R4]
F_PlaySPUSpeech: 
	push R1, R5 to [sp]
	cmp R2, D_ChannelNo
	jb L_GOS?
	goto L_Exit?
L_GOS?:
	R5 = R2 					//Backup channel index
	[R_SpeechSPU_FS] = R3
	//[R_SpeechIndex] = R1
	//%TrunOnAudio	
	//;----------------------------------
	R1 += R1;
	R2 = seg16 (T_SPUSpeech_Table);	// 2007.10.03 Ray
	R1 += T_SPUSpeech_Table;		// get MIDI data address
	R2 += 0, carry;			
	DS = R2
	
	R2 = D:[R1++];					// Speech data address low word		
	R1 = D:[R1];					// Speech data address high word	
	
//	DS = R1
//	R3 = [R2]					// SR Register Setting Value
//	[R_SpeechSPU_FS] = R3
//	
//	R2 += 1
//	R1 += 0, carry
//	DS = R1
//	R3 = [R2]					// Algorithm ID
//	
//	cmp R3, C_SPU_Format_A34Pro4
//	jne L_CheckNext_1?
//	R3 = 0x0000
//	[R_SpeechAddr_DS] = R3
//	R2 += 2
//	R1 += 0, carry
//	jmp L_GetDPTR?
//L_CheckNext_1?:	
//	cmp R3, C_SPU_Format_A34Pro5
//	jne L_CheckNext_2?
//	R3 = 0x4000
//	[R_SpeechAddr_DS] = R3
//	R2 += 2
//	R1 += 0, carry
//	jmp L_GetDPTR?
//L_CheckNext_2?:	
//	cmp R3, C_SPU_Format_PCM8
//	jne L_CheckNext_3?
//	R3 = 0x8000
//	[R_SpeechAddr_DS] = R3
//	jmp L_GetDPTR?
//L_CheckNext_3?:
//	cmp R3, C_SPU_Format_PCM16
//	jne L_ExitSPUPlay?
//	R3 = 0xc000
//	[R_SpeechAddr_DS] = R3
//	jmp L_GetDPTR?
//L_ExitSPUPlay?:	
//	goto L_Exit?	
//L_GetDPTR?:
//	R2 += 2
//	R1 += 0, carry
	R2 += R2
	R1 += R1, carry		//word mode to byte mode
	//////////////////////////////////
//	R2 -= (0x8000+0x0001)
//	R1 -= 0, carry
	R2 -= (0x0001)
	R1 -= 0, carry
	cmp R4, C_SPU_Format_PCM8
	jne L_Check_1?
	R3 = 0x8000			//PCM8
	jmp L_CheckEnd?
L_Check_1?:
	cmp R4, C_SPU_Format_PCM16
	jne L_Check_2?
	R3 = 0xC000			//PCM16
	jmp L_CheckEnd?
L_Check_2?:
	cmp R4, C_SPU_Format_A34Pro4
	jne L_Check_3?		
//	R2 += (0x0004)
		R2 += (0x000a)
	R1 += 0, carry
	R3 = 0x0000			//A3400Pro4
	jmp L_CheckEnd?
L_Check_3?:	
	//R2 += (0x0004)
		R2 += (0x000a)
	R1 += 0, carry
	R3 = 0x4000			//A3400Pro5
L_CheckEnd?:
	[R_SpeechAddr_DS] = R3
	R1 |= [R_SpeechAddr_DS]
	[R_SpeechAddr_DS] = R1
	[R_SpeechAddr_BS] = R2
	
	R1 = P_SPU_CH_Ctrl
	tstb [R1], R5
	jz L_SPUPlayDirectly?
	R2 = R5 + 0x0008
	tstb [R1], R2
	jnz L_CloseCh?
	goto L_ConcatenationS?
	
//	R1 = [P_SPU_CH_Ctrl]
//	R2 = R5 + T_ChEnableLB
//	R2 = [R2]
//	test R1, R2
//	jz L_SPUPlayDirectly?
//	R2 = R5 + T_ChEnableHB
//	R2 = [R2]
//	test R1, R2
//	jnz L_CloseCh?
//	goto L_ConcatenationS?
L_CloseCh?:	
	clrb [R1], R5
L_SPUPlayDirectly?:	
//	R4 = R5 + T_ChMap
//	R4 = [R4]
	R4 = R5 lsl 4
	IRQ OFF
	R1 = 0
	R3 = R4 + P_SPU_Ch0_PhaseAdder
	[R3] = R1
	R3 = R4 + P_SPU_Ch0_LoopLength
	[R3] = R1
	R3 = R4 + P_SPU_Ch0_Filter_S2
	[R3] = R1
	R3 = R4 + P_SPU_Ch0_Filter_S1
	[R3] = R1
	
	R1 = [R_SpeechSPU_FS]
	R3 = R4 + P_SPU_Ch0_SampleFreq
	[R3] = R1
	
	R1 = [R_SpeechAddr_BS]
	R3 = R4 + P_SPU_Ch0_DPTR_L
	[R3] = R1
	
	R3 = R4 + P_SPU_Ch0_NextDPTR_L
	[R3] = R1
	
	R1 = [R_SpeechAddr_DS]
	R3 = R4 + P_SPU_Ch0_DPTR_H
	R1 |= 0x2000
	[R3] = R1
	
	R3 = R4 + P_SPU_Ch0_NextDPTR_H
	[R3] = R1
	
	//R1 = [R_SpeechSPU_Vol]
	//R1 &= 0x007f
	//setb R1, 7
	//R1 = 0x007f
	//R1 = [_g_SPUVol]
	R1 = 0xFFFF
	R3 = R4 + P_SPU_Ch0_Volume_Ctrl
	[R3] = R1
	
	R3 = 0
	setb R3, R5
	[P_SPU_INT_Status] = R3   //;Clear channel IRQ status
	
	R4 = R5 + R_ChSpeechStatus
	R3 = [R4]
	R3 |= (D_SpeechPlaying)
	R3 &= ~(D_SpeechRepeat+D_SpeechPause)
	[R4] = R3	
	
	R3 = P_SPU_INT_Ctrl
	setb [R3], R5			//;Enable channel IRQ
	
	R3 = P_SPU_CH_Ctrl
	setb [R3], R5			//;Turn on the channel
	
	IRQ ON
	goto L_ExitPlayHWSpeech?
L_ConcatenationS?:	
//	R4 = R5 + T_ChMap
//	R4 = [R4]
	R4 = R5 lsl 4
	IRQ OFF
	R1 = [R_SpeechAddr_BS]
	R3 = R4 + P_SPU_Ch0_NextDPTR_L
	[R3] = R1
	
	R1 = [R_SpeechAddr_DS]
	R3 = R4 + P_SPU_Ch0_NextDPTR_H
	[R3] = R1
	
//	R1 = [R_SpeechSPU_Vol]
//	R1 &= 0x007f
//	R1 = R1 lsl 4
//	R1 = R1 lsl 4				//;Next sample's volume
//	R1 = 0x7f00
	R1 = [_g_SPUVol]
	R1 &= 0xff00
	R3 = R4 + P_SPU_Ch0_Volume_Ctrl
	R2 = [R3]
	R2 &= 0x00ff
	R1 |= R2
	R1 = 0xFFFF
	[R3] = R1
	
	R1 = 0
	setb R1, R5
	[P_SPU_INT_Status] = R1		//;Clear channel IRQ status
	
	R4 = R5 + R_ChSpeechStatus
	R1 = [R4]
	R1 |= (D_SpeechZCJump+D_SpeechPlaying)
	R1 &= ~(D_SpeechRepeat+D_SpeechPause)
	[R4] = R1	
	
	R3 = P_SPU_INT_Ctrl
	setb [R3], R5			//;Enable channel IRQ
	
	R1 = P_SPU_CH_Ctrl
	R2 = R5 + 0x0008
	setb [R1], R2				//;Enable concatenate jump
	IRQ ON
	
L_ExitPlayHWSpeech?:
	R1 = R_SpeechStatus
	setb [R1], R5
L_Exit?:
	pop R1, R5 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_SpuIrqSpeechService
// Description : 
// Destory     : 
// Parameter   :  
// Return      : 
// Note        : 
//****************************************************************	    	
 _SpuIrqSpeechService:	.proc
F_SpuIrqSpeechService:	
	push R1, R5 to [sp]
	R1 = [P_SPU_INT_Status]
	R1 &= [P_SPU_INT_Ctrl]
	jnz L_PrecedeS?
	goto L_ExitSpuIrqSpService?
L_PrecedeS?:	
	R3 = 0
L_CheckChLoop?:
	tstb R1, R3
	jz L_CheckNext?	
//	R2 = R3 + T_ChMap
//	R2 = [R2]
	R2 = R3 lsl 4
	call F_SetSpeechIrqPara
L_CheckNext?:
	R3 += 1
	cmp R3, D_ChannelNo
	jb L_CheckChLoop?
L_CheckTurnOff?:	
L_ExitSpuIrqSpService?:	
	pop R1, R5 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_SetSpeechIrqPara
// Description : 
// Destory     : 
// Parameter   : R3 = SPU Channel index 
// Return      : 
// Note        : 
//****************************************************************	   	
F_SetSpeechIrqPara:	.proc
	R4 = R3 + R_ChSpeechStatus
	R5 = [R4]
	test R5, D_SpeechPlaying
	jnz L_GONS?
	goto L_ExitSetSpeechIrqPara?
L_GONS?:
	test R5, D_SpeechZCJump		//;Check if concatenate jump mode is enabled
	jnz L_SpeechZCIrqJump?	
	test R5, D_SpeechRepeat		//;Check if speech repeat flag is set
	jnz L_ChkRepeat?
L_SpeechEnd?:
	R5 &= ~(D_SpeechPlaying)	//;Close channel when a speech is finished
	[R4] = R5
	
	R4 = P_SPU_INT_Ctrl
	clrb [R4], R3				//;Disable Channel IRQ
	
	R4 = P_SPU_CH_Ctrl
	clrb [R4], R3				//;Close Channel
	
	R4 = R_SpeechStatus
	clrb [R4], R3				
	
	goto L_ExitSetSpeechIrqPara?
	
//	R4 = [P_SPU_INT_Ctrl]
//	R4 &= 0x00ff
//	clrb R4, R3
//	[P_SPU_INT_Ctrl] = R4		//;Disable Channel IRQ
//	
//	R4 = [P_SPU_CH_Ctrl]
//	clrb R4, R3
//	[P_SPU_CH_Ctrl] = R4			//;Close Channel
//	
//	R4 = [R_SpeechStatus]
//	R5 = R3 + T_ChDisableLB
//	R5 = [R5]
//	R4 &= R5
//	[R_SpeechStatus] = R4		//;Disable Channel IRQ
//	goto L_ExitSetSpeechIrqPara?

L_SpeechZCIrqJump?:
	R5 |= D_SpeechPlaying
	R5 &= ~(D_SpeechZCJump)
	[R4] = R5	
	R4 = R2 + P_SPU_Ch0_SampleFreq
	R5 = [R_SpeechSPU_FS]
	[R4] = R5
	
	R4 = 0
	setb R4, R3
	[P_SPU_INT_Status] = R4		//;Clear Channel IRQ status
	
	goto L_ExitSetSpeechIrqPara?
	
//	R4 = [P_SPU_INT_Ctrl]
//	R4 &= 0x00ff
//	R5 = R3 + T_ChEnableHB
//	R5 = [R5]
//	R4 |= R5
//	[P_SPU_INT_Ctrl] = R4		//;Clear Channel IRQ status
//	goto L_ExitSetSpeechIrqPara?
 
L_ChkRepeat?:
	R4 = [R_RepeatCounter] 
	R4 -= 1
	[R_RepeatCounter] = R4
	cmp R4, 0x0001
	je L_DisableRepeat?
	jcc L_CloseRepeat?
	
	R4 = 0
	setb R4, R3
	[P_SPU_INT_Status] = R4		//;Clear Channel IRQ status
	goto L_ExitSetSpeechIrqPara?
	
//	R4 = [P_SPU_INT_Ctrl]
//	R4 &= 0x00ff
//	R5 = R3 + T_ChEnableHB
//	R5 = [R5]
//	R4 |= R5
//	[P_SPU_INT_Ctrl] = R4		//;Clear Channel IRQ status
//	goto L_ExitSetSpeechIrqPara?
 
L_CloseRepeat?: 
	R4 = P_SPU_CH_Ctrl
	clrb [R4], R3				//;Close SPU
	
	R4 = 0
	setb R4, R3
	[P_SPU_INT_Status] = R4		//;Clear Channel IRQ status
	
	R4 = P_SPU_INT_Ctrl
	clrb [R4], R3				//;Disable IRQ
	
	R4 = R3 + R_ChSpeechStatus
	R5 = [R4]
	R5 &= ~(D_SpeechPlaying+D_SpeechRepeat) 
	[R4] = R5
	
	R4 = R_SpeechStatus
	clrb [R4], R3
	goto L_ExitSetSpeechIrqPara?

//	R4 = [P_SPU_CH_Ctrl]
//	R5 = R3 + T_ChDisableLB
//	R5 = [R5]
//	R4 &= R5
//	[P_SPU_CH_Ctrl] = R4			//;Close Channel
//	
//	R4 = [P_SPU_INT_Ctrl]
//	R4 &= 0x00ff
//	R5 = R3 + T_ChDisableLB
//	R5 = [R5]
//	R4 &= R5
//	[P_SPU_INT_Ctrl] = R4		//;Clear Channel IRQ status
//	R5 = R3 + T_ChEnableHB
//	R5 = [R5]
//	R4 |= R5
//	[P_SPU_INT_Ctrl] = R4
//	
//	R4 = R3 + R_ChSpeechStatus
//	R5 = [R4]
//	R5 &= ~(D_SpeechPlaying+D_SpeechRepeat) 
//	[R4] = R5
//	
//	R4 = R3 + T_ChDisableLB
//	R4 = [R4]
//	R4 &= [R_SpeechStatus]
//	[R_SpeechStatus] = R4
//	goto L_ExitSetSpeechIrqPara?
	
L_DisableRepeat?:
	R4 = 0
	setb R4, R3
	[P_SPU_INT_Status] = R4		//;Clear Channel IRQ status
	
	R4 = R2 + P_SPU_Ch0_Volume_Ctrl
	R5 = [R4]
	R5 &= 0x007f
	[R4] = R5

//	R4 = [P_SPU_INT_Ctrl]
//	R4 &= 0x00ff
//	R5 = R3 + 0x0008 			// High byte
//	setb R4, R5	
//	[P_SPU_INT_Ctrl] = R4		// Clear INT Status
//	
//	R4 = R3 + T_ChMap
//	R4 = [R4]
//	R4 += P_SPU_Ch0_Volume_Ctrl
//	R5 = [R4]
//	R5 &= 0x007f
//	[R4] = R5
L_ExitSetSpeechIrqPara?:	
	retf
	.endp	
	
//****************************************************************
// Function    : F_PauseSPUSpeech
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : 
// Note        : 
//****************************************************************	   	
 _PauseSPUSpeech:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_PauseSPUSpeech:	
	push R2, R3 to [sp]
	cmp R1, D_ChannelNo
	jae ?L_ExitPauseSpeech
	
	R2 = P_SPU_CH_Ctrl
	clrb [R2], R1
	
	R2 = R1 + R_ChSpeechStatus
	R3 = [R2]
	R3 |= D_SpeechPause				//;Set pause flag
	[R2] = R3
?L_ExitPauseSpeech:	
	pop R2, R3 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_PauseSPUSpeech
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : 
// Note        : 
//****************************************************************	   		
 _ResumeSPUSpeech:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_ResumeSPUSpeech: 
	push R2, R3 to [sp]
	cmp R1, D_ChannelNo
	jae ?L_ExitResumeSpeech

	R2 = P_SPU_CH_Ctrl
	setb [R2], R1

	R2 = R1 + R_ChSpeechStatus
	R3 = [R2]
	R3 &= ~(D_SpeechPause)				//;Set pause flag
	[R2] = R3
?L_ExitResumeSpeech:
	pop R2, R3 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_CheckIfSPUSpeechChPause
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : R1 = 0, the channel is not paused; R1 = 1, the channel is paused
// Note        : 
//****************************************************************	 	
 _CheckIfSPUSpeechChPause:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_CheckIfSPUSpeechChPause:		
	push R2, R4 to [sp]
	cmp R1, D_ChannelNo
	jae ?L_ExitCheck
	
	R4 = R1
	R1 = 0
	R2 = R4 + R_ChSpeechStatus
	R3 = [R2]
	test R3, D_SpeechPause
	jz ?L_ExitCheck
	R1 = 0x0001
?L_ExitCheck:
	pop R2, R4 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_CheckIfSPUSpeechChPause
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index, R2 = Play times
// Return      : 
// Note        : 
//****************************************************************	
 _RepeatSpeechOn:	.proc
 	R2 = SP + 3
 	R1 = [R2++]				//SPU Channel index
 	R2 = [R2]				//Play Tiems
F_RepeatSpeechOn:	
	push R2, R5 to [sp]
	cmp R1, D_ChannelNo
	jae ?L_Exit
	[R_RepeatCounter] = R2
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	
	IRQ OFF
	R3 = R1 + R_ChSpeechStatus
	R4 = [R3]
	R4 |= D_SpeechRepeat
	[R3] = R4
	
	R3 = [P_INT_Ctrl]
	R3 |= C_IRQ5_SPU
	[P_INT_Ctrl] = R3
	
	R3 = [P_SPU_INT_Ctrl]
	R3 &= 0x00ff
	setb R3, R1
	[P_SPU_INT_Ctrl] = R3	//;Enable channel SPU IRQ
	
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	R4 = [R3]
	R5 = R4 lsl 4
	R5 = R5 lsl 4
	R4 |= R5
	R4 |= 0x8080
	[R3] = R4
	IRQ ON
?L_Exit:	
	pop R2, R5 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_CheckIfSPUSpeechChPause
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : 
// Note        : 
//****************************************************************		
 _RepeatSpeechOff:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_RepeatSpeechOff: 
	push R2, R4 to [sp]
	cmp R1, D_ChannelNo
	jae ?L_Exit
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	
	R3 = [P_SPU_INT_Ctrl]
	R3 &= 0x00ff
	R4 = R1 + 0x0008
	setb R3, R4 
	[P_SPU_INT_Ctrl] = R3	//clear SPU IRQ status
	
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	clrb [R3], 7
	
	R3 = 0
	[R_RepeatCounter] = R3
	
	R3 = R1 + R_ChSpeechStatus
	R4 = [R3]
	R4 &= ~(D_SpeechRepeat)
	[R3] = R4	
	
	R3 = [P_SPU_INT_Ctrl]
	R3 &= 0x00ff
	clrb R3, R1 
	[P_SPU_INT_Ctrl] = R3	//;Disable SPU IRQ
?L_Exit:	
	pop R2, R4 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_AlwaysRepeatSp
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : 
// Note        : 
//****************************************************************	
 _AlwaysRepeatSp:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_AlwaysRepeatSp:
	push R2, R5 to [sp]
	cmp R1, D_ChannelNo
	jae L_Exit?
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	
	R3 = [P_SPU_INT_Ctrl]
	R3 &= 0x00ff
	clrb R3, R1
	[P_SPU_INT_Ctrl] = R3
	
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	R4 = [R3]
	R5 = R4 lsl 4
	R5 = R5 lsl 4
	R4 |= R5
	R4 |= 0x8080
	[R3] = R4
L_Exit?:
	pop R2, R5 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_AlwaysRepeatSp
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : 
// Note        : 
//****************************************************************		
 _StopSPUSpeech:	.proc 
 	R1 = SP + 3
 	R1 = [R1]
F_StopSPUSpeech:	
	push R2, R3 to [sp]
	cmp R1, D_ChannelNo
	jae L_Exit?
	
	R2 = P_SPU_CH_Ctrl
	clrb [R2], R1			//;Close channel
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	R3 = R1 + 0x0008
	clrb R2, R1				//;Disable SPU IRQ
	setb R2, R3				//;Clear IRQ status
	[P_SPU_INT_Ctrl] = R2
	
	R2 = R1 + R_ChSpeechStatus
	R3 = [R2]
	R3 &= ~(D_SpeechPlaying)
	[R2] = R3	
	
	R2 = R_SpeechStatus
	clrb [R2], R1
L_Exit?:	
	pop R2, R3 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_AlwaysRepeatSp
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : R1 = 0, no speech is played; R1 = 1, a speech is played
// Note        : 
//****************************************************************		
 _CheckIfSPUSpeechPlaying:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_CheckIfSPUSpeechPlaying:	
	push R2, R3 to [sp]
	cmp R1, D_ChannelNo
	jae L_Exit?
	
	R2 = R1 
	R1 = 0
	R3 = R2 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jz L_Exit?
	R1 = 0x0001
L_Exit?:
	pop R2, R3 from [sp]
	retf
	.endp
	
	
//****************************************************************
// Function    : F_AlwaysRepeatSp
// Description : 
// Destory     : 
// Parameter   : R1 = SPU Channel index
// Return      : R1 = 0, no speech is played; R1 = 1, a speech is played
// Note        : 
//****************************************************************			
 _SetSPUChVolume:	.proc
 	R2 = SP + 3
 	R1 = [R2++]	//SPU Channel 
 	R2 = [R2]   //Volume
F_SetSPUChVolume:
	push R1, R3 to [SP]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_Volume_Ctrl
	R3 = R2 lsl 4
	R3 = R3 lsl 4
	R3 &= 0xFF00
	R3 |= R2
	[R1] = R3
	pop R1, R3 from [SP]
	retf
	.endp