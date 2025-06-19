//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc

//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public 	T_TempoIndexBegin
.public 	T_TempoIndexOffset
.public 	T_TempoIndexEnd

.public 	T_ADSRTimeBase
.public 	T_NoteOffTimeBase
.public 	T_TimeBaseFactor
.public 	T_C16MIDIEvnet

.public 	T_VolumeLevel
.public 	DefaultVolumeLevel
.public 	MinVolumeLevel

.public 	T_PitchBend
.public 	DefaultPBLevel
.public 	EndPBLevel

.public 	F_MIDI_Init_User
.public		F_MIDI_IntEnable
.public		F_MIDIStop
.public 	F_MIDI_NoteOnEvent
.public 	F_MIDI_UserEvent

//**************************************************************************
// External Function Declaration
//**************************************************************************
.external 	F_SPUPowerUpInitial
.external 	F_SACM_Delay


//**************************************************************************
// External Variable Declaration
//**************************************************************************
.external 	R_1024IntCnt
.external 	R_4KIntCnt

//**************************************************************************
// Contant Defintion Area
//**************************************************************************
.define 	D_ON			1
.define 	D_OFF 			0
//**************************************************************************
// User Defintion Area
//**************************************************************************
.define 	D_C16MIDIEvent 			D_ON			// Ch16 Note on event only treats as user events
.define 	MIDI_IOEvt             	D_ON            //;Declare IO Event in a MIDI


//==========================================================================
//Tempo change table
//==========================================================================
.define		D_TempoIndexBegin		5              //20~10: tempo up
.define		D_TempoIndexOffset		14              //Defaule tempo
.define		D_TempoIndexEnd			50             //20~30: tempo down
//==========================================================================
//Envelope timebase can be adjusted according to the user settings in G+Midiar
//==========================================================================
.define		D_ADSRTimeBase			4	          //;Must equal to the setting in G+ Midiar (Unit:ms)
.define		D_NoteOffTimeBase		4  	      //;Must equal to the setting in G+ Midiar (Unit:ms)
.define		D_TimeBaseFactor		1		      //;(CPU_Clock*256)/1000/4096


//*****************************************************************************
// Table Definition Area
//*****************************************************************************
.TEXT
T_TempoIndexBegin:
	.dw	D_TempoIndexBegin
T_TempoIndexOffset:
	.dw D_TempoIndexOffset
T_TempoIndexEnd:
	.dw D_TempoIndexEnd
	
T_ADSRTimeBase:
	.dw	D_ADSRTimeBase
T_NoteOffTimeBase:
	.dw D_NoteOffTimeBase
T_TimeBaseFactor:
	.dw D_TimeBaseFactor	
T_C16MIDIEvnet:
	.dw D_C16MIDIEvent		

	//.IF CTRL_MIDI_CH_VOL = ON
DefaultVolumeLevel:
.dw T_DefaultVolumeLevel - T_VolumeLevel

MinVolumeLevel:
.dw T_MinVolumeLevel - T_VolumeLevel	
	
T_VolumeLevel:
    .DW     0x0300           //3.0
    .DW     0x02E6           //2.9
    .DW     0x02CD           //2.8
    .DW     0x02B3           //2.7
    .DW     0x029A           //2.6
    .DW     0x0280           //2.5
    .DW     0x0266           //2.4
    .DW     0x024D           //2.3
    .DW     0x0233           //2.2
    .DW     0x021A           //2.1
    .DW     0x0200           //2.0
    .DW     0x01E6           //1.9
    .DW     0x01CD           //1.8
    .DW     0x01B3           //1.7
    .DW     0x019A           //1.6
    .DW     0x0180           //1.5
    .DW     0x0166           //1.4
    .DW     0x014D           //1.3
    .DW     0x0133           //1.2
    .DW     0x011A           //1.1
//.define 	D_DefaultVolumeLevel   $-T_VolumeLevel
T_DefaultVolumeLevel:
    .DW     0x0100           //1.0
    .DW     0x00E6           //0.9
    .DW     0x00CD           //0.8
    .DW     0x00B3           //0.7
    .DW     0x009A           //0.6
    .DW     0x0080           //0.5
    .DW     0x0066           //0.4
    .DW     0x004D           //0.3
    .DW     0x0033           //0.2
    .DW     0x001A           //0.1
    .DW     0x0000           //0.0
//.define 	D_MinVolumeLevel       $-T_VolumeLevel
T_MinVolumeLevel:
	//.ENDIF
	
	//.IF PITCH_BEND = ON
DefaultPBLevel:
.dw T_DefaultPBLevel - T_PitchBend

EndPBLevel:
.dw T_EndPBLevel - T_PitchBend

T_PitchBend:
.dw 0x011F;		//011FH	//0X3F      ;1.11(up 2 semitone)
.dw 0x011E;		//011EH	//0X3E
.dw 0x011D;		//011DH	//0X3D
.dw 0x011C;		//011CH	//0X3C
.dw 0x011B;		//011BH	//0X3B
.dw 0x011A;		//011AH	//0X3A
.dw 0x0119;		//0119H	//0X39
.dw 0x0118;		//0118H	//0X38
.dw 0x0117;		//0117H	//0X37
.dw 0x0116;		//0116H	//0X36
.dw 0x0115;		//0115H	//0X35
.dw 0x0114;		//0114H	//0X34
.dw 0x0113;		//0113H	//0X33
.dw 0x0112;		//0112H	//0X32
.dw 0x0111;		//0111H	//0X31
.dw 0x0110;		//0110H	//0X30      ;1.06(up 1 semitone)
.dw 0x010F;		//010FH	//0X2F
.dw 0x010E;		//010EH	//0X2E
.dw 0x010D;		//010DH	//0X2D
.dw 0x010C;		//010CH	//0X2C
.dw 0x010B;		//010BH	//0X2B
.dw 0x010A;		//010AH	//0X2A
.dw 0x0109;		//0109H	//0X29
.dw 0x0108;		//0108H	//0X28
.dw 0x0107;		//0107H	//0X27
.dw 0x0106;		//0106H	//0X26
.dw 0x0105;		//0105H	//0X25
.dw 0x0104;		//0104H	//0X24
.dw 0x0103;		//0103H	//0X23
.dw 0x0102;		//0102H	//0X22
.dw 0x0101;		//0101H	//0X21

