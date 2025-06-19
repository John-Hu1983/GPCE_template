//==========================================================================
// File Name   : SACM_A3400Pro_fptr_USER.asm
// Description : Users implement functions
// Written by  : Ray Cheng
// Last modified date:
//              2005/12/26
// Note: 
//==========================================================================

//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc
.include A34Pro_fptr.inc

//**************************************************************************
// Table Publication Area
//**************************************************************************
.public D_IO_EVENT_NUM 
.public D_SW_PWM_LEVEL
.public T_IO_Event

//**************************************************************************
//  Definition Channel
//**************************************************************************
.define More_than_1_channel 1
//***************************************************************************************
// User Definition Section for IO Event
//***************************************************************************************
.define C_IO_EVENT_NUM    3                      // IO number for IO_Event 
.define C_SW_PWM_FREQ     60                     // PWM frequency (Unit: Hz)
.define C_SW_PWM_LEVEL    128                    // PWM level selection (32/64/128/256)
.define C_PWM_FREQ        65536 - (SystemClock / (C_SW_PWM_FREQ * C_SW_PWM_LEVEL))      // for PWM Service Timer Setting

.code 
//
// IO Event Definition
// - Mapped to the number of Edit Event on G+ Eventor
//
T_IO_Event:
.DD    C_IOB8
.DD    C_IOB9
.DD    C_IOB10
.DD    C_IOB11
.DD    C_IOB12
.DD    C_IOB13
.DD    C_IOB14
.DD    C_IOB15

.DD    C_IOA4
.DD    C_IOA5
.DD    C_IOA6
.DD    C_IOA7
.DD    C_IOA8
.DD    C_IOA9
.DD    C_IOA10
.DD    C_IOA11
.DD    C_IOA12
.DD    C_IOA13
.DD    C_IOA14
.DD    C_IOA15


//**************************************************************************
// Contant Defintion Area
//**************************************************************************
.define C_RING_BUFFER_LEN               0  // Define ring buffer length

.define C_SpeechNumberLength		    4    // for skip song number

.define C_SACM_A3400Pro_fptr_PLAY			0x0001
.define	C_SACM_A3400Pro_fptr_AUTO			0x0080


//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public  _USER_A34Pro_fptr_SetStartAddr
.public F_USER_A34Pro_fptr_SetStartAddr
.public F_USER_A34Pro_fptr_GetData
.public  _USER_A34Pro_fptr_Volume
.public F_USER_A34Pro_fptr_Volume
.public F_SACM_A34Pro_fptr_SendDAC1
.public F_SACM_A34Pro_fptr_SendDAC2
.public F_SACM_A34Pro_fptr_StartPlay
.public F_SACM_A34Pro_fptr_EndPlay
.public F_SACM_A34Pro_fptr_Init_
.public F_SACM_A34Pro_fptr_GetStartAddr_Con
.public F_A34Pro_fptr_Event_Init
.public F_A34Pro_fptr_GetExtStartAddr
.public F_A34Pro_fptr_GetEvtData
.public F_A34Pro_fptr_IoEvtStart
.public F_A34Pro_fptr_IoEvtEnd
.public F_A34Rro_fptr_UserEvtProcess
.public F_A34Rro_fptr_IOEvtProcess
.public  _A34Pro_fptr_ServiceLoop
.public F_A34Pro_fptr_ServiceLoop
.public  _A34Pro_fptr_InitRingBuffer
.public F_A34Pro_fptr_InitRingBuffer


//**************************************************************************
// Variable Publication Area
//**************************************************************************
.public R_DutyArray 
.public R_A3400Pro_fptr_DAC_Data
.public R_DAC1_Mixer_Data
.public R_DAC2_Mixer_Data
.public R_A34Pro_CH1

//**************************************************************************
// External Function Declaration
//**************************************************************************
.external F_AutoModeReadNWords
.external F_AutoModeReadAWords
.external F_SACM_Delay


//**************************************************************************
// RAM Definition Area
//**************************************************************************
.RAM
.var R_ExtMem_Low
.var R_ExtMem_High
.var R_ExtMem_Low_Con
.var R_ExtMem_High_Con
.var R_SPI_Addr_Low
.var R_SPI_Addr_High
.var R_A3400Pro_fptr_DAC_Data
.var R_DAC1_Mixer_Data
.var R_DAC2_Mixer_Data

