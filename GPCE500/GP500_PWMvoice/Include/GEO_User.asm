//==========================================================================
// File Name   : SACM_A1800_USER.asm
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


//**************************************************************************
// Table Publication Area
//**************************************************************************
.public D_GEO_IO_EVENT_NUM 
.public D_GEO_SW_PWM_LEVEL
.public T_GEO_IO_Event


//***************************************************************************************
// User Definition Section for IO Event
//***************************************************************************************
.define C_IO_EVENT_NUM    4                      // IO number for IO_Event 
.define C_SW_PWM_FREQ     60                     // PWM frequency (Unit: Hz)
.define C_SW_PWM_LEVEL    128                    // PWM level selection (32/64/128/256)
.define C_PWM_FREQ        65536 - (SystemClock / (C_SW_PWM_FREQ * C_SW_PWM_LEVEL))      // for PWM Service Timer Setting

.CODE
//
// IO Event Definition
// - Mapped to the number of Edit Event on G+ Eventor
//
T_GEO_IO_Event:
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
.define C_SpeechNumberLength		    4    // for skip song number
.define Drive_mode    					0                      
.define Sink_mode     					1
//
// IO Event Pin Definition Section
// - Based on IC I/O Configuration         
// - example ".define C_IOA3            0x20000003"
//   1st word:0x2000 = I/O Configuration Register Base
//   2st word:0x0003 = I/O Pin Number
//

.define C_SW_PWM_EN_FLAG  15          // R_GEO_DutyArray bit15: 1 => S/W PWM: Disalbe, 0 => S/W PWM: Enable

//**************************************************************************
// Variable Publication Area
//**************************************************************************
.public R_GEO_DutyArray 


//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public F_USER_GEO_Init_

.public  _USER_GEO_SetStartAddr
.public F_USER_GEO_SetStartAddr

.public F_USER_GEO_GetExtGeoStartAddr

.public F_USER_GEO_GetData

.public F_USER_GEO_IoEvtStart

.public F_USER_GEO_IoEvtEnd

.public F_USER_GEO_IOEvtProcess

.public F_USER_GEO_UserEvtProcess

.public F_USER_GEO_MuteProcess


//**************************************************************************
// External Function Declaration
//**************************************************************************
.external F_AutoModeReadNWords
.external F_AutoModeReadAWords



//**************************************************************************
// External Table Declaration
//**************************************************************************
.external T_GEO_Table

//**************************************************************************
// RAM Definition Area
//**************************************************************************
.RAM
.var R_ExtMem_Low
.var R_ExtMem_High

R_GEO_DutyArray:    .dw    C_IO_EVENT_NUM    dup(?)  


//*****************************************************************************
// Table Definition Area
//*****************************************************************************
.CODE
D_GEO_IO_EVENT_NUM:
.DW C_IO_EVENT_NUM

D_GEO_SW_PWM_LEVEL:
.DW C_SW_PWM_LEVEL


//**************************************************************************
// CODE Definition Area
//**************************************************************************
.CODE
//*****************************************************************************
// Function    : F_Event_Init_
// Description : None
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : None
//***************************************************************************** 
F_USER_GEO_Init_:    .proc
	push R1, BP to [sp];

    cmp R1, Drive_mode
    jne ?L_Sink_mode
	// If drive mode
	// Initialize S/W PWM IO as output low
	// 	
?L_Drive_mode:	
	R1 = 0;  
	R2 = SEG16 T_GEO_IO_Event
	DS = R2
	R2 = OFFSET T_GEO_IO_Event; 	
?L_IOSettingLoop_Drive:   
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
	jb ?L_IOSettingLoop_Drive 
	jmp ?L_IniIRQ
	
	
?L_Sink_mode:	
	// If sink mode
	// Initialize S/W PWM IO as output high
	// 
	R1 = 0;  
	R2 = SEG16 T_GEO_IO_Event
	DS = R2
	R2 = OFFSET T_GEO_IO_Event; 	
?L_IOSettingLoop_Sink:   
	R3 = D:[R2++];
	R5 = D:[R2++];  
	R4 = [R5 + C_PORT_DIR_IDX];
	setb R4, R3;
	[R5 + C_PORT_DIR_IDX] = R4; 
	R4 = [R5 + C_PORT_ATT_IDX];
	setb R4, R3;     
	[R5 + C_PORT_ATT_IDX] = R4;   
	R4 = [R5 + C_PORT_BUF_IDX];
	setb R4, R3;
	[R5 + C_PORT_BUF_IDX] = R4;  	
	R1 += 1;
	cmp R1, C_IO_EVENT_NUM;
	jb ?L_IOSettingLoop_Sink 
	
	