T_DefaultPBLevel:
.dw 0x0100;		//0100H	//0X20      ; Base Pitch
.dw 0x00FF;		//00FFH	//0X1F
.dw 0x00FE;		//00FEH	//0X1E
.dw 0x00FD;		//00FDH	//0X1D
.dw 0x00FC;		//00FCH	//0X1C
.dw 0x00FB;		//00FBH	//0X1B
.dw 0x00FA;		//00FAH	//0X1A
.dw 0x00F9;		//00F9H	//0X19
.dw 0x00F8;		//00F8H	//0X18
.dw 0x00F7;		//00F7H	//0X17
.dw 0x00F6;		//00F6H	//0X16
.dw 0x00F5;		//00F5H	//0X15
.dw 0x00F4;		//00F4H	//0X14
.dw 0x00F3;		//00F3H	//0X13
.dw 0x00F2;		//00F2H	//0X12
.dw 0x00F1;		//00F1H	//0X11
.dw 0x00F0;		//00F0H	//0X10      ;0.94 (down 1 semitone)
.dw 0x00EF;		//00EFH	//0X0F
.dw 0x00EE;		//00EEH	//0X0E
.dw 0x00ED;		//00EDH	//0X0D
.dw 0x00EC;		//00ECH	//0X0C
.dw 0x00EB;		//00EBH	//0X0B
.dw 0x00EA;		//00EAH	//0X0A
.dw 0x00E9;		//00E9H	//0X09
.dw 0x00E8;		//00E8H	//0X08
.dw 0x00E7;		//00E7H	//0X07
.dw 0x00E6;		//00E6H	//0X06
.dw 0x00E5;		//00E5H	//0X05
.dw 0x00E4;		//00E4H	//0X04      ;0.89 (down 2 semitone)
//.dw 0x00E3;		//00E3H	//0X03
//.dw 0x00E2;		//00E2H	//0X02
//.dw 0x00E1;		//00E1H	//0X01
//.dw 0x00E0;		//00E0H	//0X00
T_EndPBLevel:	
	//.ENDIF
//**************************************************************************
// CODE Definition Area
//**************************************************************************
.CODE
F_MIDI_Init_User: .proc
	push R1 to [SP]

	call F_SPUPowerUpInitial
	
	//R1 = C_SPU_Mixer_FullSwing + C_SPU_Mixer_MaxVolume
	R1 = 0x7FFF
	[P_SPU_Volume_Ctrl] = R1
	
	R1 = 0xFFFF
	[P_SPU_Mixer_Ctrl] = R1

//	R1 = [P_INT2_Ctrl]					//;Enable IRQ6 4096Hz
//    R1 |= C_IRQ6_4096Hz
//    [P_INT2_Ctrl] = R1    

//	R1 = C_Timer_Setting_16K;			//MIDI requires 4kHz interrupts for processing, and D_TimerDiv4k of MIDI.asm needs to be set. default: D_TimerDiv4k = 16k/4k = 4
//	[P_TimerB_Data] = R1;
//
//	R1 = [P_Timer_Ctrl]
//	R1 |= C_TimerB_SYSCLK;				
//	[P_Timer_Ctrl] = R1;
//	[P_TimerB_CNTR] = R1;
//	
//	R1 = [P_INT_Ctrl];
//	R1 |= C_IRQ1_TMB;
//	[P_INT_Ctrl] = R1;	

	R1 = 0;
	[R_4KIntCnt] = R1;
	
	R1 = 4
	[R_1024IntCnt] = R1	
			
//	R1 = C_PWM_sData;
//	[P_AUDIO_Ctrl3] = R1;	
//	
//	R1 = C_AUDIO_PWMIP_Enable | C_AUDIO_PWM_Enable | C_AUDIO_Gain_Sel | C_MuteControl_DATACHAGE;
//	[P_AUDIO_Ctrl1] = R1;	

	pop R1 from [SP]
	retf
	.endp


F_MIDI_IntEnable:	.proc
	FIQ OFF
	
	
	
	FIQ ON
	retf;
	.endp


F_MIDIStop:	.proc


	retf;
	.endp
	
//****************************************************************
// Function    : F_SACM_MS02_NoteOnEvent
// Description : Call back function for Note on events
// Destory     : None
// Parameter   : R1: MIDI Channel
//				 R2: Pitch + KeyShift
//               R3: Velocity * Volume
//
// Return      : None
// Note        : None
//****************************************************************	
F_MIDI_NoteOnEvent:	.proc

	retf;
	.endp		
	
	
F_MIDI_UserEvent: .proc
	
	.IF MIDI_IOEvt == D_ON
	//
	.ELSE
	R1 = [R_MIDIStatus]
	R1 |= D_UserEvent
	[R_MIDIStatus] = R1
	.ENDIF
	
	retf;
	.endp	