.var R_A34Pro_CH1

R_SACM_Ring_Buffer:    .dw    C_RING_BUFFER_LEN    dup(?)
.var    R_RingBufferWrPtr                                 
.var    R_RingBufferRdPtr 

R_DutyArray:    .dw    C_IO_EVENT_NUM    dup(?)  


//*****************************************************************************
// Table Definition Area
//*****************************************************************************
.CODE
// Volume Table
T_SACM_A3400Pro_fptr_Volume_Level:
.dw 0x0000, 0x0250, 0x0500, 0x1000
.dw	0x1500, 0x2000, 0x2500, 0x3000
.dw 0x3500, 0x4000, 0x5000, 0x6500
.dw	0x7d00, 0x9c00, 0xc400, 0xf500

D_IO_EVENT_NUM:
.DW C_IO_EVENT_NUM

D_SW_PWM_LEVEL:
.DW C_SW_PWM_LEVEL


//*****************************************************************************
// CODE Definition Area
//*****************************************************************************
.CODE

//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_Init_
// Description : Hardware initilazation for A3400Pro, called by library
// Destory     : R1
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************
F_SACM_A34Pro_fptr_Init_:	.proc
//	FIR_MOV OFF;
//	
//	R1 = [P_Timer_Ctrl];
//	R1 |= C_TimerB_SYSCLK;
//	[P_Timer_Ctrl] = R1;
//	R1 = C_Timer_Setting_12K;
//	[P_TimerB_Data] = R1;
//	[P_TimerB_CNTR] = R1;
//	
//	R1 = [P_AUDIO_Ctrl2]
//	R1 |= C_AUD_CH2_Up_Sample_Enable | C_AUD_CH2_TMR_Sel_TimerB | C_AUD_CH2_Half_Vol_Enable;
//	[P_AUDIO_Ctrl2] = R1;
//
//	R1 = C_MuteControl_Lv3 | 0x001F;
//	[P_AUDIO_Ctrl1] = R1;
//
//	R1 = [P_INT_Ctrl];
//	R1 |= C_IRQ1_TMB;
//	[P_INT_Ctrl] = R1;
//
//
//    //
//    // Initialize R_RingBufferWrPtr and R_RingBufferRdPtr 
//    //
//    R1 = R_SACM_Ring_Buffer;  
//    [R_RingBufferWrPtr] = R1;
//    [R_RingBufferRdPtr] = R1;  
//
//	IRQ on;
	retf;
	.endp

//*****************************************************************************
// Function    : F_USER_A3400Pro_fptr_Volume
// Description : Set speech volume
// Destory     : R1
// Parameter   : R1: volume index
// Return      : None
// Note        : None
//*****************************************************************************
 _USER_A34Pro_fptr_Volume: .proc
	R1 = SP + 3;
	R1 = [R1];								// volume index
F_USER_A34Pro_fptr_Volume:
	R2 = SEG T_SACM_A3400Pro_fptr_Volume_Level
	R1 += OFFSET T_SACM_A3400Pro_fptr_Volume_Level;		// loop up volume table
	R2 += 0, CARRY
	DS = R2
	R1 = D:[R1];
	call F_SACM_A34Pro_fptr_Volume;
	retf
	.endp


//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_SendDAC1
// Description : Send data to DAC1, called by library
// Destory     : None
// Parameter   : R4: 16-bit signed PCM data
// Return      : None
// Note        : None
//*****************************************************************************
F_SACM_A34Pro_fptr_SendDAC1:	.proc    
	[R_A34Pro_CH1] = R4
	//[P_AUDIO_CH1_Data] = R4;	
	retf;
	.endp

//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_SendDAC2
// Description : Send data to DAC2, called by library
// Destory     : None
// Parameter   : R4: 16-bit signed PCM data
// Return      : None
// Note        : None
//*****************************************************************************
F_SACM_A34Pro_fptr_SendDAC2:	.proc
    [P_AUDIO_CH2_Data] = R4;
	retf; 
	.endp

//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_StartPlay
// Description : This function called by library when Play function is callled
// Destory     : None
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************
F_SACM_A34Pro_fptr_StartPlay:	.proc
	R1 = [P_AUDIO_Ctrl1]
	R1 |= C_AUDIO_PWM_Enable		
	[P_AUDIO_Ctrl1] = R1;	
	retf;
	.endp