?L_IniIRQ:	
	//
	// Initialize IRQ2_TimerC interrupt & IRQ6_2048Hz interrupt
	//
	R1 = [P_Timer_Ctrl];
	R1 |= C_TimerC_SYSCLK;
	[P_Timer_Ctrl] = R1;
	R1 = C_PWM_FREQ;
	[P_TimerC_Data] = R1;
	[P_TimerC_CNTR] = R1;  
	R1 = [P_INT_Ctrl];
	R1 |= C_IRQ2_TMC// | C_IRQ6_2048Hz;
	[P_INT_Ctrl] = R1;  
	R1 = [P_INT2_Ctrl];
	R1 |= C_IRQ6_2048Hz;
	[P_INT2_Ctrl] = R1; 
	IRQ ON;  

?L_Event_Init_End:
	pop R1, BP from [sp];
	retf
	.endp

//*****************************************************************************
// Function    : F_USER_GEO_SetStartAddr
// Description : This API allows users to set the beginning address
//               to fetch data. This address can be either a ROM address
//               or a external storage address. User would have to modify
//               the function body based on the application's need.
// Destory     : None
// Parameter   : R1: Song Index
// Return      : None
// Note        : None
//*****************************************************************************
_USER_GEO_SetStartAddr:	.proc
	R1 = SP + 3;
	R1 = [R1];

F_USER_GEO_SetStartAddr:
	R1 += R1
	R2 = SEG16 T_GEO_Table
	R3 = OFFSET T_GEO_Table
	R3 += R1
	R2 += 0, CARRY
	DS = R2
	R4 = D:[R3++]
	[R_ExtMem_Low] = R4
	R4 = D:[R3]
	[R_ExtMem_High] = R4
	
	R3 = [R_ExtMem_Low]
	R4 = [R_ExtMem_High]
	R3 += R3
	R4 += R4, CARRY //word mode to byte mode
	[R_ExtMem_Low] = R3
	[R_ExtMem_High] = R4
	
	retf;
	.endp

//*****************************************************************************
// Function    : F_GetExtSpeechStartAddr
// Description : In the manual mode, library call this function to get 
//               external speech start address.
// Destory     : None
// Parameter   :
// Return      : R1 = Low ward of sound data addr  
//               R2 = High ward of sound data addr 
// Note        : None
//*****************************************************************************
F_USER_GEO_GetExtGeoStartAddr:	.proc	
	R1 = [R_ExtMem_Low];	
	R2 = [R_ExtMem_High];
	retf;
	.endp

//*****************************************************************************
// Function    : F_USER_GEO_GetData
// Description : In the manual mode, library call this function to get 
//               external event data. 
// Destory     : None
// Parameter   : R1 = Low ward of the event data addr  
//               R2 = High ward of the event data addr
// Return      : R1 = Event Data
// Note        : None
//*****************************************************************************
F_USER_GEO_GetData:    .proc
	R2 = R2 lsr 1
	push R3 to [SP]
	R3 = R3 lsr 3
	pop R3 from [SP]
	R1 = R1 ror 1
	call F_AutoModeReadAWords
	retf;	
	.endp

//*****************************************************************************
// Function    : F_USER_GEO_IoEvtStart
// Description : This function will be called by library when IO event start.
//               The state of IO pins can be set by user 
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************    
F_USER_GEO_IoEvtStart:    .proc 
	push R1, BP to [sp];
	
	cmp R1, Drive_mode
    jne ?L_Sink_mode
	// If Drive mode
	// Set S/W PWM IO as output low
	//	
?L_Drive_mode:	
	R1 = 0;  
	R2 = SEG16 T_GEO_IO_Event
	DS = R2
	R2 = OFFSET T_GEO_IO_Event;  
?L_IOSettingLoop_Drive:   
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
	jb ?L_IOSettingLoop_Drive 
	jmp ?L_SettingDone
	
	// If Sink mode
	// Set S/W PWM IO as output high
	//
?L_Sink_mode:	
	R1 = 0;  
	R2 = SEG16 T_GEO_IO_Event
	DS = R2
	R2 = OFFSET T_GEO_IO_Event;  
