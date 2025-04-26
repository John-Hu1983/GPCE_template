//==========================================================================
// File Name   : ISR.asm
// Description : Interrupt Service Routine
// Written by  : Jerry Hsu
// Last modified date:
//              2023/12/20
// Note: 
// 1. Interrupts must be declared in address 0x8000~0xffff.
// 2. For FIQ, IRQ1 ~ IRQ7, user needs to clear P_INT_Clear before 
//    exiting interrupt routine
// 3. 
// 	_FIQ:	FIQ								// Fast interrupt entry
//  _IRQ0:	TimerA							// interrupt entry
//  _IRQ1:	TimerB							// interrupt entry
//  _IRQ2:	TimerC							// interrupt entry
//  _IRQ3:	DMA1, DMA2, ADC, SPI, SPI2		// interrupt entry
//  _IRQ4:	KEY								// interrupt entry
//  _IRQ5:	SPU, EXT1, EXT2					// interrupt entry
//  _IRQ6:	CTS, 512Hz, 2KHz, 4KHz			// interrupt entry     
//  _IRQ7:	UART, 2Hz, 16Hz, 64Hz			// interrupt entry
//  _Break: Software interrupt              // interrupt entry
//==========================================================================

//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc
.include A34Pro_fptr.inc

.external F_VolCompressProcess
.external F_ISR_Service_SACM_A1800_fptr
.external F_A1800_fptr_ISR_Event_Service
.external F_ISR_Service_SACM_Mixer

.external 	_callback_2048hz_service
.external   _isr_cts_tma
.external   _cb_ext_irq5
.external   _cb_uart_irq7

//**************************************************************************
// Contant Defintion Area
//**************************************************************************


//**************************************************************************
// Variable Publication Area
//**************************************************************************

//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public _BREAK;

.public _FIQ;

.public _IRQ0;

.public _IRQ1;

.public _IRQ2;

.public _IRQ3;

.public _IRQ4;

.public _IRQ5;

.public _IRQ6;

.public _IRQ7;


//**************************************************************************
// External Variable Declaration
//**************************************************************************


//**************************************************************************
// External Function Declaration
//**************************************************************************

//**************************************************************************
// RAM Definition Area
//**************************************************************************
.RAM


//**************************************************************************
// CODE Definition Area
//**************************************************************************
.TEXT

_BREAK:
	push R1, R5 to [SP]
	
	
	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _FIQ
//****************************************************************
_FIQ:
	push R1, R5 to [SP]
	R1 = [P_INT_Status];
	test R1, C_IRQ0_TMA;
	jnz L_FIQ_TimerA;	
	test R1, C_IRQ1_TMB;
	jnz L_FIQ_TimerB;
	
L_FIQ_TimerA:
    //------------------------------------------------------------------
    // hook Timer A FIQ subroutine here and define it to be external
    // and returns as a flag to tell required process data or not   

    call F_ISR_Service_SACM_A1800_fptr

		R2 = C_IRQ0_TMA;
		[P_INT_Status] = R2;
		
		pop R1, R5 from [SP]
		reti;
	
L_FIQ_TimerB:
    //------------------------------------------------------------------
    // hook Timer B FIQ subroutine here and define it to be external
    //------------------------------------------------------------------
    call F_ISR_Service_SACM_Mixer
    
    R1 = C_IRQ1_TMB;
    [P_INT_Status] = R1;
    pop R1, R5 from [sp];
    reti;

L_FIQ_TimerC:
    //------------------------------------------------------------------
    // hook Timer C FIQ subroutine here and define it to be external
    //------------------------------------------------------------------
    R1 = C_IRQ2_TMC;
    [P_INT_Status] = R1;
    pop R1, R5 from [sp];
    reti;	
	
//****************************************************************
// _IRQ0
//****************************************************************
_IRQ0:
	push R1, R5 to [SP]
	
	
	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _IRQ1
//****************************************************************
_IRQ1:
	push R1, R5 to [SP]
	

	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _IRQ2
//****************************************************************
_IRQ2:
	push R1, R5 to [SP]

	call F_A1800_fptr_ISR_Event_Service
	call F_A34Pro_fptr_ISR_Evt_Ser
	
	R1 = C_IRQ2_TMC;
    [P_INT_Status] = R1;
	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _IRQ3
//****************************************************************
_IRQ3:
	push R1, R5 to [SP]

		
	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _IRQ4
//****************************************************************
_IRQ4:
	push R1, R5 to [SP]
	
	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _IRQ5
//****************************************************************
_IRQ5:
	push R1, R5 to [SP]
	
	call _cb_ext_irq5

	pop R1, R5 from [SP]
	reti;

//****************************************************************
// _IRQ6
//****************************************************************
_IRQ6:
	push R1, R5 to [SP]
	
	R1 = [P_INT2_Status];
	test R1, C_IRQ6_2048Hz;
	jnz ?L_IRQ6_2048Hz;
	test R1, C_IRQ6_CTSTMA;
	jnz L_IRQ_CTSTMA;	
	test R1, C_IRQ6_CTSTMB;
	jnz L_IRQ_CTSTMB;

	pop R1, R5 from [SP];
	reti;   

?L_IRQ6_2048Hz:
	call _callback_2048hz_service;
	R1 = C_IRQ6_2048Hz;
	[P_INT2_Status] = R1;	
	pop R1, R5 from [SP]
	reti;

L_IRQ_CTSTMA:
	call _isr_cts_tma;  
	R1 = C_IRQ6_CTSTMA;
	[P_INT2_Status] = R1;   
	pop R1, R5 from [SP];
	reti;

L_IRQ_CTSTMB:    
	nop;
	nop;
	R1 = C_IRQ6_CTSTMB;
	[P_INT2_Status] = R1;    
	pop R1, R5 from [SP];
	reti;  

//****************************************************************
// _IRQ7
//****************************************************************
_IRQ7:
	push R1, R5 to [SP]
	
	call _cb_uart_irq7
	
	pop R1, R5 from [SP]
	reti;


//========================================================================================        
// End of isr.asm
//========================================================================================