//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_EndPlay
// Description : This function called by library when speech play end
// Destory     : None
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************
F_SACM_A34Pro_fptr_EndPlay:	.proc
	nop;
	retf;
	.endp

//*****************************************************************************
// Function    : F_USER_A3400Pro_fptr_SetStartAddr
// Description : This API allows users to set the beginning address
//               to fetch data. This address can be either a ROM address
//               or a external storage address. User would have to modify
//               the function body based on the application's need.
// Destory     : None
// Parameter   : R1: Low byte of start address
//               R2: High byte of start address
// Return      : None
// Note        : None
//*****************************************************************************
 _USER_A34Pro_fptr_SetStartAddr:	.proc
	R2 = SP + 3;
	R1 = [R2++];
	R2 = [R2]
F_USER_A34Pro_fptr_SetStartAddr:
	[R_ExtMem_Low] = R1
	[R_ExtMem_High] = R2
	retf;
	.endp


//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_GetStartAddr_Con
// Description : 
// Destory     : None
// Parameter   : 
// Return      : None
// Note        : None
//*****************************************************************************
F_SACM_A34Pro_fptr_GetStartAddr_Con:	.proc
	R1 = [R_ExtMem_Low_Con];
	R2 = [R_ExtMem_High_Con];
	[R_ExtMem_Low] = R1;
	[R_ExtMem_High] = R2;
	retf;
	.endp

//*****************************************************************************
// Function    : F_USER_A3400Pro_fptr_GetData
// Description : Get speech data from internal or external memory
//               and fill these data to buffer of library.
// Destory     : None
// Parameter   : None
// Return      : R1: A3400Pro data
// Note        : None
//*****************************************************************************
F_USER_A34Pro_fptr_GetData:	.proc
//    R2 = [R_RingBufferRdPtr];    
//    R1 = [R2++];                                      
//    cmp R2, R_SACM_Ring_Buffer + C_RING_BUFFER_LEN;
//    jb ?L_StoreRingBufferRdPtr;                       
//    R2 = R_SACM_Ring_Buffer;                          
//?L_StoreRingBufferRdPtr:                              
//    [R_RingBufferRdPtr] = R2; 	

	R1 = [R_ExtMem_Low]
	R2 = [R_ExtMem_High]
	R3 = R1
	call F_AutoModeReadAWords
	R3 += 1
	R2 += 0, CARRY
	[R_ExtMem_Low] = R3
	[R_ExtMem_High] = R2
	retf;
	.endp

//*****************************************************************************
// Function    : F_A3400Pro_fptr_Event_Init
// Description : None
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : None
//***************************************************************************** 
F_A34Pro_fptr_Event_Init:    .proc
	push R1, BP to [sp];

	//
	// Initialize S/W PWM IO as output low
	// 	
	R1 = 0;  
	DS = SEG T_IO_Event
	R2 = OFFSET T_IO_Event;  	
?L_IOSettingLoop:   
	R3 = D:[R2++];
	R5 = D:[R2++];  
	R4 = [R5 + C_PORT_DIR_IDX];
	setb R4, R3;
	[R5 + C_PORT_DIR_IDX] = R4; 
	R4 = [R5 + C_PORT_ATT_IDX];
	setb R4, R3;     
	[R5 + C_PORT_ATT_IDX] = R4;   
	R4 = [R5 + C_PORT_BUF_IDX];
	clrb R4, R3;
	[R5 + C_PORT_BUF_IDX] = R4;  	
	R1 += 1;
	cmp R1, C_IO_EVENT_NUM;
	jb ?L_IOSettingLoop 
	
	//
	// Initialize TimerC and enable IRQ2_TimerC interrupt
	//
	R1 = [P_Timer_Ctrl];
	R1 |= C_TimerC_SYSCLK;
	[P_Timer_Ctrl] = R1;
	R1 = C_PWM_FREQ;
	[P_TimerC_Data] = R1;
	[P_TimerC_CNTR] = R1;  
	R1 = [P_INT_Ctrl];
	R1 |= C_IRQ2_TMC;
	[P_INT_Ctrl] = R1;  
	IRQ ON;  

?L_Event_Init_End:
	pop R1, BP from [sp];
	retf
	.endp