?L_IOSettingLoop_Sink:   
	R3 = D:[R2++];
	R5 = D:[R2++];
	R4 = [R5 + C_PORT_BUF_IDX];
	setb R4, R3;
	[R5 + C_PORT_BUF_IDX] = R4;   
	//R4 = [R5 + C_PORT_DIR_IDX];
	//setb R4, R3;
	//[R5 + C_PORT_DIR_IDX] = R4;  
	R1 += 1;
	cmp R1, C_IO_EVENT_NUM;
	jb ?L_IOSettingLoop_Sink 	

?L_SettingDone:
	pop R1, BP from [sp];
	retf
	.endp

//*****************************************************************************
// Function    : F_USER_GEO_IoEvtEnd
// Description : This function will be called by library when IO event ends.
//               The state of IO pins can be set by user 
// Destory     : 
// Parameter   : None
// Return      : None
// Note        : None
//*****************************************************************************    
F_USER_GEO_IoEvtEnd:    .proc 
	push R1, BP to [sp];
	
	cmp R1, Drive_mode
    jne ?L_Sink_mode
	// If Drive mode
	// Set S/W PWM IO as output low
	//	
?L_Drive_mode:	
	R1 = 0;  
	R2 = SEG16 T_GEO_IO_Event
	DS = R2
	R2 = OFFSET T_GEO_IO_Event;  
?L_IOSettingLoop_Drive:   
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
	jb ?L_IOSettingLoop_Drive 
	jmp ?L_SettingDone
	
	// If Sink mode
	// Set S/W PWM IO as output high
	//
?L_Sink_mode:	
	R1 = 0;  
	R2 = SEG16 T_GEO_IO_Event
	DS = R2
	R2 = OFFSET T_GEO_IO_Event;  
?L_IOSettingLoop_Sink:   
	R3 = D:[R2++];
	R5 = D:[R2++];
	R4 = [R5 + C_PORT_BUF_IDX];
	setb R4, R3;
	[R5 + C_PORT_BUF_IDX] = R4;   
	//R4 = [R5 + C_PORT_DIR_IDX];
	//setb R4, R3;
	//[R5 + C_PORT_DIR_IDX] = R4;  
	R1 += 1;
	cmp R1, C_IO_EVENT_NUM;
	jb ?L_IOSettingLoop_Sink 	

?L_SettingDone:
	pop R1, BP from [sp];
	retf
	.endp
	
//*****************************************************************************
// Function    : F_USER_GEO_IOEvtProcess
// Description : When a IO event is decoded, F_USER_GEO_IOEvtProcess will be executed.
//               User can process the IO event in this function.
// Destory     : 
// Parameter   : R1 = IO index, R2 = Duty
// Return      : None
// Note        : None
//*****************************************************************************	
F_USER_GEO_IOEvtProcess:	.proc

	retf
	.endp	
	
//*****************************************************************************
// Function    : F_USER_GEO_UserEvtProcess
// Description : When a user event is decoded, F_USER_GEO_UserEvtProcess will be executed.
//               User can process the user event in this function.
// Destory     : 
// Parameter   : R1 = SubIndex(8-bits):MainIndex(8-bits) 
// Return      : None
// Note        : None
//*****************************************************************************
F_USER_GEO_UserEvtProcess:    .proc  
	
	retf
	.endp
	
//*****************************************************************************
// Function    : F_USER_GEO_MuteProcess
// Description : When a mute function is called, F_USER_GEO_MuteProcess will be executed.
//               User can process the IO status in this function.
// Destory     : 
// Parameter   : R_GEO_Temp = Channel number
// Return      : None
// Note        : None
//*****************************************************************************
F_USER_GEO_MuteProcess:    .proc  
  push R1, BP to [sp];
  R1 = C_IO_EVENT_NUM
  //R1 = [D_GEO_IO_EVENT_NUM];
  jz ?L_IO_Event_End; 
  //
  // Disable S/W PWM
  //
  R1 = 0;  
?L_EvtEndSettingLoop:   
  R2 = R_GEO_DutyArray;
  R2 += R1;
  setb [R2], C_SW_PWM_EN_FLAG;  
   
  R1 += 1;
  cmp R1, [D_GEO_IO_EVENT_NUM];
  jb ?L_EvtEndSettingLoop 
  
  call F_USER_GEO_IoEvtEnd;     
?L_IO_Event_End:
  pop R1, BP from [sp];
  retf
	.endp	