//*****************************************************************************
// Function    : F_A3400Pro_fptr_GetExtStartAddr
// Description : In the manual mode, library call this function to get 
//               external speech start address.
// Destory     : None
// Parameter   :
// Return      : R1 = Low ward of sound data addr  
//               R2 = High ward of sound data addr 
// Note        : None
//*****************************************************************************
F_A34Pro_fptr_GetExtStartAddr:	.proc	
	R1 = [R_ExtMem_Low];	
	R2 = [R_ExtMem_High];
	R1 -= 3
	R2 -= 0, CARRY
	R1 += R1
	R2 += R2, CARRY
	retf
	.endp

//*****************************************************************************
// Function    : F_USER_GetEvtData
// Description : In the manual mode, library call this function to get 
//               external event data. 
// Destory     : None
// Parameter   : R1 = Low ward of the event data addr  
//               R2 = High ward of the event data addr 
// Return      : R1 = Event Data
// Note        : None
//*****************************************************************************
F_A34Pro_fptr_GetEvtData:	.proc
    //call F_AutoModeReadAWords; 
    R2 = R2 lsr 1
	R3 = R3 lsr 3
	R1 = R1 ror 1    
	R3 = R3 rol 1
	DS = R2
    tstb R3, 0
    jne L_Odd?
L_Even?:
	R1 = D:[R1]
    retf
L_Odd?:
	R2 = D:[R1++]
	R1 = D:[R1]
	R1 = R1 lsl 4  
	R1 = R1 lsl 4
	R2 = R2 lsr 4 
	R2 = R2 lsr 4 
	R1 |= R2    
	retf;
	.endp

//*****************************************************************************
// Function    : F_A3400Pro_fptr_IoEvtStart
// Description : This function will be called by library when IO event start.
//               The state of IO pins can be set by user 
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************    
F_A34Pro_fptr_IoEvtStart:    .proc 
	push R1, BP to [sp];
	
	//
	// Set S/W PWM IO as output low
	//	
	R1 = 0;  
	DS = SEG T_IO_Event
	R2 = OFFSET T_IO_Event;  
?L_IOSettingLoop:   
	R3 = D:[R2++];
	R5 = D:[R2++];
	R4 = [R5 + C_PORT_BUF_IDX];
	clrb R4, R3;
	[R5 + C_PORT_BUF_IDX] = R4;   
	//R4 = [R5 + C_PORT_DIR_IDX];
	//setb R4, R3;
	//[R5 + C_PORT_DIR_IDX] = R4;  
	R1 += 1;
	cmp R1, C_IO_EVENT_NUM;
	jb ?L_IOSettingLoop 

	pop R1, BP from [sp];
	retf
	.endp

//*****************************************************************************
// Function    : F_USER_IoEvtEnd
// Description : This function will be called by library when IO event ends.
//               The state of IO pins can be set by user 
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************    
F_A34Pro_fptr_IoEvtEnd:    .proc 
	push R1, BP to [sp];
	
	//
	// Set S/W PWM IO as output low
	//	
	R1 = 0;  
	DS = SEG T_IO_Event
	R2 = OFFSET T_IO_Event;  
?L_IOSettingLoop:   
	R3 = D:[R2++];
	R5 = D:[R2++];
	R4 = [R5 + C_PORT_BUF_IDX];
	clrb R4, R3;
	[R5 + C_PORT_BUF_IDX] = R4;   
	//R4 = [R5 + C_PORT_DIR_IDX];
	//setb R4, R3;
	//[R5 + C_PORT_DIR_IDX] = R4;  
	R1 += 1;
	cmp R1, C_IO_EVENT_NUM;
	jb ?L_IOSettingLoop 

	pop R1, BP from [sp];
	retf
	.endp
	
//*****************************************************************************
// Function    : F_USER_EvtProcess
// Description : When a user event is decoded, F_USER_EvtProcess will be executed.
//               User can process the user event in this function.
// Destory     : 
// Parameter   : R1 = SubIndex(8-bits):MainIndex(8-bits) 
// Return      : None
// Note        : None
//*****************************************************************************
F_A34Rro_fptr_UserEvtProcess:    .proc  
	
	retf
	.endp	


//*****************************************************************************
// Function    : F_A34Rro_fptr_IOEvtProcess
// Description : When a IO event is decoded, F_USER_PWMDutyProcess will be executed.
//               User can process the PWM duty in this function.
// Destory     : 
// Parameter   : R1 = IO index
//               R2 = PWM Duty
// Return      : None
// Note        : None
//*****************************************************************************	
F_A34Rro_fptr_IOEvtProcess:		.proc 

	retf
	.endp

//*****************************************************************************
// Function    : F_SACM_A3400Pro_fptr_ServiceLoop
// Description : This function will fill R_SACM_Ring_Buffer with 
//               A3400Pro encoded data 
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : 
//*****************************************************************************
 _A34Pro_fptr_ServiceLoop:    .proc
F_A34Pro_fptr_ServiceLoop:    
    push R1, R5 to [SP];
    
    call F_SACM_A34Pro_fptr_Status;
    R2 = R1 & C_SACM_A3400Pro_fptr_PLAY;
    jz ?_USER_A3400Pro_CH1_ServiceLoop_End
    R2 = R1 & C_SACM_A3400Pro_fptr_AUTO;
    jz ?L_Fill_RingBuffer;  
    
?_USER_A3400Pro_CH1_ServiceLoop_End:
	pop R1, R5 from [SP]; 
	retf;      

?L_Fill_RingBuffer:    
    R1 = [R_RingBufferWrPtr];
    R2 = [R_RingBufferRdPtr];
    cmp R2, R1;
    je ?_USER_A3400Pro_CH1_ServiceLoop_End;
    cmp R2, R1;
    ja ?L_Fill_RingBuffer_1;
    jmp ?L_Fill_RingBuffer_2;
    
?L_Fill_RingBuffer_1:
    R2 = R2 - R1;
	R3 = [R_SPI_Addr_Low];	
	R4 = [R_SPI_Addr_High];		
	call F_AutoModeReadNWords;	
	
	R1 += R2;
    [R_RingBufferWrPtr] = R1;  

	R3 += R2 //lsl 1;
	R4 += 0, carry;
	[R_SPI_Addr_Low] = R3;
	[R_SPI_Addr_High] = R4; 	
	
	pop R1, R5 from [SP]; 
	retf;

?L_Fill_RingBuffer_2:		
    R2 += C_RING_BUFFER_LEN
    R2 -= R1;
    R5 = R2;
    R2 = R_SACM_Ring_Buffer + C_RING_BUFFER_LEN;    
    R2 -= R1;    
	R3 = [R_SPI_Addr_Low];
	R4 = [R_SPI_Addr_High];		
	call F_AutoModeReadNWords;	

    R1 = R_SACM_Ring_Buffer;    
	R3 += R2 //lsl 1;
	R4 += 0, carry;  
	[R_SPI_Addr_Low] = R3;
	[R_SPI_Addr_High] = R4;
		    
    push R5 to [SP];
    R5 -= R2;
    jz ?L_Update_RingBufferWrPtr;    
    R2 = R5;      
    call F_AutoModeReadNWords;	

	R3 += R2 //lsl 1;
	R4 += 0, carry;
	[R_SPI_Addr_Low] = R3;
	[R_SPI_Addr_High] = R4; 	

?L_Update_RingBufferWrPtr:
    pop R5 from [SP];	
    R1 = [R_RingBufferWrPtr];
	R1 += R5;
	R1 -= C_RING_BUFFER_LEN;
    [R_RingBufferWrPtr] = R1;   
  
    pop R1, R5 from [SP];
	retf;   
    .endp  

//*****************************************************************************
// Function    : F_InitRingBuffer
// Description : None
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : 2011.06.14 Allen
//*****************************************************************************
 _A34Pro_fptr_InitRingBuffer:    .proc
F_A34Pro_fptr_InitRingBuffer:    
   push R1 to [sp];

    //
    // Initialize R_RingBuffer2WrPtr and R_RingBuffer2RdPtr 
    //
    R1 = R_SACM_Ring_Buffer;  
    [R_RingBufferWrPtr] = R1;
    [R_RingBufferRdPtr] = R1;  

    //
    // Initial SACM Ring Buffer
    //
    R1 = R_SACM_Ring_Buffer
    R2 = C_RING_BUFFER_LEN;      
    R3 = [R_ExtMem_Low];	
    R4 = [R_ExtMem_High];		
    call F_AutoModeReadNWords;		  
    R3 += R2 //lsl 1;
    R4 += 0, carry;
    [R_SPI_Addr_Low] = R3;
    [R_SPI_Addr_High] = R4; 

    pop R1 from [sp];
    retf;
    .endp      
