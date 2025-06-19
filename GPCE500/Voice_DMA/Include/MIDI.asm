//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc


//**************************************************************************
// External Table Declaration
//**************************************************************************
.external 	T_MIDI_Table

.external 	T_TempoIndexBegin
.external 	T_TempoIndexOffset
.external 	T_TempoIndexEnd

.external 	T_ADSRTimeBase
.external 	T_NoteOffTimeBase
.external 	T_TimeBaseFactor
.external   T_C16MIDIEvnet

.external 	T_VolumeLevel
.external 	DefaultVolumeLevel
.external 	MinVolumeLevel

.external 	T_PitchBend
.external 	DefaultPBLevel
.external 	EndPBLevel

.external	R_ChSpeechStatus
.external	T_ChMap
.external	T_ChEnableLB
.external	T_ChEnableHB
.external	T_ChDisableLB
.external	T_ChDisableHB

// Defined in instrument library
.external 	T_Instruments
.external 	T_DrumInst
.external 	T_SampleRate
.external 	T_SampleRateBase
.external 	D_PhaseIndexOffset

//**************************************************************************
// External Function Declaration
//**************************************************************************
.external 	F_MIDI_Init_User
.external	F_MIDI_IntEnable
.external	F_MIDIStop
.external 	F_MIDI_NoteOnEvent
.external 	F_MIDI_UserEvent
//**************************************************************************
// Contant Defintion Area
//**************************************************************************
.define		D_ChannelNo		8
.define 	D_ON			1
.define 	D_OFF 			0
.define 	MIDI_EVENT            	D_ON            //;Declare MIDI Event function
.define 	MUTE_MIDI_CH          	D_ON             //;Declare Mute Channel Volume function
.define 	MIDI_KEY_SHIFT         	D_ON            //;Declare MIDI Key Shift function
.define 	CTRL_MIDI_CH_VOL       	D_ON            //;Declare Control Channel Volume function
.define 	PITCH_BEND             	D_ON            //;Declare Pitch Bend function
.define 	REPEAT_MIDI            	D_ON            //;Declare Repeat MIDI function
.define 	OneKeyOneNote			D_ON			   //;Declare OneKeyOneNote function
.define 	OKON_LongDuration		D_ON			   //;Declare Duration length when play OneKeyOneNote

.define		D_TimerDiv4k	4						//Timer frequency divided by 4k, if Timer = 16k, D_TimerDiv4k = 4
//R_ChSpeechStatus:       .dw     D_ChannelNo 	DUP(?)     //For each SPU channel
.define		D_SpeechPlaying 	0x0008
.define		D_SpeechRepeat      0x0004	
.define		D_SpeechPause   	0x0002	
.define		D_SpeechZCJump  	0x0001 
//**************************************************************************
// Variable Publication Area
//**************************************************************************
.Public 	R_1024IntCnt
.Public 	R_4KIntCnt

//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.Public 	_MIDI_Play
.Public 	F_MIDI_Play
.Public 	_StopMusic
.Public 	F_StopMusic
.Public 	_SetUpTimeBase
.Public 	F_SetUpTimeBase
.Public 	_MIDIPowerUpInitial
.Public 	F_MIDIPowerUpInitial
.Public 	_MIDIWakeUpInitial
.Public 	F_MIDIWakeUpInitial 
.Public 	_MIDI_DataCounter
.Public 	F_MIDI_DataCounter
.Public 	_CheckMidiDuration
.Public 	F_CheckMidiDuration
.Public 	_ServiceMIDI
.Public 	F_ServiceMIDI
.Public 	 _CheckADSR
.Public 	F_CheckADSR
.Public 	_SpuIrqMIDIService
.Public 	F_SpuIrqMIDIService
.Public 	_PauseMIDI
.Public 	F_PauseMIDI
.Public 	_ResumeMIDI
.Public 	F_ResumeMIDI
.Public 	 _GetTempo
.Public 	F_GetTempo
.Public 	 _SetTempo
.Public 	F_SetTempo
.Public 	_SetTempoUp
.Public 	F_SetTempoUp
.Public 	_SetTempoDn
.Public 	F_SetTempoDn
.Public 	_MIDIOff
.Public 	F_MIDIOff
.Public 	_MIDIOn
.Public 	F_MIDIOn
.Public 	_RepeatMIDIOn
.Public 	F_RepeatMIDIOn
.Public 	_RepeatMIDIOff
.Public 	F_RepeatMIDIOff
.Public 	_MuteMIDICh
.Public 	F_MuteMIDICh
.Public 	_UnMuteMIDICh
.Public 	F_UnMuteMIDICh
.Public 	_KeyShiftUp
.Public 	F_KeyShiftUp
.Public 	_KeyShiftDn
.Public 	F_KeyShiftDn
.Public 	_ChangeInst
.Public 	F_ChangeInst
.Public 	_EnMIDIChVolCtrl
.Public 	F_EnMIDIChVolCtrl
.Public 	_DisMIDIChVolCtrl
.Public 	F_DisMIDIChVolCtrl
.Public 	F_EnAllMIDIChVolCtrl
.Public 	_EnAllMIDIChVolCtrl
.Public 	_DisAllMIDIChVolCtrl
.Public 	F_DisAllMIDIChVolCtrl
.Public 	_SetMIDIChVolUp
.Public 	F_SetMIDIChVolUp
.Public 	_SetMIDIChVolDn
.Public 	F_SetMIDIChVolDn
.Public 	_SetPitchBendUp
.Public 	F_SetPitchBendUp
.Public 	_SetPitchBendDn
.Public 	F_SetPitchBendDn
.Public 	_TonePitchBend
.Public 	F_TonePitchBend
.Public 	_PlaySingleNote
.Public 	F_PlaySingleNote
.Public 	_PlaySingleDrum
.Public 	F_PlaySingleDrum
.Public 	_SingleNoteOff
.Public 	F_SingleNoteOff
.Public 	_PlayOneKeyOneNote
.Public 	F_PlayOneKeyOneNote
.Public 	_OneKeyOneNoteON
.Public 	F_OneKeyOneNoteON
.Public 	_OneKeyOneNoteOFF
.Public 	F_OneKeyOneNoteOFF
.Public 	_OneKeyOneNoteRelease
.Public 	F_OneKeyOneNoteRelease

.Public 	_SetMIDIChVolIdx
.public 	F_SetMIDIChVolIdx
.Public 	_MIDIStatus
.Public 	F_MIDIStatus
//**************************************************************************
// RAM Definition Area
//**************************************************************************
.IRAM
//==========================================================================
.var	R_MIDIStatus
.define 	D_MIDIEn			0x0080	//MIDI is enabled
.define 	D_DeltaTime			0x0040	//Bit6 = 1, not Delta-time data
.define 	D_MusicOff			0x0020	//Music off
.define 	D_PlaySingleNote	0x0010	//Unused
.define 	D_DynaAllocOff		0x0008	//D_DynaAllocOff = 1, dynamic allocation Off, otherwise dynamic allocation on
.define 	D_NewestNoteOut		0x0004	//D_NewestNoteOut = 1, Newest note out; D_NewestNoteOut = 0, check D_MinVolNoteOut
.define 	D_MinVolNoteOut		0x0002	//D_MinVolNoteOut = 1, minimum volume note out; D_MinVolNoteOut = 0, oldest note out
.define 	D_UserEvent			0x0001	//Indicate a user event is detected
//==========================================================================
.var	R_MIDICtrl
.define 	D_PauseMIDI         0x0001  //Used to pause a MIDI
.define 	D_MIDIEvent         0x0002  //Indicate a MIDI event is detected
.define 	D_DataHLByte        0x0004  //Indicate the memory type of MIDI file

GPCE5_MIDISquencer_RAM:		.section	.ORAM

R_InstAddr_BS: 		.dw 	2 	DUP(?)	
.define 	R_InstAddr_DS 	R_InstAddr_BS + 1

R_MIDIDPTR_BS: 		.dw 	2 	DUP(?)	
.define 	R_MIDIDPTR_DS 	R_MIDIDPTR_BS + 1

//==========================================================================
//Channel Status definition
//==========================================================================
R_ChStatus: 	.dw 	D_ChannelNo 	DUP(?)
.define 	D_NotePlaying			0x0080  //Indicate a note is played
.define 	D_NoteOffFlag			0x0040  //Indicate a note is released
.define 	D_AdpcmJumpPcm			0x0020  //Indicate a note is ADPCM+PCM
.define 	D_DrumPlaying			0x0010  //Indicate a drum note is played
.define 	D_TargetIsLastDrop		0x0008  //Indicate the current target is the last drop in the envelope table
.define 	D_ReachLastDrop			0x0004  //Indicate the envelope is reach the last drop
.define 	D_SkipIniNoteOffEnv		0x0002  //Indicate the envelope of note off is initialized
.define 	D_ZCJump				0x0001  //Indicate a note is set as Zero Corssing
//==========================================================================
.var	R_SingleNote		//Used for playing single note
.var	R_SingleDrum		//Used for playing single drum
.var	R_ADSRTimeBase		//R_ADSRTimeBase = [D_TimeBaseFactorH]:[D_TimeBaseFactorL]*ADSR_TimeBase
.var	R_NoteOffTimeBase	//R_NoteOffTimeBase = [D_TimeBaseFactorH]:[D_TimeBaseFactorL]*NoteOff_TimeBase
.var	R_MIDIData			//MIDI data
.var	R_1024IntCnt		//Flag for checking 1024 IRQ
.var	R_4KIntCnt			//Flag for checking 4000 IRQ
.var	R_DeltaTime			//Delta time counter
.var	R_DTCounter			//If R_DTCounter = R_TempoIndex, deal with delta time
.var	R_TempoIndex		//Save the interrupt count for counting the delta time
.var	R_ADSROffset		//Offset of envelope table
.var	R_ADSRChannel		//Backup channel for envelope
.var	R_MIDITemp			//For temporary when a MIDI is played
.var	R_MIDITempIRQ		//For temporary in IRQ when a MIDI is played		
.var	R_BackUpCh			//SPU channel of a note
.var	R_BackUpChIRQ		//SPU channel of a note in IRQ
R_ChInst: 		.dw 	16 	DUP(?)	//Instrument index for 16 MIDI channels
.define 	R_DrumIndex 	R_ChInst + 9

R_EnvTimeBase:	.dw     D_ChannelNo		DUP(?)	    //Time counter for envelope updating
R_ChDrumIndex:	.dw     D_ChannelNo 	DUP(?)	    //Prevent drum index
R_Note:         .dw     D_ChannelNo 	DUP(?)	    //Note pitch
R_InstIndex:    .dw     D_ChannelNo 	DUP(?)	    //Save the MIDI channel of each SPU channel when a MIDI is played
R_ChTime:       .dw     D_ChannelNo 	DUP(?)	    //Duration counter
R_VeloVol:      .dw     D_ChannelNo 	DUP(?)	    //Velocity X Volume
R_Volume:		.dw     D_ChannelNo 	DUP(?)	    //Integer of current volume
R_Slope: 		.dw     D_ChannelNo 	DUP(?)	    //Integer of envelope slope
R_Target:		.dw     D_ChannelNo 	DUP(?)	    //Integer of envelope target
R_TabOffset:    .dw     D_ChannelNo 	DUP(?)	    //Save the offset of envelope table
R_MidiDuration:	.dw     D_ChannelNo 	DUP(?)	    //Low byte of note duration
//==========================================================================
//User Event (NRPN)
//==========================================================================
.var	R_MainIndex		//Main index of user event for MIDI
.var	R_SubIndex		//Sub index of user event for MIDI
//==========================================================================
//MIDI Event (MIDI CH16)
//==========================================================================
	.IF MIDI_EVENT == D_ON
.var	R_MIDIEvent
	.ENDIF
//==========================================================================
//Mute MIDI Channel
//==========================================================================
	.IF MUTE_MIDI_CH == D_ON
.var	R_EnCh1ToCh16
.define 	D_DisMIDICh1	0x0001       
.define 	D_DisMIDICh2    0x0002       
.define 	D_DisMIDICh3    0x0004       
.define 	D_DisMIDICh4    0x0008     
.define 	D_DisMIDICh5    0x0010       
.define 	D_DisMIDICh6    0x0020      
.define 	D_DisMIDICh7    0x0040       
.define 	D_DisMIDICh8    0x0080      

.define 	D_DisMIDICh9    0x0100    
.define 	D_DisMIDICh10   0x0200      
.define 	D_DisMIDICh11   0x0400     
.define 	D_DisMIDICh12   0x0800      
.define 	D_DisMIDICh13   0x1000   
.define 	D_DisMIDICh14   0x2000      
.define 	D_DisMIDICh15   0x4000     
.define 	D_DisMIDICh16   0x8000
	.ENDIF      
//==========================================================================
//MIDI Key Shift
//==========================================================================
	.IF MIDI_KEY_SHIFT == D_ON
.var	R_KeyShift
	.ENDIF
//==========================================================================
//Channel Volume Control
//==========================================================================
	//.IF CTRL_MIDI_CH_VOL == D_ON
.var	R_CtrlMIDIChVol
.var	R_CtrlVolCh1ToCh16
.define 	D_CtrlCh1Vol	0x0001       
.define 	D_CtrlCh2Vol    0x0002       
.define 	D_CtrlCh3Vol    0x0004       
.define 	D_CtrlCh4Vol    0x0008     
.define 	D_CtrlCh5Vol    0x0010       
.define 	D_CtrlCh6Vol    0x0020      
.define 	D_CtrlCh7Vol    0x0040       
.define 	D_CtrlCh8Vol    0x0080      

.define 	D_CtrlCh9Vol    0x0100    
.define 	D_CtrlCh10Vol   0x0200      
.define 	D_CtrlCh11Vol   0x0400     
.define 	D_CtrlCh12Vol   0x0800      
.define 	D_CtrlCh13Vol   0x1000   
.define 	D_CtrlCh14Vol   0x2000      
.define 	D_CtrlCh15Vol   0x4000     
.define 	D_CtrlCh16Vol   0x8000      
	//.ENDIF
//==========================================================================
//Pitch Bend
//==========================================================================
	.IF PITCH_BEND == D_ON
.var	R_PitchBendMidiCh	//The MIDI Pitch Bend channle number
R_ChNoteFs:		.dw		D_ChannelNo		DUP(?)	//Fs of note in SPU
R_SpuMidiCh:	.dw		D_ChannelNo		DUP(?)	//Save the MIDI channel number of note in SPU channel
.var	R_PitchBendLevel	//Pitch bend level of MIDI note
	.ENDIF
//==========================================================================
//Repeat MIDI
//==========================================================================
	.IF REPEAT_MIDI == D_ON
.var	R_RepeatMIDI	//Bit[14:0] = MIDI index
.define 	D_RepeatMIDI       0x8000       //Bit15 is a Repeat On/Off flag
	.ENDIF
//==========================================================================
//Play MIDI with OneKeyOneNote
//==========================================================================
	.IF  OneKeyOneNote == D_ON	
.var	R_OKON_Status	//For OneKeyOneNote Function
.define 	D_OKON_ON		0x0080	//OneKeyOneNote function is running
.define 	D_OKON_Next		0x0002	//Enable to play next main note
.define 	D_OKON_Clr		0x0004	//Unused
.define 	D_OKON_Start	0x0008	//Unused
.define 	D_OKON_End		0x0010	//For last main note 				
.var	R_MidiCh1NoteInSpu	//Save Last SPU Channel Number
.var	R_GuideChInst		//Used for change instrument when play OneKeyOneNote,save old instrument index
.var	R_ChangeInstIndex	//save new instrument index
R_GuideAddrTemp_BS:	.dw		3	DUP(?)	//DPTR Temp
.define 	R_GuideAddrTemp_DS	R_GuideAddrTemp_BS + 1
.define 	R_GuideAddrTemp		R_GuideAddrTemp_BS + 2
	.ENDIF
	
//*****************************************************************************
// Table Definition Area
//*****************************************************************************
.TEXT

T_ProcessDataEvent_BS:
	.DW	offset(L_ProcessNote)
	.DW	offset(L_ProcessTempo)
	.DW	offset(L_ProcessInst)
	.DW	offset(L_EndedCode)
	.DW	offset(L_LongDeltaTime)
	.DW	offset(L_PitchBend)
	.DW	offset(L_ADSRTimeBase)
	.DW	offset(L_NoteOffTimeBase)
	.DW	offset(L_UserEvent)
.define 	D_ProcessEventSize	 $-T_ProcessDataEvent_BS

T_ProcessDataEvent_DS:
	.DW	seg16(L_ProcessNote)
	.DW	seg16(L_ProcessTempo)
	.DW	seg16(L_ProcessInst)
	.DW	seg16(L_EndedCode)
	.DW	seg16(L_LongDeltaTime)
	.DW	seg16(L_PitchBend)
	.DW	seg16(L_ADSRTimeBase)
	.DW	seg16(L_NoteOffTimeBase)
	.DW	seg16(L_UserEvent)
			
//**************************************************************************
// CODE Definition Area
//**************************************************************************
.CODE
GPF8F_MIDISquencer_CODE:		.section	.CODE

 _SetUpTimeBase:	.proc
F_SetUpTimeBase:
	push R1,R4 to [sp]
	R3 = [T_ADSRTimeBase]
//	R4 = [T_TimeBaseFactor]
//	MR = R3 * R4
//	R3 = R3 lsr 4
//	R3 = R3 lsr 4
	[R_ADSRTimeBase] = R3
	
	R3 = [T_NoteOffTimeBase]
//	R4 = [T_TimeBaseFactor]
//	MR = R3 * R4
//	R3 = R3 lsr 4
//	R3 = R3 lsr 4
	[R_NoteOffTimeBase] = R3
	pop R1,R4 from [sp]
	retf;
	.endp
//****************************************************************
// Function    : F_MIDIPowerUpInitial
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _MIDIPowerUpInitial:	.proc
F_MIDIPowerUpInitial:
	push R1,R3 to [sp]
	R1 = R_InstAddr_BS
	R3 = 0
L_ClrMIDILoop?:	
	[R1] = R3
	R1 += 1
	cmp R1, R_SubIndex+1
	jb L_ClrMIDILoop?	
	
	call F_SetUpTimeBase
	R1 = 0;
	[R_MIDIStatus] = R1
	[R_MIDICtrl] = R1
	[R_SingleNote] = R1
	[R_SingleDrum] = R1
	.IF REPEAT_MIDI == D_ON
	[R_RepeatMIDI] = R1
	.ENDIF
 _MIDIWakeUpInitial:
F_MIDIWakeUpInitial: 	
	R1 = [T_TempoIndexOffset]
	[R_TempoIndex] = R1
	R1 = 0;
	[R_BackUpCh] = R1
	
	.IF MIDI_KEY_SHIFT == D_ON
    [R_KeyShift] = R1
    .ENDIF
    
    .IF CTRL_MIDI_CH_VOL == D_ON
    [R_CtrlVolCh1ToCh16] = R1
    R1 = [DefaultVolumeLevel]
	[R_CtrlMIDIChVol] = R1				//;Set default control volume
    .ENDIF
    
    .IF PITCH_BEND == D_ON
    //%InitPitchBendRAM
    R1 = 0
    R2 = 0xffff
L_InitRAM_Loop?:    
    R3 = R1 + R_SpuMidiCh
    [R3] = R2
    R1 += 1
    cmp R1, D_ChannelNo
    jb L_InitRAM_Loop?
    R1 = [DefaultPBLevel]
    [R_PitchBendLevel] = R1
    .ENDIF
			
	R1 = 0
	R2 = 0
L_Clear?:	
	R3 = R2 + R_ChTime
	[R3] = R1
	R2 += 1
	cmp R2, D_ChannelNo
	jb L_Clear?
	
	call F_MIDI_Init_User
	
	pop R1,R3 from [sp]
	retf;
	.endp	
	

//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Return      : 
// Note        : 
//****************************************************************
 _CheckADSR:	.proc
F_CheckADSR:
	push R5 to [sp]
	R1 = [R_MIDIStatus]
	test R1, D_MusicOff
	jz L_PlayM?
	jmp L_ExitChkChADSR

L_PlayM?:
	test R1, D_MIDIEn
	jnz L_ProcessChADSR         //;Bit7 = 1, MIDI is played
	R1 = [R_SingleNote]			//;Check if a single note or drum is played
	R1 |= [R_SingleDrum]
	jne L_ProcessChADSR
	jmp L_ExitChkChADSR
	
L_ProcessChADSR:
	R1 = 0	
	[R_ADSRChannel] = R1		//;R_ADSRChannel = Channel number
L_ChkChADSR:
	R1 = [R_ADSRChannel]
	//.IF SPEECH == D_ON
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_ChkNextChADSR
	//.ENDIF
	
	R2 = R1 + R_EnvTimeBase
	R2 = [R2]
	jnz	L_ChkNextChADSR         //;Process envelope when TimeBase = 0
	
	R2 = R1 + R_ChStatus
	R2 = [R2]
	test R2, D_NoteOffFlag
	jnz L_NoteOffRelease        //;If Mididuration = 0, note release
	
	test R2, D_ReachLastDrop
	jnz L_ChkNextChADSR         //;If = 1, the envelope is reach last drop, skip envelope module 
	
//==========================================================================
//Avoid updating envelope before concatenation
//==========================================================================	
	R2 = R1 + T_ChEnableHB
	R2 = [R2]
	test R2, [P_SPU_CH_Ctrl]
	jnz L_ChkNextChADSR
	call F_CheckChADSR
	jmp L_ChkNextChADSR
L_NoteOffRelease:	
	call F_NoteOff
L_ChkNextChADSR:	
	R1 = [R_ADSRChannel]
	R1 += 1
	cmp R1, D_ChannelNo
	je L_ExitChkChADSR
	[R_ADSRChannel] = R1
	jmp L_ChkChADSR
L_ExitChkChADSR:	
	pop R5 from [sp]
	retf;
//==========================================================================
//Target and slope both need to multiply the value of "R_Velovol"
//==========================================================================	
F_CheckChADSR:
	IRQ OFF
	R2 = [R_ADSRTimeBase]
	R3 = R1 + R_EnvTimeBase
	[R3] = R2					//;Reset counter
	IRQ ON
	R2 = R1 + R_Slope;
	R5 = [R2];
	jpl L_AddEnvelope
	goto L_SubEnvelope

L_AddEnvelope:
	R2 = R1 + R_Volume;
	R3 = [R2];
	R3 &= 0x7fff;				// Get current volume
	
	R4 = R1 + R_Slope; 
	R4 = [R4];					// Get current slope
	R3 += R4;					// Next volume = current volume + slope
	jmi L_IsTarget_
	[R2] = R3
	
	R4 = R1 + R_Target;
	R4 = [R4];					// Get target volume
	
	cmp R3, R4;					
	jae L_IsTarget_;			// Current volume >= Target, the envelope reached target
	
L_IsNotTarget_:
	R1 = R1 lsl 4;
	R2 = R1 + P_SPU_Ch0_Volume_Ctrl;
	//R4 = [R2];
	//R4 &= 0x8080;
	R5 = R3 & 0x7f80
	R5 = R5 lsl 1
	R5 &= 0xFF00
	R3 = R5 lsr 4;
	R3 = R3 lsr 4;
	R3 |= R5 
	//R3 |= R4;
	IRQ OFF
	[R2] = R3;
	IRQ ON
	goto L_ExitCheckChADSR
L_IsTarget_:
	R4 = R1 + R_Target;
	R4 = [R4];
	R5 = R4 & 0x7f80
	R5 = R5 lsl 1
	R4 = R5 lsr 4;
	R4 = R4 lsr 4;
	R4 |= R5
	R2 = R1 lsl 4
	R5 = R2 + P_SPU_Ch0_Volume_Ctrl;
	IRQ OFF
//	R3 = [R5];
//	R3 &= 0x8080;
//	R3 |= R4;					// {R_Ch1VolCtl,Y) & 0x0080 | (R_TargetCh1Integer,X)
	[R5] = R4;
	R2 = R1 + R_ChStatus
	R3 = [R2]
	test R3, D_TargetIsLastDrop
	jz L_NotReachLastDrop_?
L_ReachLastDrop_?:
	R3 |= D_ReachLastDrop
	[R2] = R3
	IRQ ON
	goto L_ExitCheckChADSR
L_NotReachLastDrop_?:	
	IRQ ON
	R2 = R1 + R_Target;
	R4 = [R2];
	R3 = R1 + R_Volume;
	[R3] = R4;						// Volume for next time
	
	R2 = R1 + R_TabOffset;
	R3 = [R2];
	R3 += 4;
	[R_ADSROffset] = R3;
	[R2] = R3;							// Get next ADSR value!

	R2 = R1 + R_ChStatus;
	R3 = [R2];
	test R3, D_DrumPlaying;
	jnz L_GetDrumAdsrValue_
	R2 = [R_ADSRChannel]
	call F_GetAdsrValue;				// input=R_TableOffset(Offset); output=R_ADSR.
	goto L_GetSlope_
L_GetDrumAdsrValue_:
	R2 = R1 + R_ChDrumIndex;
	R1 = [R2];						// Get Drum index
	call F_GetDrumAdsrValue
L_GetSlope_:
	R5 = [R_ADSRChannel];
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];					//;Get integer of slope
	test R3, 0x0080;
	jnz L_SlopeMinus_           	//;Check if slope is minus
L_SlopePlus_:                       //;Slope is plus		
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];					//;Get float of slope
    R3 = R3 lsl 4;
    R3 = R3 lsl 4;
    R3 |= R4;
    
	R4 = R5 + R_VeloVol;
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	
	MR = R3 * R4, uu;
	
	R3 &= 0xFF00;
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 |= R3;
	jnz L_Branch?
	R4 = 0x0001						// ;If slop is zero, set "01H" as minimum value
L_Branch?:	
	R3 = R5 + R_Slope;
	[R3] = R4;
	goto L_GetTarget_
		
L_SlopeMinus_:                      // ;Slope is minus		
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;
	R3 ^= 0xFFFF;
	R3 += 1;
	test R3, 0x00FF;
	jnz ?L_Across_Minus;
	R3 -= 0x0100;

?L_Across_Minus:
	R4 = R5 + R_VeloVol;
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;

	MR = R3 * R4, uu;
	
	R3 &= 0xFF00;
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R3 ^= 0x00FF;
	R3 += 1;					// R_ProductM
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 ^= 0xFF00;
	R4 |= R3;
    jnz L_Branch?
	R4 = 0x0001						// ;If slop is zero, set "01H" as minimum value
L_Branch?:
	R3 = R5 + R_Slope;
	[R3] = R4;
L_GetTarget_:	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];		
//-------- ADSR*(ChVol*Velocity) -----  
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	R3 = R5 + R_VeloVol;
	R3 = [R3];

	MR = R4 * R3, uu;

	R4 = R5 + R_Target;
	[R4] = R3;
//------------------------------------
	R1 += 4;
	//R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];
	cmp R3, 0x00FF;
	je L_TargetIsLastDrop_?
	goto L_ExitCheckChADSR
	
L_TargetIsLastDrop_?:
	R3 = R5 + R_ChStatus;
	IRQ OFF
	R4 = [R3];
	R4 |= D_TargetIsLastDrop;
	[R3] = R4;	
	IRQ ON
	goto L_ExitCheckChADSR
	
L_SubEnvelope:	
	R2 = R1 + R_Volume;
	R3 = [R2];
	R3 &= 0x7fff;				// Get current volume
	
	R4 = R1 + R_Slope; 
	R4 = [R4];					// Get current slope
	R3 += R4;					// Next volume = current volume + slope
	jmi L_IsTarget
	[R2] = R3
	
	R4 = R1 + R_Target;
	R4 = [R4];					// Get target volume		
	
	cmp R3, R4;					
	jbe L_IsTarget              //;If Target > Current, the envelope reached target
L_IsNotTarget:
	R1 = R1 lsl 4
	R2 = R1 + P_SPU_Ch0_Volume_Ctrl;
	//R4 &= 0x8080;
	R5 = R3 & 0x7f80
	R5 = R5 lsl 1
	R3 = R5 lsr 4;
	R3 = R3 lsr 4;
	R3 |= R5 
	//R3 |= R4;
	IRQ OFF
	[R2] = R3;	
	IRQ ON
	goto L_ExitCheckChADSR
L_IsTarget:                      //;Reach target	
	R4 = R1 + R_Target;
	R4 = [R4];
	R5 = R4 & 0x7f80
	R5 = R5 lsl 1
	R4 = R5 lsr 4;
	R4 = R4 lsr 4;
	R4 |= R5
	R2 = R1 lsl 4
	R5 = R2 + P_SPU_Ch0_Volume_Ctrl;
	//R3 = [R5];
	//R3 &= 0x8080;
	//R3 |= R4;					// {R_Ch1VolCtl,Y) & 0x0080 | (R_TargetCh1Integer,X)
	IRQ OFF
	[R5] = R4;
	//R3 &= ~0x8080
	IRQ ON
	R4 = R4
	jnz L_EnvelopeLastDropIsNotZero
L_EnvelopeLastDropIsZero:	
	R3 = 0x0000;
	R2 = R1 + R_TabOffset;
	[R2] = R3;					// Clear table offset!
	R2 = R1 + R_Volume;
	R3 = [R2];
	R3 &= 0xFF00;
	[R2] = R3;					// reset float part of Vol to 0!
	
	//.IF SPEECH = D_ON
	R2 = R1 + R_ChSpeechStatus
	test R2, D_SpeechPlaying
	jnz L_ExitCheckChADSR
	//.ENDIF
	R2 = R1
	goto F_StopSound             //;Stop channel
L_ExitCheckChADSR:	
	retf;	
	
L_EnvelopeLastDropIsNotZero:	
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	test R3, D_TargetIsLastDrop;
	jz L_NotReachLastDrop?     //;Check the current target is last drop or not
	  
L_ReachLastDrop?:
	R3 |= D_ReachLastDrop;	   //;Reach last drop, set flag to skip envelope module
	IRQ OFF
	[R2] = R3;
	IRQ ON
	goto L_ExitCheckChADSR
L_NotReachLastDrop?:	
	R2 = R1 + R_Target;
	R4 = [R2];
	R3 = R1 + R_Volume;
	[R3] = R4;						// Volume for next time
	
	R2 = R1 + R_TabOffset;
	R3 = [R2];
	R3 += 4;
	[R_ADSROffset] = R3;
	[R2] = R3;							// Get next ADSR value!

	R2 = R1 + R_ChStatus;
	R3 = [R2];
	test R3, D_DrumPlaying;
	jnz L_GetDrumAdsrValue
	R2 = [R_ADSRChannel]
	call F_GetAdsrValue;				// input=R_TableOffset(Offset); output=R_ADSR.
	goto L_GetSlope
L_GetDrumAdsrValue:	
	R2 = R1 + R_ChDrumIndex;
	R1 = [R2];						// Get Drum index
	call F_GetDrumAdsrValue
L_GetSlope:
	R5 = [R_ADSRChannel];
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];					//;Get integer of slope
	test R3, 0x0080;
	jnz L_SlopeMinus	           	//;Check if slope is minus
L_SlopePlus:
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];					//;Get float of slope
    R3 = R3 lsl 4;
    R3 = R3 lsl 4;
    R3 |= R4;
    
	R4 = R5 + R_VeloVol;
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	
	MR = R3 * R4, uu;
	
	R3 &= 0xFF00;
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 |= R3;
	jnz L_Branch?
	R4 = 0x0001						// ;If slop is zero, set "01H" as minimum value
L_Branch?:	
	R3 = R5 + R_Slope;
	[R3] = R4;
	goto L_GetTarget
	
L_SlopeMinus:	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;
	R3 ^= 0xFFFF;
	R3 += 1;
	test R3, 0x00FF;
	jnz ?L_Across_Minus;
	R3 -= 0x0100;

?L_Across_Minus:
	R4 = R5 + R_VeloVol;
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;

	MR = R3 * R4, uu;
	
	R3 &= 0xFF00;
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R3 ^= 0x00FF;
	R3 += 1;					// R_ProductM
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 ^= 0xFF00;
	R4 |= R3;
    jnz L_Branch?
	R4 = 0x0001						// ;If slop is zero, set "01H" as minimum value
L_Branch?:
	R3 = R5 + R_Slope;
	[R3] = R4;
L_GetTarget:
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];		
//-------- ADSR*(ChVol*Velocity) -----  
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	R3 = R5 + R_VeloVol;
	R3 = [R3];

	MR = R4 * R3, uu;

	R4 = R5 + R_Target;
	[R4] = R3;
//------------------------------------
	R1 += 4;
	//R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];
	cmp R3, 0x00FF;
	je L_TargetIsLastDrop?
	goto L_ExitCheckChADSR
L_TargetIsLastDrop?:
	R3 = R5 + R_ChStatus;
	IRQ OFF
	R4 = [R3];
	R4 |= D_TargetIsLastDrop;
	[R3] = R4;	
	IRQ ON
	goto L_ExitCheckChADSR
	.endp
	
//****************************************************************
// Function    : 
// Description : Input = R_ADSRChannel = Channel number (0~7)
// Destory     : 
// Return      : 
// Note        : 
//****************************************************************
F_NoteOff:	.proc
	R1 = [R_ADSRChannel];
// Initial note off envelope is just done once, 	
	R2 = R1 + R_ChStatus; 
	R3 = [R2];
	test R3, D_SkipIniNoteOffEnv
	jnz L_SkipIniNoteOffEnv?
	
	call F_InitialNoteOffEnv
	
	R1 = [R_ADSRChannel]
	R2 = R1 + R_ChStatus
	IRQ OFF
	R3 = [R2]
	R3 |= D_SkipIniNoteOffEnv
	[R2] = R3
	IRQ ON
L_SkipIniNoteOffEnv?:	
	R1 = [R_ADSRChannel]
	IRQ OFF
	R2 = R1 + R_EnvTimeBase
	R3 = [R_NoteOffTimeBase];
	[R2] = R3				// Reset envelope time base!
	IRQ ON
	
	R1 = [R_ADSRChannel]
	R2 = R1 + R_Slope
	R3 = [R2]
	R2 = R1 + R_Volume
	R4 = [R2]
	R3 += R4
	[R2] = R3
	jmi L_IsTargetNoteOff
	R2 = R1 + R_Target
	R4 = [R2]
	cmp R3, R4
	jbe L_IsTargetNoteOff
	
	.comment @
	R1 = [R_ADSRChannel]
	R2 = R1 + R_Volume
	R3 = [R2]
	R3 &= 0x007f
	R1 = R1 lsl 4
	R2 = R1 + P_SPU_Ch0_Volume_Ctrl;
	R4 = [R2];
	R4 &= 0x00FF;
	R4 = R4 lsl 4;
	R4 = R4 lsl 3;
	R4 |= R3;
	R5 = R4
	
	R1 = [R_ADSRChannel]
	R2 = R1 + R_Slope
	R4 = [R2]
	
	R4 += R5
	R3 = R4
	R2 = R1 + R_Volume;
	R4 = [R2];
	R4 &= 0xFF00;
	R1 = R3 & 0x00FF;
	R4 |= R1;
	[R2] = R4;
	
	R4 = R3;
    jpl	?L_Across
    goto L_IsTargetNoteOff				// If =minus, the envelope already reach zero.
    
?L_Across:  
	R1 = [R_ADSRChannel];			// Store volum back
	R2 = R1 + R_Volume;
	[R2] = R3;
//-------------------------------------------------      
	R2 = R1 + R_Target;
	R4 = [R2];
	R5 = R4;				// Get target volume

	R2 = R1 + R_Volume;
	R4 = [R2];						// Get current volume

	R4 -= R5;				// Current volume - Target
	
	jcs L_IsNotTargetNoteOff
	goto L_IsTargetNoteOff
	;@
L_IsNotTargetNoteOff:
	IRQ OFF	
	//R1 = R1 lsl 4
	//R2 = R1 + P_SPU_Ch0_Volume_Ctrl
	//R1 = [R_ADSRChannel] 
	R2 = R1 + R_Volume;
	R4 = [R2];
	R5 = R4 & 0x7f80
	R5 = R5 lsl 1
	R4 = R5 lsr 4
	R4 = R4 lsr 4
	R4 |= R5
	R1 = R1 lsl 4
	R2 = R1 + P_SPU_Ch0_Volume_Ctrl
	[R2] = R4
	IRQ ON
	R4 &= 0x00fe 	//		7bits
	jnz L_ExitNoteOff           //;Close Ch when Volume = 0
	R2 = [R_ADSRChannel] 
	jmp F_StopSound
L_ExitNoteOff:	
	retf;
	
L_IsTargetNoteOff:
	//.IF SPEECH = D_ON
	R1 = [R_ADSRChannel]
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_ExitNoteOff
	//.ENDIF
	
	IRQ OFF
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 &= ~(D_NoteOffFlag+D_TargetIsLastDrop+D_ReachLastDrop+D_ZCJump+D_SkipIniNoteOffEnv+D_NotePlaying+D_DrumPlaying+D_AdpcmJumpPcm)
	[R2] = R3
	IRQ ON
	R2 = [R_ADSRChannel]
//****************************************************************
// Function    : F_StopSound
// Description : 
// Destory     : 
// Parameter   : R2 = Channel number	
// Return      : 
// Note        : 
//****************************************************************			
F_StopSound:		                //;R2 = Channel number	
	push R1, R3 to [sp]
	IRQ OFF
	R3 = R2 lsl 4
	R1 = R3 + P_SPU_Ch0_Volume_Ctrl
	R3 = 0
	[R1] = R3
//	R3 = [R1]
//	R3 &= 0x8080
//	[R1] = R3						 //;Close channel volume
	
	setb [P_SPI_Misc], 15;			//20240920 Jerry add to fixed midi play
	
	R1 = P_SPU_CH_Ctrl
	clrb [R1], R2					//;Close the channel
	
	R1 = 0
	R3 = R2 + R_ChTime
	[R3] = R1
	
	R1 = [P_SPU_INT_Ctrl]
	R1 &= 0x00ff
	clrb R1, R2
	[P_SPU_INT_Ctrl] = R1			//;Close the channel's IRQ
	
	R1 = R_SingleNote
	clrb [R1], R2					//;If a single note is played, clear flag

	R1 = R_SingleDrum
	clrb [R1], R2	
	
	IRQ ON
L_ExitStopSound:	
	pop R1, R3 from [sp]
	retf;
	.endp	
	
//****************************************************************
// Function    : F_InitialNoteOffEnv:
// Description : 
// Destory     : 
// Return      : 
// Note        : 
//****************************************************************	
F_InitialNoteOffEnv:	.proc
	call F_GetNoteOffEnv         //;Get address of note off table
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	DS = R2;
	R3= D:[R1];					 //;Get integer of slope
	test R3, 0x0080;
	jz L_SlopePlusNoteOff
	goto L_SlopeMinusNoteOff
L_SlopePlusNoteOff:
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];				// ;Get float of slope
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R4 |= R3;
	
	R5 = [R_ADSRChannel];
	R3 = R5 + R_VeloVol;
	R3 = [R3];
	R3 = R3 lsl 1;
	R3 &= 0x00FF;

	MR = R3 * R4, uu;
	
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;			// R_ProductM
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 |= R3;
	
	R3 = R5 + R_Slope;
	[R3] = R4;
	goto L_GetTargetNoteOff	
	
L_SlopeMinusNoteOff:	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R4 |= R3;
	R4 ^= 0xFFFF;
	R4 += 1;
	test R4, 0x00FF;
	jnz ?L_Across;
	R4 -= 0x0100;
?L_Across:
	R5 = [R_ADSRChannel];
	R3 = R5 + R_VeloVol;
	R3 = [R3];
	R3 = R3 lsl 1;
	R3 &= 0x00FF;
	MR = R3 * R4, uu;
	
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R3 ^= 0x00FF;
	R3 += 1;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 ^= 0xFF00;
	R4 |= R3;
	
	R3 = R5 + R_Slope;
	[R3] = R4;	
	
L_GetTargetNoteOff:
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];
//-------- Envelope*(ChVol*Velocity) -----  
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	R3 = R5 + R_VeloVol;
	R3 = [R3];

	MR = R4 * R3, uu;
	
	R2 = R5 + R_Target;
	[R2] = R3;
        
L_ExitInitialNoteOffADSR:
	retf;
	.endp	
	
//****************************************************************
// Function    : F_InitialNoteOffEnv:
// Description : 
// Destory     : 
// Return      : 
// Note        : 
//****************************************************************		
F_GetNoteOffEnv:	.proc                //;Get address of note off table
	R1 = [R_ADSRChannel];
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 &= D_DrumPlaying;
	jnz L_GetDrumNoteOffEnv
	goto L_GetInstNoteOffEnv
L_GetDrumNoteOffEnv:
	R2 = R1 + R_ChDrumIndex;
	R1 = [R2];				// Get Drum index
	R1 = R1 lsl 1;
	R4 = seg T_DrumInst;
	R3 = R1 + T_DrumInst;
	R4 += 0, carry;
	DS = R4;
	R1 = D:[R3];
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];
	
	R1 += 5;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];
	
	[R_InstAddr_BS] = R3;
	[R_InstAddr_DS] = R4;
	
	goto L_ExitGetNoteOffEnv
	
L_GetInstNoteOffEnv:	
	R2 = [R_ADSRChannel]
	call F_GetInstAddr           //;Get instrument address	
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	R1 += 3;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];				//;Get low address of instrument table
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];				//;Get high address of instrument table
	
	R3 += 7;
	R4 += 0, carry;				

	DS = R4;
	R1 = D:[R3];				//;Get low address of note off table
	
	R3 += 1;
	R4 += 0, carry;				
	DS = R4;
	R2 = D:[R3];				//;Get high address of note off table
	[R_InstAddr_BS] = R1;
	[R_InstAddr_DS] = R2;	
L_ExitGetNoteOffEnv:	
	retf;
	.endp
//****************************************************************
// Function    : 
// Description : 
// Destory     : 
// Parameter   : R1: MIDI index:  0 ~ max index : Auto mode                        
//               R2: Dynamic Allocation Type
// Dynamic Type: 0 = Dynamic Off, 1 = Oldest note out, 2 = Newest note out, 3 = Minimum volume note out
// Return      : 
// Note        : 
//****************************************************************
 _MIDI_Play: .proc
 	R2 = SP + 3;
	R1 = [R2++];							// MIDI index
	R2 = [R2];								// Dynamic Allocation Type
F_MIDI_Play:
	push R5 to [sp]
	R3 = [R_MIDIStatus]
	test R3, D_MusicOff
	jz L_PlayM?
	goto L_ExitPlayMIDI
L_PlayM?:
	R3 &= ~(D_DynaAllocOff+D_NewestNoteOut+D_MinVolNoteOut)
	[R_MIDIStatus] = R3 	//Avoid the dynamic flag be cleared 
	
	call F_SelectDynamic

	.IF REPEAT_MIDI == D_ON	
	R3 = [R_RepeatMIDI]
	test R3, D_RepeatMIDI	//;Bit15 is a flag of MIDI repeat mode
	jnz	L_KeepOnRepeat?
L_NoRepeat?:
	[R_RepeatMIDI] = R1
	jmp L_GoOn?	
L_KeepOnRepeat?:	
	R3 = R1
	R3 |= D_RepeatMIDI
	[R_RepeatMIDI] = R3
L_GoOn?:
	.ENDIF		
	
	R1 += R1
	R2 = SEG16 T_MIDI_Table
	R3 = OFFSET T_MIDI_Table
	R3 += R1
	R2 += 0, CARRY
	DS = R2
	R4 = D:[R3++]
	[R_MIDIDPTR_BS] = R4
	R4 = D:[R3]
	[R_MIDIDPTR_DS] = R4
	
	R1 = [R_MIDICtrl]
	R1 &= ~(D_DataHLByte)
	[R_MIDICtrl] = R1	
	
	R3 = [T_TempoIndexOffset]
	[R_TempoIndex] = R3

	R1 = 0
L_SPU_Initial?:
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_Next?
	
	R2 = [R_SingleNote]			//Check if a single note or drum is played in this channel
	R2 |= [R_SingleDrum]
//	R3 = R1 + T_ChEnableLB
//	R3 = [R3]
//	test R2, R3 
	tstb R2, R1
	jnz L_Next?
	
	R2 = 0
	R3 = R1 + R_ChTime
	[R3] = R2
	
	IRQ OFF
	R2 = [P_SPU_CH_Ctrl]
	R3 = R1 + T_ChDisableLB
	R3 = [R3]
	R2 &= R3
	[P_SPU_CH_Ctrl] = R2
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	R3 = R1 + T_ChDisableLB
	R3 = [R3]
	R2 &= R3
	[P_SPU_INT_Ctrl] = R2
	IRQ ON
	
L_Next?:
	R1 += 1	
	cmp R1, D_ChannelNo
	jb L_SPU_Initial?
	
	R1 = 0
	R2 = 0
	.IF OneKeyOneNote == D_ON
	[R_OKON_Status] = R1
	.ENDIF
	
L_DurationClr?:	
	R3 = R1 + R_MidiDuration
	[R3] = R2						//;Clear duration
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_DurationClr?
	
	[R_MainIndex] = R2				//;Used for user event
	[R_SubIndex] = R2
	IRQ OFF
	[R_DeltaTime] = R2				//;Initialize delta time
	IRQ ON
	
	.IF MIDI_EVENT == D_ON
	[R_MIDIEvent] = R2
    .ENDIF
    
    .IF MUTE_MIDI_CH == D_ON
    [R_EnCh1ToCh16] = R2
    .ENDIF
    
    .IF MIDI_KEY_SHIFT == D_ON
    [R_KeyShift] = R2
    .ENDIF
    
    .IF CTRL_MIDI_CH_VOL == D_ON
    [R_CtrlVolCh1ToCh16] = R2
	R2 = [DefaultVolumeLevel]
	[R_CtrlMIDIChVol] = R2
    .ENDIF
    
    R2 = [R_MIDICtrl]
    R2 &= ~(D_PauseMIDI + D_MIDIEvent + D_DataHLByte)
    [R_MIDICtrl] = R2	
    
    R2 = [R_MIDIStatus]
    R2 &= ~(D_DeltaTime+D_UserEvent)
    R2 |= D_MIDIEn
    [R_MIDIStatus] = R2				//;Initialize delta time
    
L_GOM?:   
	IRQ OFF
//	R1 = [P_INT_Ctrl]
//	R1 |= C_IRQ4_SPU
//	[P_INT_Ctrl] = R1
	
//	R1 = [P_INT2_Ctrl]					//;Enable IRQ6 4096Hz
//    R1 |= C_IRQ6_4096Hz
//    [P_INT2_Ctrl] = R1       
	//call F_MIDI_IntEnable    
	IRQ ON
L_ExitPlayMIDI:	
	pop R5 from [sp]
	retf;
	.endp
	
//****************************************************************
// Function    : CheckMidiDuration
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _CheckMidiDuration:	.proc
F_CheckMidiDuration:
	R1 = [R_MIDIStatus]
	test R1, D_MusicOff
	jz L_PlayM?
	retf;
	
L_PlayM?:
	test R1, D_MIDIEn
	jnz L_MIDIPlaying?	
	retf;
	
L_MIDIPlaying?:						//;If MidiDuration = 0, set it as note off
	R1 = 0
L_CheckDurationLoop?:
	//.IF SPEECH == D_ON
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_CheckNextDuration?
	//.ENDIF
	
	IRQ OFF
	R2 = R1 + R_MidiDuration
	R2 = [R2]
	IRQ ON
	jnz L_CheckNextDuration?
	
	
	R3 = [R_SingleNote]				//If a single note is played, don't check duration
	R3 |= [R_SingleDrum]			//If a single drum is played, don't check duration
//	R2 = R1 + T_ChEnableLB
//	R2 = [R2]
//	test R3, R2		
	tstb R3, R1			 
	jnz L_CheckNextDuration?
	
	IRQ OFF
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_NoteOffFlag
	[R2] = R3					 //Set Note off flag
	IRQ ON
	
	R2 = R1 + R_Volume
	R3 = [R2]
	R3 &= 0xff00
	[R2] = R3					 //Initialize float part of channel volume to calculate new release value
L_CheckNextDuration?:	
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_CheckDurationLoop?
	retf;
	.endp
	
//****************************************************************
// Function    : F_ServiceMIDI
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _ServiceMIDI:	.proc
F_ServiceMIDI:
	push R5 to [sp]	
	call F_MIDIFlowProcess
	R1 = [0x306A];
	R1 &= 0x00FF;
	jnz ?L_SPU_CH_On;
	tstb [P_SPI_Misc], 15;
	jz ?L_SPI_8Words;
	clrb [P_SPI_Misc], 15;
?L_SPI_8Words:
?L_SPU_CH_On:	
	pop R5 from [sp]
	retf
	.endp
//****************************************************************
// Function    : F_ServiceMIDI
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
// _ServiceMIDI:	.proc
//F_ServiceMIDI:
F_MIDIFlowProcess:	.proc 
	R1 = [R_MIDICtrl]
	test R1, D_PauseMIDI
	jz L_PlayM1?
	jmp  L_ExitServiceMIDI
	
L_PlayM1?:
	R1 = [R_MIDIStatus]
	test R1, D_MusicOff
	jz L_PlayM?
	jmp  L_ExitServiceMIDI

L_PlayM?:
	test R1, D_MIDIEn
	jnz L_MIDINormalPlay
L_ExitServiceMIDI:	
	retf;
	
L_MIDINormalPlay:
	.IF  OneKeyOneNote == D_ON
	R1 = [R_OKON_Status]
	test R1, D_OKON_ON
	jz ?L_PlayMelodyDirectly		//Not OneKeyOneNote Mode,decode MIDI directly
	test R1, D_OKON_End
	jz L_NormalDecode?
	R2 = [R_MidiCh1NoteInSpu]		//Get current SPU channel index,check status
//	R3 = R2 + T_ChEnableLB
//	R3 = [R3]
	R3 = [P_SPU_CH_Ctrl]
//	R2 &= R3
	tstb R3, R2
	je L_EndLastNote?
	retf;							//The last note of main channel is not end,wait for the SPU channel release
L_EndLastNote?:
	R1 = [R_GuideAddrTemp_BS]
	[R_MIDIDPTR_BS] = R1
	R1 = [R_GuideAddrTemp_DS]
	[R_MIDIDPTR_DS] = R1
	R1 = [R_MIDICtrl]
	R2 = [R_GuideAddrTemp]
	R1 &= ~(D_DataHLByte)
	R1 |= R2
	[R_MIDICtrl] = R1
	
	R1 = [R_OKON_Status]
	R1 &= ~(D_OKON_End)		
	R1 |= D_OKON_Next
	[R_OKON_Status] = R1
L_NormalDecode?:	
	R1 = [R_OKON_Status]
	test R1, D_OKON_Next
	jnz L_DataFetchLoop				//ignore delta time when 1key1note ,modified by yanlong 2013.11.13
	retf;							//do not decode if there is no key when playing OKON
?L_PlayMelodyDirectly:			
	.ENDIF //END OKON
	
	R1 = [R_DeltaTime]
	jmi L_DataFetchLoop
	jne L_ExitServiceMIDI
L_DataFetchLoop:	
	R1 = 0
L_DecChTimeLoop?:
	R2 = R1 + R_ChTime
	R3 = [R2]
	je L_ChkNextChTime?
	R3 -= 1
	[R2] = R3
L_ChkNextChTime?:
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_DecChTimeLoop?
	
	call F_GetMIDIData				//Get MIDI data
	R1 = [R_MIDIStatus]
	test R1, D_DeltaTime
	jz L_IsDeltaTime
L_IsNotDeltaTime:	
	R1 = [R_MIDIData]				//;It's not Delta time
	R1 &= 0x000f					//;Bit0~3 = Event
	cmp R1, D_ProcessEventSize		//;Number of event
	jb L_ContinueJmp
	
L_IsDeltaTime:
	R1 = [R_MIDIStatus]				//Delta time flag
	R1 |= D_DeltaTime
	[R_MIDIStatus] = R1
	IRQ OFF
	R1 = [R_DeltaTime]
	R1 = R1 + [R_MIDIData]
	[R_DeltaTime] = R1
	IRQ ON
	retf;
	
L_ContinueJmp:	
	R3 = R1 + T_ProcessDataEvent_BS
	R3 = [R3]
	R4 = R1 + T_ProcessDataEvent_DS
	R4 = [R4]
	goto MR


//==========================================================================
//Event 0
//==========================================================================
//    8-bit        4-bit  4-bit        8-bit         8-bit         8-bit         8-bit
// Delta-time     Channel Event     Note Index  Velocity*Volume Duration_LB   Duration_HB
//==========================================================================
L_ProcessNote:
	R1 = [R_MIDIData]
	R1 = R1 lsr 4
	[R_MIDIData] = R1			//;Get MIDI channel
L_Continue?:
	.IF MIDI_EVENT == D_ON
L_MIDIEvent:					//;Deal with MIDI Event
	R2 = [T_C16MIDIEvnet]
	je L_AllocateChannel
	cmp R1, 0x000f				//;MIDI CH16 = MIDI Event if MIDI_EVENT is "ON"
	jne	L_AllocateChannel
L_GetMIDIEvent?:
	R1 = [R_MIDICtrl]			//;Set flag
	R1 |= D_MIDIEvent
	[R_MIDICtrl] = R1
L_GetPitch?:					//;Get pitch
	call F_GetMIDIData
	R1 = [R_MIDIData]	
	[R_MIDIEvent] = R1
L_GetVolume?:
	call F_GetMIDIData			//;Get volume
	R1 = [R_MIDIData]	
	test R1, C_Bit7
	jnz L_TwoBytesDuration?
L_OneByteDuration?:
	call F_GetMIDIData			//;Get one byte duration
	jmp L_ExitMIDIEvent?
L_TwoBytesDuration?:
	call F_GetMIDIData			//;Get two bytes duration
	call F_GetMIDIData	
L_ExitMIDIEvent?:
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	retf;		
	.ENDIF
	
	R1 = [R_MIDIData]	
    .IF MUTE_MIDI_CH == D_ON
//    R3 = R1 + T_ChEnableLB
//    R3 = [R3]
//    R1 = [R_EnCh1ToCh16]
//    R1 &= R3
	R3 = [R_EnCh1ToCh16]
	tstb R3, R1
    je L_ExitChkMIDICh
L_DisableMIDIChannel:
	//%ClearDeltaTimeFlag    
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	call F_GetMIDIData
	call F_GetMIDIData
	R1 = [R_MIDIData]			 //Process Velocity X Volume
	test R1, 0x0080
	jnz L_TwoByteDurationDisable
	call F_GetMIDIData
	jmp L_ExitDisableMIDIChannel
L_TwoByteDurationDisable:
	call F_GetMIDIData
	call F_GetMIDIData	
L_ExitDisableMIDIChannel:
	retf
L_ExitChkMIDICh:		
    .ENDIF	
	
L_AllocateChannel:	
	R1 = [R_MIDIStatus]
	test R1, D_DynaAllocOff
	jnz L_DynamicAllocOff
	
	test R1, D_NewestNoteOut
	jnz L_NewestNoteOut
	
	test R1, D_MinVolNoteOut
	jz L_OldestNoteOut
L_MinVolNoteOut:
	call F_FindMinChVol          //;Dynamic allocation with minimum volume note out
	jmp L_DynamicAllocOn
L_NewestNoteOut:
	call F_FindNewestNote        //;Dynamic allocation with newest note out
	JMP  L_DynamicAllocOn	
L_OldestNoteOut:
	call F_FindOldestNote        //;Dynamic allocation with oldest note out
	JMP  L_DynamicAllocOn	
//==========================================================================
//Dynamic off
//==========================================================================
L_DynamicAllocOff:               //;No dynamic allocation	
	R1 = [R_MIDIData]			 //;MIDI channel
	cmp R1, 0x0009				 //;Check if it's the CH10 (Drum)
	je 	L_MapToHWCh
	cmp R1, D_ChannelNo			 // ;If the MIDI channel is over physical channel, set channel to last physical channel
	jae L_MapToHWCh
	[R_BackUpCh] = R1
	R2 = R1
	call F_StopSound
	jmp L_AllocatedCh
L_MapToHWCh:
	R2 = D_ChannelNo-1           //;Map MIDI channel 10 to last physical channel when dynamic off	
	[R_BackUpCh] = R2
	call F_StopSound
	jmp L_AllocatedCh
//==========================================================================
//Dynamic allocation
//==========================================================================	
L_DynamicAllocOn:	
	R2 = [R_BackUpCh]
	R1 = 0xffff
	R3 = R2 + R_ChTime
	[R3] = R1					 //;Initialize channel time
	R1 = [R_MIDIData]			 //;MIDI channel
L_AllocatedCh:	
	.IF PITCH_BEND == D_ON
	R2 = [R_BackUpCh]
	R3 = R2 + R_SpuMidiCh
	[R3] = R1
    .ENDIF
    
//    .IF MUTE_MIDI_CH == D_ON
////    R3 = R1 + T_ChEnableLB
////    R3 = [R3]
////    R1 = [R_EnCh1ToCh16]
////    R1 &= R3
//	R3 = [R_EnCh1ToCh16]
//	tstb R3, R1
//    je L_ExitChkMIDICh
//L_DisableMIDIChannel:
//	//%ClearDeltaTimeFlag    
//	R1 = [R_MIDIStatus]
//	R1 &= ~(D_DeltaTime)
//	[R_MIDIStatus] = R1
//	call F_GetMIDIData
//	call F_GetMIDIData
//	R1 = [R_MIDIData]			 //Process Velocity X Volume
//	test R1, 0x0080
//	jnz L_TwoByteDurationDisable
//	call F_GetMIDIData
//	jmp L_ExitDisableMIDIChannel
//L_TwoByteDurationDisable:
//	call F_GetMIDIData
//	call F_GetMIDIData	
//L_ExitDisableMIDIChannel:
//	retf
//L_ExitChkMIDICh:		
//    .ENDIF
    
    R2 = [R_BackUpCh]
    IRQ OFF
    R3 = R2 + R_ChStatus
    R1 = [R3]
    R1 &= ~(D_NoteOffFlag)
    [R3] = R1
    IRQ ON
    
    R1 = [R_MIDIData]			 //;MIDI channel
    cmp R1, 0x0009				 //;MIDI CH10 = Drum
    jne L_GetNote
    goto L_GetDrum
//==========================================================================
L_GetNote:                       //;Get a note 
	R2 = [R_BackUpCh]			 //R1 = MIDI Channel
	R3 = R2 + R_InstIndex
	[R3] = R1					 //;Backup MIDI channel number of instrument
	
	R1 = [R_MIDIStatus]
	R1 &= ~(D_UserEvent)
	[R_MIDIStatus] = R1
	
	.IF MIDI_EVENT == D_ON
	R1 = [R_MIDICtrl]
	R1 &= ~(D_MIDIEvent)
	[R_MIDICtrl] = R1	
	.ENDIF
	   
	call F_GetMIDIData   
	R2 = [R_BackUpCh]
	R1 = [R_MIDIData] 			 //;Note pitch
L_StoreNote:
	.IF MIDI_KEY_SHIFT == D_ON
	R1 += [R_KeyShift]
	.ENDIF
	
	R3 = R2 + R_Note
	[R3] = R1
	call F_GetMIDIData
	R1 = [R_MIDIData]			//;Process Velocity X Volume
	test R1, 0x0080
	jnz L_TwoByteDuration		//;Bit7 = 0, 1 Byte Duration
L_OneByteDuration:
	test R1, 0x007f
	jnz L_GO?
	R1 = 0x007f					//;Set Velocity X Volume as default value
L_GO?:
	R2 = [R_BackUpCh]
	R3 = R2 + R_VeloVol
	[R3] = R1
	
	call F_GetMIDIData
	IRQ OFF
	R1 = [R_MIDIData]
	R1 += [R_DeltaTime]
	R1 -= 1
	R3 = R2 + R_MidiDuration
	[R3] = R1
	IRQ ON
	jmp L_PlayNote	
	
L_TwoByteDuration:
	R1 &= 0x007f				//;Process Velocity X Volume
	jne L_GO?
	R1 = 0x007f					//;Set Velocity X Volume as default value
L_GO?:
	R2 = [R_BackUpCh]
	R3 = R2 + R_VeloVol
	[R3] = R1
	
	call F_GetMIDIData
	R1 = [R_MIDIData]			
	//R1 = R1 lsl 4
	//R1 = R1 lsl 4
	[R_MIDITemp] = R1			//;Backup duration high byte
	
	call F_GetMIDIData
	IRQ OFF
	R1 = [R_MIDIData]
	R1 = R1 lsl 4
	R1 = R1 lsl 4
	R1 |= [R_MIDITemp]
	R1 += [R_DeltaTime]
	R1 -= 1	
	R3 = R2 + R_MidiDuration
	[R3] = R1
	IRQ ON
	
L_PlayNote:
	//%ClearDeltaTimeFlag          //Clear flag of Delta time
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1	
	
	.IF CTRL_MIDI_CH_VOL == D_ON
    call F_CheckMIDIChVol
    .ENDIF		   
    
    .IF	OneKeyOneNote == D_ON	   
    R1 = [R_OKON_Status]
    test R1, D_OKON_ON
    jnz L_Play_OKON?
    goto L_PlayChNote
L_Play_OKON?:						//;1Key1Note process    
    R2 = [R_BackUpCh]
    R3 = R2 + R_InstIndex
    R3 = [R3]
    je L_Play_Ch0OKON				//;IF MIDI CH = 0
    retf;							//;?L_NotMainRhythmExit
L_Play_Ch0OKON:	
	.IF OKON_LongDuration == D_ON
	R3 = R2 + R_VeloVol
	R1 = [R3]
	R1 |= 0x007f
	[R3] = R1
	IRQ OFF
	R1 = 0xffff
	R3 = R2 + R_MidiDuration
	[R3] = R1
	IRQ ON
    .ENDIF		//;End duration setting
    
    R1 = [R_ChangeInstIndex]
    cmp R1, 0x00ff
    je L_NoChangeInst?
    [R_ChInst] = R1
L_NoChangeInst?:
	R1 = [R_MidiCh1NoteInSpu]
	[R_MidiCh1NoteInSpu] = R2
	R2 = R1
	call F_StopSound
	
	R1 = [R_OKON_Status]
	R1 &= ~(D_OKON_Next)
	[R_OKON_Status] = R1	
	
	R1 = [R_MIDIDPTR_BS]
	[R_GuideAddrTemp_BS] = R1
	R1 = [R_MIDIDPTR_DS]
	[R_GuideAddrTemp_DS] = R1			
	R1 = [R_MIDICtrl]
	R1 &= D_DataHLByte
	[R_GuideAddrTemp] = R1				//;backup decode address
L_CheckEndLoop:
	call F_GetMIDIData					//;Delta-time
	call F_GetMIDIData					//;Event Number
	R1 = [R_MIDIData]
	je L_Ch0Exit						//;The Note of Channel 0
	cmp R1, 0x0003
	je L_SetMIDIEnd						//;End Event
	R1 &= 0x000f
	je 	L_CheckDuration
	cmp R1, 0x0008
	je L_Jump2ByteDuration
	jmp L_Jump1ByteDuration
	//jmp L_JumpOffset
?L_PlayChNote:    
    pc = L_PlayChNote
?L_NotMainRhythmExit:
	PC = L_NotMainRhythmExit
L_CheckDuration:
	call F_GetMIDIData					//;Note Index	  
	call F_GetMIDIData					//;Bit7 = Length of duration	
	R1 = [R_MIDIData]  
	test R1, 0x0080
	jz L_Jump1ByteDuration
L_Jump2ByteDuration:	
	call F_GetMIDIData
L_Jump1ByteDuration:
	call F_GetMIDIData
	jmp L_CheckEndLoop	
L_SetMIDIEnd:	
	R1 = [R_MIDIDPTR_BS]
	R2 = [R_MIDIDPTR_DS]
	R3 = R1 - 1								//;recover address -delta time point(2 bytes)
	R4 = R2 - 0, carry						//;save the end event address to R3(BS) & R4(DS)
	R1 = [R_GuideAddrTemp_BS]
	[R_MIDIDPTR_BS] = R1
	R1 = [R_GuideAddrTemp_DS]
	[R_MIDIDPTR_DS] = R1	
	R1 = [R_MIDICtrl]
	R2 = [R_GuideAddrTemp]
	R3 = R1 & D_DataHLByte
	[R_GuideAddrTemp] = R3
	R1 &= ~(D_DataHLByte)
	R1 |= R2
	[R_MIDICtrl] = R1
	
	R1 = [R_OKON_Status]
	R1 |= D_OKON_End
	[R_OKON_Status] =R1
	jmp L_PlayChNote
L_Ch0Exit:	
	R1 = [R_GuideAddrTemp_BS]
	[R_MIDIDPTR_BS] = R1
	R1 = [R_GuideAddrTemp_DS]
	[R_MIDIDPTR_DS] = R1
	R1 = [R_MIDICtrl]
	R2 = [R_GuideAddrTemp]
	R1 &= ~(D_DataHLByte)
	R1 |= R2
	[R_MIDICtrl] = R1
    jmp L_PlayChNote
L_NotMainRhythmExit:
	retf;    
L_PlayChNote:	
    .ENDIF	//;END OKON
    
    call F_InitialADSR
    R3 = [R_BackUpCh]
    R1 = R3 + R_InstIndex
    R1 = [R1]
    R2 = R3 + R_Note
    R2 = [R2]
    R3 += R_VeloVol
    R3 = [R3]
    call F_MIDI_NoteOnEvent
    goto F_ChPlayTone            //;Play note
//==========================================================================
L_GetDrum:                      //;Get a drum    
	R1 = [R_MIDIStatus];
	R1 &= ~D_UserEvent;
	[R_MIDIStatus] = R1;
	
	.IF MIDI_EVENT == D_ON
	R1 = [R_MIDICtrl]
	R1 &= ~(D_MIDIEvent)
	[R_MIDICtrl] = R1	
	.ENDIF
	
	.IF  OneKeyOneNote == D_ON
	R1 = [R_OKON_Status]
	test R1, D_OKON_ON
	jz L_SkipNormalDrum
	 
	call F_GetMIDIData			//INDEX
	call F_GetMIDIData			//DURATION
	R1 = [R_MIDIData]			//Process Velocity X Volume
	test R1, 0x0080
	jz L_DrumOneByte?
	call F_GetMIDIData
L_DrumOneByte?:	 
	call F_GetMIDIData
L_ExitDrumPlay:	
	//%ClearDeltaTimeFlag             ;Clear flag of Delta time	 
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	retf;
	
L_SkipNormalDrum:	
	.ENDIF
	
	call F_GetMIDIData
	R1 = [R_MIDIData]
	[R_DrumIndex] = R1 			//Backup drum index
	
	call F_GetMIDIData
	R4 = [R_MIDIData]			// ;Process Velocity X Volume
	test R4, 0x0080
	jnz L_DrumTwoByteDuration
L_DrumOneByteDuration:
	cmp R4, 0x0000;
	jne ?L_GO
	R4 = 0x007F;
?L_GO:	
	R1 = [R_BackUpCh];
	R2 = R1 + R_VeloVol;
	[R2] = R4;
	
	call F_GetMIDIData
	R1 = [R_BackUpCh];
	R2 = R1 + R_MidiDuration
	R3 = [R_MIDIData];
	R3 += [R_DeltaTime]
	R3 -= 1
	IRQ OFF
	[R2] = R3;							// Process duration
	IRQ ON
	goto L_PlayDrum;

L_DrumTwoByteDuration:
	R1 = [R_BackUpCh];
	R4 &= 0x007F;					//process velocity*volume(b7=1, 2 Byte duration)...R4	
	//----- Set default velocity*volume value ----   
	cmp R4, 0x0000;
	jne ?L_GO;
	R4 = 0x007F;
?L_GO:	
	R2 = R1 + R_VeloVol;
	[R2] = R4;
	
	call F_GetMIDIData
	R2 = [R_MIDIData];
	[R_MIDITemp] = R2;
	
	call F_GetMIDIData
	R2 = R1 + R_MidiDuration	// process duration of Drum
	R3 = [R_MIDIData];
	R4 = [R_MIDITemp];
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;
	R3 += [R_DeltaTime]
	R3 -= 1	
	IRQ OFF
	[R2] = R3;
	IRQ ON

L_PlayDrum:		
	//%ClearDeltaTimeFlag             ;Clear flag of Delta time
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	
	.IF CTRL_MIDI_CH_VOL == D_ON
	R1 = [R_CtrlVolCh1ToCh16]
	test R1, D_CtrlCh10Vol
	jz L_ExitCheckCh10Vol
	R1 = [R_BackUpCh];
	R2 = R1 + R_VeloVol;
	R3 = [R2];
	R1 = [R_CtrlMIDIChVol];
	R2 = R1 + T_VolumeLevel;
	R4 = [R2];
	
	MR = R4 * R3, uu;
	
	cmp R4, 0x0000
	jne ?L_SetToMaxDrum
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	cmp R3, 0x0080
	jcs ?L_SetToMaxDrum
	R1 = [R_BackUpCh];
	R2 = R1 + R_VeloVol;
	[R2] = R3;
	goto L_ExitCheckCh10Vol
?L_SetToMaxDrum:
	R1 = [R_BackUpCh];
	R2 = R1 + R_VeloVol;
	R3 = 0x007F;
	[R2] = R3;
L_ExitCheckCh10Vol:	
	.ENDIF
	
	call F_InitialDrumADSR
	R3 = [R_BackUpCh]
    R1 = 0x0009
    R2 = 0x0000
    R3 += R_VeloVol
    R3 = [R3]
    call F_MIDI_NoteOnEvent
	goto F_PlayDrum
	
//==========================================================================
//Event 1
//==========================================================================		   
L_ProcessTempo:
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	R1 = [R_MIDIData]
	R1 = R1 lsr 4
	call F_GetMIDIData
	R1 = [R_MIDIData]
L_ExitProcessTempo:	
	retf;
	
//==========================================================================
//Event 2
//==========================================================================	
L_ProcessInst:
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	R1 = [R_MIDIData]
	R1 = R1 lsr 4
	call F_GetMIDIData
	R2 = [R_MIDIData]
	R3 = R1 + R_ChInst
	[R3] = R2
	.IF OneKeyOneNote == D_ON
	cmp R1, 0
	jne L_Ch0_Inst?
	[R_GuideChInst] = R1 			//;Save the instrument index of Ch0
L_Ch0_Inst?:	
	.ENDIF	//End OKON
L_ExitProcessInst:	
	retf;
	
//==========================================================================
//Event 3
//==========================================================================	
L_EndedCode:
	.IF REPEAT_MIDI == D_ON
	R1 = [R_RepeatMIDI]
	test R1, D_RepeatMIDI
	jnz	L_RepeatMIDIOn?
	goto F_StopMusic
L_RepeatMIDIOn?:
	R1 &= ~(D_RepeatMIDI)	
	
	R3 = R1;				// R1 = MIDI index
	R2 = seg16 (T_MIDI_Table);	// 2007.10.03 Ray
	R1 += T_MIDI_Table;		// get MIDI data address
	R2 += 0, carry;			
	R2 = R2 lsl 4;
	R2 = R2 lsl 4;
	R2 = R2 lsl 2;
	SR &= 0x03FF;
	SR |= R2;
	R1 = D:[R1];
	
	R2 = [R1++];
	[R_MIDIDPTR_BS] = R2;		// MIDI data address low word
	R1 = [R1];
	[R_MIDIDPTR_DS] = R1;		// MIDI data address high word
L_GetAddrEnd?:

	R1 = 0
L_SPU_Initial?:
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_Next?
	
	R2 = [R_SingleNote]			//Check if a single note or drum is played in this channel
	R2 |= [R_SingleDrum]
	tstb R2, R1
	jnz L_Next?
	
	R2 = 0
	R3 = R1 + R_ChTime
	[R3] = R2
	
	IRQ OFF
	R2 = [P_SPU_CH_Ctrl]
	R3 = R1 + T_ChDisableLB
	R3 = [R3]
	R2 &= R3
	[P_SPU_CH_Ctrl] = R2
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	R3 = R1 + T_ChDisableLB
	R3 = [R3]
	R2 &= R3
	[P_SPU_INT_Ctrl] = R2
	IRQ ON
	
L_Next?:
	R1 += 1	
	cmp R1, D_ChannelNo
	jb L_SPU_Initial?
	
	R1 = 0
	R2 = 0
	.IF OneKeyOneNote == D_ON
	[R_OKON_Status] = R1
	.ENDIF
	
L_DurationClr?:	
	R3 = R1 + R_MidiDuration
	[R3] = R2						//;Clear duration
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_DurationClr?
	
	[R_MainIndex] = R2				//;Used for user event
	[R_SubIndex] = R2
	IRQ OFF
	[R_DeltaTime] = R2				//;Initialize delta time
	IRQ ON
	
	.IF MIDI_EVENT == D_ON
	[R_MIDIEvent] = R2
    .ENDIF
    
    .IF MUTE_MIDI_CH == D_ON
    [R_EnCh1ToCh16] = R2
    .ENDIF
    
    .IF MIDI_KEY_SHIFT == D_ON
    [R_KeyShift] = R2
    .ENDIF
    
    .IF CTRL_MIDI_CH_VOL == D_ON
    [R_CtrlVolCh1ToCh16] = R2
	R2 = [DefaultVolumeLevel]
	[R_CtrlMIDIChVol] = R2
    .ENDIF
    
    R2 = [R_MIDICtrl]
    R2 &= ~(D_PauseMIDI + D_MIDIEvent + D_DataHLByte)
    [R_MIDICtrl] = R2	
    
    R2 = [R_MIDIStatus]
    R2 &= ~(D_DeltaTime+D_UserEvent)
    R2 |= D_MIDIEn
    [R_MIDIStatus] = R2				//;Initialize delta time


	.IF OneKeyOneNote == D_ON
	R1 = [R_OKON_Status]	
	R1 &= D_OKON_ON
	[R_OKON_Status] = R1
	.ENDIF	//;End OKON
	
	R1 = [R_MIDICtrl]
	R1 &= ~(D_PauseMIDI+D_MIDIEvent)
	[R_MIDICtrl] = R1
	
	R1 = [R_MIDIStatus]	
	R1 &= ~(D_DeltaTime+D_UserEvent)
	R1 |= D_MIDIEn
	[R_MIDIStatus] = R1	
	retf;
	.ENDIF

 _StopMusic:	
F_StopMusic:	
	.IF OneKeyOneNote == D_ON
	R1 = 0
	[R_OKON_Status] = R1
	.ENDIF	//;End OKON
	R1 = 0
L_StopSoundLoop:     	
	//.IF SPEECH == D_ON
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_ChkNextChStop         //;If Speech is playing, don't stop sound
	//.ENDIF
	
	R3 = [R_SingleNote]
	R3 |= [R_SingleDrum]
//	R2 = R1 + T_ChEnableLB
//	R2 = [R2]
//	test R3, R2
	tstb R3, R1
	jnz L_ChkNextChStop
	
	IRQ OFF
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 &= ~(D_NotePlaying+D_NoteOffFlag+D_TargetIsLastDrop+D_ReachLastDrop+D_DrumPlaying+D_AdpcmJumpPcm+D_ZCJump+D_SkipIniNoteOffEnv)
	[R2] = R3
	IRQ ON
	R2 = R1
	call F_StopSound
L_ChkNextChStop:
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_StopSoundLoop
	
	R1 = [R_MIDIStatus]
	R1 &= ~(D_MIDIEn+D_UserEvent+D_DeltaTime)
	[R_MIDIStatus] = R1
		
	R1 = [R_MIDICtrl]
	R1 &= ~(D_PauseMIDI+D_MIDIEvent)
	[R_MIDICtrl] = R1	
	
	call F_MIDIStop
	
	retf;
//==========================================================================
//Event 4
//==========================================================================
L_LongDeltaTime:
	call F_GetMIDIData
	R1 = [R_MIDIData]
	R1 = R1 lsl 4
	R1 = R1 lsl 4
	call F_GetMIDIData
	R1 = R1 | [R_MIDIData]
	IRQ OFF
	R1 = R1 + [R_DeltaTime]
	[R_DeltaTime] = R1
	IRQ ON
	retf;
	
//==========================================================================
//Event 5
//==========================================================================	
L_PitchBend:
	.IF PITCH_BEND == D_ON
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	R1 = [R_MIDIData]
	R1 = R1 lsr 4
	[R_PitchBendMidiCh] = R1
	
	call F_GetMIDIData
	R1 = [R_MIDIData]
	R1 &= 0x003f
	[R_PitchBendLevel] = R1			//;R_MIDIData = Pitch Bend Level
	cmp R1, 4
	jcc L_ExitPitchBend         	//;If R_PitchBendLevel<=3, skip pitch bend
	
	R1 = 0
L_CheckPitchBendCh:
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, D_SpeechPlaying
	jnz L_CheckNext
	R2 = R1 + R_SpuMidiCh;
	R2 = [R2];
	cmp R2, [R_PitchBendMidiCh];
	je L_GetChNoteFs           		//;If MIDI channel = Pitch Bend channel, deal with pitch bend
L_CheckNext:
	R1 += 1
	cmp R1, D_ChannelNo
	jne L_CheckPitchBendCh
	jmp L_ExitPitchBend
L_GetChNoteFs:
	R2 = R1 + R_ChNoteFs
	R4 = [R2]
	R2 = 0x003f
	R2 -= [R_PitchBendLevel]
	
	R3 = R2 + T_PitchBend
	R3 = [R3]
	MR = R4 * R3, uu;
	
	R4 = R4 lsl 4
	R4 = R4 lsl 4
	R3 = R3 lsr 4
	R3 = R3 lsr 4
	R4 += R3
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R2 += P_SPU_Ch0_SampleFreq;
	IRQ OFF
	[R2] = R4
	IRQ ON
	jmp L_CheckNext             	//;Check multi notes in one MIDI pitch bend channel
L_ExitPitchBend:	
	.ELSE
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	call F_GetMIDIData
	.ENDIF
	retf;
	
//==========================================================================
//Event 6
//==========================================================================
L_ADSRTimeBase:
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	call F_GetMIDIData
	R3 = [R_MIDIData]
//	R4 = [T_TimeBaseFactor]
//	MR = R4 * R3
	[R_ADSRTimeBase] = R3
	retf;
	
//==========================================================================
//Event 7
//==========================================================================	
L_NoteOffTimeBase:
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	call F_GetMIDIData
	R3 = [R_MIDIData]
//	R4 = [T_TimeBaseFactor]
//	MR = R4 * R3
	[R_NoteOffTimeBase] = R3
	retf;
	
//==========================================================================
//Event 8
//==========================================================================	
L_UserEvent:
	//%ClearDeltaTimeFlag
	R1 = [R_MIDIStatus]
	R1 &= ~(D_DeltaTime)
	[R_MIDIStatus] = R1
	call F_GetMIDIData
	R1 = [R_MIDIData]
	[R_MainIndex] = R1			//;Store main index of user event
	call F_GetMIDIData
	R1 = [R_MIDIData]
	[R_SubIndex] = R1			//;Store sub index of user event
	
	call F_MIDI_UserEvent
	
	retf;	
	.endp
	
//****************************************************************
// Function    : F_InitialADSR
// Description : Target and slope both need to multiply the value of "R_Velovol".
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_InitialADSR:	.proc                       
	R2 = [R_BackUpCh]
L_IniAdsrLoop:
	R1 = 0
	[R_ADSROffset] = R1
	R3 = R2 + R_TabOffset
	[R3] = R1
	R3 = R2 + R_EnvTimeBase
	[R3] = R1
	
	call F_GetAdsrValue					//;Input = R_ADSROffset; Output = R1 = Integer part of first Target
	R4 = R1 lsl 1
	R4 &= 0x00FF;
	R5 = [R_BackUpCh]
	R3 = R5 + R_VeloVol
	R3 = [R3]
	MR = R4 * R3, uu;					// ADSR * velovol * 2
	R2 = R5 + R_Volume
	[R2] = R3
	
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	R1 += 1;
	R2 += 0, carry;
	
	DS = R2;
	R3 = D:[R1];			// high byte of Slope(A~B)
	test R3, 0x0080;
	jnz L_IniSlopeMinus
L_IniSlopePlus: 
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// low byte of Slope(A~B)
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;				// Slope
	
	R4 = R5 + R_VeloVol;	// MIDI data veloVol
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	
	MR = R3 * R4, uu;		// Slope * velovol * 2, (16-bit * 8-bit)
	
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 += R3;				// added by Ray 2006.05.17
	jnz L_Branch?
	R4 = 0x0001;			//;If slop is zero, set "01H" as minimum value
L_Branch?:
	R3 = R5 + R_Slope;
	[R3] = R4;
	goto  L_GetInitialTarget	
	
L_IniSlopeMinus:			//;Jump here if slope is minus
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// low byte of Slope(A~B)
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;				// slope
	R3 ^= 0xFFFF;
	R3 += 1;
	
	R4 = R5 + R_VeloVol;
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	
	MR = R3 * R4, uu;		// Slope * velovol * 2, (16-bit * 8-bit)

	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 += R3;				// get high byte of R3 + low byte of R4
	R4 ^= 0xFFFF;
	R4 += 1;	

	jnz ?L_UpdateSlope;
	R4 = 0xFFFF;
?L_UpdateSlope:
	R3 = R5 + R_Slope;
	[R3] = R4;	

L_GetInitialTarget:
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];		// target point
//-------- ADSR*(ChVol*Velocity) ----- 
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	R3 = R5 + R_VeloVol;
	R3 = [R3];

	MR = R4 * R3, uu;			// ADSR * velovol * 2

	R4 = R5 + R_Target;
	[R4] = R3;
	
	IRQ OFF
	R4 = R5 + R_ChStatus
	R1 = [R4]
	R1 &= ~(D_TargetIsLastDrop+D_ReachLastDrop+D_DrumPlaying+D_NoteOffFlag+D_SkipIniNoteOffEnv+D_AdpcmJumpPcm+D_ZCJump)
	[R4] = R1
 	IRQ ON

	retf;
	.endp
	
//****************************************************************
// Function    : F_InitialDrumADSR
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_InitialDrumADSR:	.proc          
	R2 = [R_BackUpCh]
L_IniDrumAdsrLoop:
	R1 = 0						//;Offset (first)
	[R_ADSROffset] = R1
	R3 = R2 + R_TabOffset		//;Initialize table offset
	[R3] = R1
	R3 = R2 + R_EnvTimeBase
	[R3] = R1
	
	R1 = [R_DrumIndex]
	call F_GetDrumAdsrValue
	R4 = R1 lsl 1
	R4 &= 0x00FF;
	R5 = [R_BackUpCh]
	R3 = R5 + R_VeloVol
	R3 = [R3]
	MR = R4 * R3, uu;					// ADSR * velovol * 2
	R2 = R5 + R_Volume
	[R2] = R3
	
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	R1 += 1;
	R2 += 0, carry;	
		
	DS = R2;
	R3 = D:[R1];			// high byte of Slope(A~B)
	test R3, 0x0080;
	jnz L_IniDrumSlopeMinus
L_IniDrumSlopePlus: 
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// low byte of Slope(A~B)
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;				// Slope
	
	R4 = R5 + R_VeloVol;	// MIDI data veloVol
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	
	MR = R3 * R4, uu;		// Slope * velovol * 2, (16-bit * 8-bit)
	
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 += R3;				// added by Ray 2006.05.17
	jnz L_Branch?
	R4 = 0x0001;			//;If slop is zero, set "01H" as minimum value
L_Branch?:
	R3 = R5 + R_Slope;
	[R3] = R4;
	goto  L_GetDrumInitialTarget	
	
L_IniDrumSlopeMinus:			//;Jump here if slope is minus
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// low byte of Slope(A~B)
	R3 = R3 lsl 4;
	R3 = R3 lsl 4;
	R3 |= R4;				// slope
	R3 ^= 0xFFFF;
	R3 += 1;
	
	R4 = R5 + R_VeloVol;
	R4 = [R4];
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	
	MR = R3 * R4, uu;		// Slope * velovol * 2, (16-bit * 8-bit)

	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R4 = R4 lsl 4;
	R4 = R4 lsl 4;
	R4 += R3;				// get high byte of R3 + low byte of R4
	R4 ^= 0xFFFF;
	R4 += 1;	

	jnz ?L_UpdateSlope;
	R4 = 0xFFFF;
?L_UpdateSlope:
	R3 = R5 + R_Slope;
	[R3] = R4;	

L_GetDrumInitialTarget:
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];		// target point
//-------- ADSR*(ChVol*Velocity) ----- 
	R4 = R4 lsl 1;
	R4 &= 0x00FF;
	R3 = R5 + R_VeloVol;
	R3 = [R3];

	MR = R4 * R3, uu;			// ADSR * velovol * 2

	R4 = R5 + R_Target;
	[R4] = R3;
	
	IRQ OFF
	R4 = R5 + R_ChStatus
	R1 = [R4]
	R1 &= ~(D_TargetIsLastDrop+D_ReachLastDrop+D_NotePlaying+D_NoteOffFlag+D_SkipIniNoteOffEnv+D_AdpcmJumpPcm+D_ZCJump)
	[R4] = R1
 	IRQ ON

	retf;
	.endp
	
//****************************************************************
// Function    : F_GetAdsrValue
// Description : 
// Destory     : 
// Parameter   : Input = R_ADSROffset
// Return      : Output = R1
// Note        : 
//****************************************************************	
F_GetAdsrValue:	.proc
	call F_GetInstAddr           //;R_InstAddr : Low address, R_InstAddr+1 : High address
	
	R1 = [R_InstAddr_BS];
	R2 = [R_InstAddr_DS];
	R1 += 3;
	R2 += 0, carry;

	DS = R2;
	//R3 = D:[R1++];
	//R4 = D:[R1];				//address of instrument table
	R3 = D:[R1];
	R1 += 1
	R2 += 0, CARRY
	DS = R2;
	R4 = D:[R1];	
	
	DS = R4;
	//R1 = D:[R3++];
	//R2 = D:[R3];				//address of envelope table
	R1 = D:[R3];
	R3 += 1
	R4 += 0, CARRY
	DS = R4;
	R2 = D:[R3];	
	
	R3 = [R_ADSROffset]
	R1 += R3
	R2 += 0, carry;
	[R_InstAddr_BS] = R1
	[R_InstAddr_DS] = R2
	
	DS = R2;
	R1 = D:[R1];				// Get ADSR value !!
	retf;
	.endp
	
//****************************************************************
// Function    : F_GetInstAddr
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_GetInstAddr:	.proc           //;R_InstAddr = Low address, R_InstAddr+1 = High address 
	push R1, R4 to [SP];
	//R2 = [R_BackUpCh]
	R3 = R2 + R_Note
	R3 = [R3]					//;Note pitch
	[R_MIDITemp] = R3
	R3 = R2 + R_InstIndex
	R2 = [R3] 					//;Get the MIDI channel of current SPU channel
	R3 = R2 + R_ChInst
	R2 = [R3] 					//;Get instrument index for this MIDI channel
	R2 = R2 lsl 1
	R4 = seg16 (T_Instruments);	
	R3 = R2 + T_Instruments;
	R4 += 0, carry
	DS = R4
	//R1 = D:[R3++]
	//R2 = D:[R3]
	R1 = D:[R3]
	R3 += 1
	R4 += 0, CARRY
	DS = R4
	R2 = D:[R3]
L_GetMaxPitch:
	DS = R2
	R4 = D:[R1]					//;Get Max Pitch of searched instrument
	je L_IsEnd                  //;If instrument table content is 0, exit
	cmp R4, [R_MIDITemp]		//;Compare with note pitch
	jcs L_IsEnd					//;If max pitch >= note pitch, get it
	R1 += 5
	R2 += 0, carry
	jmp L_GetMaxPitch
L_IsEnd:
	[R_InstAddr_BS] = R1
	[R_InstAddr_DS] = R2	
	pop R1, R4 from [SP];	
	retf;
	.endp	
	
//****************************************************************
// Function    : F_GetInstAddrIRQ
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_GetInstAddrIRQ:	.proc           //;R_InstAddr = Low address, R_InstAddr+1 = High address 
	push R3, R4 to [SP];
	//R2 = [R_BackUpCh]
	R3 = R2 + R_Note
	R3 = [R3]					//;Note pitch
	[R_MIDITempIRQ] = R3
	R3 = R2 + R_InstIndex
	R2 = [R3] 					//;Get the MIDI channel of current SPU channel
	R3 = R2 + R_ChInst
	R2 = [R3] 					//;Get instrument index for this MIDI channel
	R2 = R2 lsl 1
	R4 = seg16 (T_Instruments);	
	R3 = R2 + T_Instruments;
	R4 += 0, carry
	DS = R4
	R1 = D:[R3++]
	R2 = D:[R3]
L_GetMaxPitch?:
	DS = R2
	R4 = D:[R1]					//;Get Max Pitch of searched instrument
	je L_IsEnd?                  //;If instrument table content is 0, exit
	cmp R4, [R_MIDITempIRQ]		//;Compare with note pitch
	jcs L_IsEnd?					//;If max pitch >= note pitch, get it
	R1 += 5
	R2 += 0, carry
	jmp L_GetMaxPitch?
L_IsEnd?:
//	[R_InstAddr_BS] = R1
//	[R_InstAddr_DS] = R2	
	pop R3, R4 from [SP];	
	retf;
	.endp	
	
//****************************************************************
// Function    : F_GetDrumAdsrValue
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_GetDrumAdsrValue:	.proc
	R1 = R1 lsl 1;
	R3 = seg T_DrumInst;
	R2 = R1 + T_DrumInst;
	R3 += 0, carry;
	DS = R3;
	R1 = D:[R2++];
	R2 = D:[R2];

	R1 += 3;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];
	
//	[R_InstAddr_BS] = R1;
//	[R_InstAddr_DS] = R2;
	
	[R_InstAddr_BS] = R3;
	[R_InstAddr_DS] = R4;
	
	R1 = [R_ADSROffset];
	R3 += R1;
	R4 += 0, carry;

	DS = R4;
	R1 = D:[R3];
	retf;
	.endp
	
//****************************************************************
// Function    : F_SpuIrqMIDIService
// Description : Set the parameters of next sample (put in V_IRQ_SPU)
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
_SpuIrqMIDIService: 	.proc
F_SpuIrqMIDIService:
	R1 = [R_MIDIStatus]
	test R1, D_MIDIEn
	jnz L_GO?
	R1 = [R_SingleNote]
	R1 |= [R_SingleDrum]
	jne L_GO?
	retf;
L_GO?:
	R2 = [P_SPU_INT_Ctrl] 
	R2 &= [P_SPU_INT_Status]
	
//	R1 = [P_SPU_CH_Ctrl]
//	R1 ^= R2
//	[P_SPU_CH_Ctrl] = R1

	R1 = 0x0000;
?L_CheckChIRQLoop:
	tstb R2, R1;
	jz ?L_NextChIRQ;
	[R_BackUpChIRQ] = R1;
	call F_SetMIDIIrqPara;
?L_NextChIRQ:
	R1 += 1;
	cmp R1, D_ChannelNo;
	jne ?L_CheckChIRQLoop
?L_ExitSpuIrqMIDIService:
	retf;
	.endp	
	
//****************************************************************
// Function    : F_SetMIDIIrqPara
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_SetMIDIIrqPara: 	.proc
	push R1, R5 to [SP];
	//.IF SPEECH = ON
	R4 = R1 + R_ChSpeechStatus
	R4 = [R4]
	test R4, D_SpeechPlaying
	je  L_GoChkMidiIrqFlag
	goto L_ExitSetMIDIIrqPara
	//.ENDIF
L_GoChkMidiIrqFlag:
	R2 = R1 + R_ChStatus
	R2 = [R2]
	test R2, D_DrumPlaying		//;Check if drum is played
	jz L_GoOn?
	goto L_GoChkDrumIrqFlag
//==========================================================================
//Play instrument
//==========================================================================
L_GoOn?:	
 	test R2, D_ZCJump               //;Check concatenate jump mode
	jz 	L_?
	goto L_InstZCJumpIRQ	
L_?:
	
	R3 = P_SPU_INT_Ctrl
	clrb [R3], R1 					//;Disable channel IRQ
	R3 = 0x0000
	setb R3, R1
	[P_SPU_INT_Status] = R3			//;Clear INT status
	goto L_ExitSetMIDIIrqPara	
	
L_InstZCJumpIRQ:
	R2 = [R_BackUpChIRQ]
	call F_GetInstAddrIRQ           	//;Get instrument address
	R1 += 1
	R2 += 0, carry
	DS = R2
	R4 = D:[R1]							//;Base Pitch - Note Pitch
	cmp R4, [R_MIDITempIRQ]				
	jb L_BaseIsSmall?					//;If overflow, Base is smaller than Note
L_BaseIsLarge?:                          //;Note is smaller than Base	
	R4 -= [R_MIDITempIRQ];
	[R_MIDITempIRQ] = R4;
	
	R3 = D_PhaseIndexOffset;
	R4 = seg16 (D_PhaseIndexOffset);
	
	DS = R4;
	R4 = D:[R3];
	R4 &= 0x00FF;			// Get low byte, because offset is not so large
	R4 -= [R_MIDITempIRQ];
	[R_MIDITempIRQ] = R4;		// Offset(Get Phase Adder value) = D_PhaseIndexOffset - difference
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];			// get sample rate index of T_SampleRate or T_SampleRateBase
	R3 = R3 lsl 1;
	
	R4 = seg16 (T_SampleRate);
	DS = R4
	R4 = R3 + T_SampleRate;
	R3 = D:[R4++];
	R4 = D:[R4];
	jmp L_UpdateNoteFs?;
L_BaseIsSmall?:
	R3 = [R_MIDITempIRQ];
	R3 -= R4;				// difference = Current Note - Base
	[R_MIDITempIRQ] = R3;	// Offset = difference
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];			// get sample rate index of T_SampleRate or T_SampleRateBase
	R3 = R3 lsl 1;
	R4 = seg16 (T_SampleRateBase);
	DS = R4
	R4 = R3 + T_SampleRateBase;
	R3 = D:[R4++];
	R4 = D:[R4];    
L_UpdateNoteFs?:
	R5 = [R_MIDITempIRQ];
	R3 += R5;
	R4 += 0, carry;
	DS = R4;
	R5 = D:[R3];			// sampling rate
L_UpdateFs?:		
	R3 = [R_BackUpChIRQ]
	R3 = R3 lsl 4
	R4 = R3 + P_SPU_Ch0_SampleFreq
	[R4] = R5
	
	.IF PITCH_BEND == D_ON
	R4 = [R_BackUpChIRQ]
	R4 += R_ChNoteFs
	[R4] = R5
    .ENDIF

L_SetChPara?:    
//	R5 = 0x0000;
//	R4 = R3 + P_SPU_Ch0_LoopLength;	
//	[R4] = R5;
//	R4 = R3 + P_SPU_Ch0_Filter_S1;		// Set S1,S2=0 to avoid noise
//	[R4] = R5;
//	R4 = R3 + P_SPU_Ch0_Filter_S2;
//	[R4] = R5;
//	R4 = R3 + P_SPU_Ch0_PhaseAdder
//	[R4] = R5;
//	
//	/////////////////////////////////////////////////SPU Check
//	[R_SPU_LoopLengthIRQ] = R5
//	[R_SPU_S2IRQ] = R5
//	[R_SPU_S1IRQ] = R5
//	/////////////////////////////////////////////////
	
L_Attack_Loop_M?:	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];			// get ADSR table address low word
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];			// get ADSR tabel address high word
	
	R3 += 4;
	R4 += 0, carry;
?L_SetDPTNBAddr:
	DS = R4;
	R1 = D:[R3];			//High word
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			//Low word
	
	R5 = R1 & 0xc000
	R1 = R1 & 0x0fff
    R2 += R2
    R1 += R1, carry
    R2 -= (0x0001)
    R1 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeaderN?
    R2 += 0xa
    R1 += 0, carry
L_NoHeaderN?:    
    R1 |= R5
    R1 |= 0x2000
    
    R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R5 = D:[R3];			//Loop Length
	
	R2 -= R5
	R1 -= 0, carry

L_Loop?:    
	R5 = [R_BackUpChIRQ]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_NextDPTR_H;	
	[R5] = R1
	
	R5 = [R_BackUpChIRQ]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_NextDPTR_L;	
	[R5] = R2
	
	
	R1 = [R_BackUpChIRQ]
	R1 = R1 lsl 4
	R2 = R1 + P_SPU_Ch0_Volume_Ctrl
	R1 = [R2]
	//R1 |= 0x8080
	[R2] = R1
	
	R1 = [R_BackUpChIRQ];
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= D_NotePlaying
	R3 &= ~(D_ZCJump+D_AdpcmJumpPcm+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3						//;Clear note off flag
	
	R2 = P_SPU_INT_Ctrl
	clrb [R2], R1					//;Disable channel IRQ
	R2 = 0
	setb R2, R1
	[P_SPU_INT_Status] = R2
	
	/////////////////////////////////////////////////SPU Check
	//call F_SPURAMCheck
	//call F_SPURAMCheck_2
	//call F_SPURAMCheck_2CIRQ
	/////////////////////////////////////////////////
	goto L_ExitSetMIDIIrqPara
//==========================================================================
//Play drum
//==========================================================================
L_GoChkDrumIrqFlag:	
	R1 = [R_BackUpChIRQ]
	R2 = R1 + R_ChStatus
	R2 = [R2]
	test R2, D_ZCJump
	jnz L_DrumZCJumpIRQ?
L_ExitIrq?:
	R3 = P_SPU_INT_Ctrl
	clrb [R3], R1
	R3 = 0
	setb R3, R1
	[P_SPU_INT_Status] = R3
	goto L_ExitSetMIDIIrqPara	
	
L_DrumZCJumpIRQ?:	
	R1 = [R_DrumIndex]
	R1 = R1 lsl 1
	R4 = seg T_DrumInst;
	R3 = R1 + T_DrumInst;
	R4 += 0, carry;
	DS = R4;
	R1 = D:[R3];
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];
	
	DS = R2;
	R3 = D:[R1]
	
	R3 = R3 lsl 1;
	R4 = seg16 (T_SampleRateBase);
	DS = R4
	R4 = R3 + T_SampleRateBase;
	R3 = D:[R4++];
	R4 = D:[R4];    
	
//	push R3, R4 to [sp]
//	R3 = [R_BackUpCh]
//	R3 = R3 lsl 4
//	R5 = 0x0000;
//	R4 = R3 + P_SPU_Ch0_Filter_S1;		// Set S1,S2=0 to avoid noise
//	[R4] = R5;
//	R4 = R3 + P_SPU_Ch0_Filter_S2;
//	[R4] = R5;
//	R4 = R3 + P_SPU_Ch0_PhaseAdder
//	[R4] = R5;
//	pop R3, R4 from [sp]
//	
//	/////////////////////////////////////////////////SPU Check
//	[R_SPU_LoopLengthIRQ] = R5
//	[R_SPU_S2IRQ] = R5
//	[R_SPU_S1IRQ] = R5
//	/////////////////////////////////////////////////
	
	DS = R4
	R3 = D:[R3]				//sampling rate
	R4 = [R_BackUpChIRQ]
	R5 = R4 lsl 4
	R5 += P_SPU_Ch0_SampleFreq
	[R5] = R3

	
	.IF PITCH_BEND == D_ON
    R5 = R4 + R_ChNoteFs
    [R5] = R3
    .ENDIF 
	
//==========================================================================
//Attack + Loop
//==========================================================================	
	R1 += 7;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];			// get address of Loop high word
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// get address of Loop low word
	
	R5 = R3 & 0xc000
	R3 = R3 & 0x0fff
    R4 += R4
    R3 += R3, carry
    R4 -= (0x0001)	
    R3 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeaderN?
    R4 += 0xa
    R3 += 0, carry
L_NoHeaderN?:    
    R3 |= R5
    
    R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R5 = D:[R1];			//Loop Length
	
	R4 -= R5
	R3 -= 0, carry
    
    R1 = [R_BackUpChIRQ]
    R2 = R1 lsl 4
	R5 = R2 + P_SPU_Ch0_NextDPTR_H
	[R5] = R3

	R5 = R2 + P_SPU_Ch0_NextDPTR_L
	[R5] = R4
	
	
	R3 = [R_BackUpChIRQ]
	R3 = R3 lsl 4
	R4 = R3 + P_SPU_Ch0_Volume_Ctrl
	R3 = [R4]
	//R3 |= 0x8080
	[R4] = R3
	
L_Loop?:	
	R1 += R_ChStatus
	R2 = [R1]
	R2 &= ~(D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag+D_ZCJump)
	R2 |= D_DrumPlaying
	[R1] = R2
	
	R5 = [R_BackUpChIRQ]
	R1 = P_SPU_INT_Ctrl
	clrb [R1], R5
	R1 = 0
	setb R1, R5
	[P_SPU_INT_Status] = R1
	
L_ExitSetMIDIIrqPara:
	pop R1, R5 from [SP];	
	retf;
	.endp	
.comment @	
//==========================================================================
//ADPCM jump to PCM
//==========================================================================
L_AdpcmJumpPcmIRQ:	
	R1 = [R_BackUpChIRQ];
	
	R2 = R1 + R_Note;
	R5 = [R2];
	
	R2 = R1 + R_InstIndex;	// Max value of R_InstIndex can't over 16...R3
	R3 = [R2];
	R2 = R3 + R_ChInst;	// Get instrument index!...R4
	R4 = [R2];
	R4 = R4 lsl 1;
	R1 = seg T_Instruments;
	R2 = R4 + T_Instruments;
	R1 += 0, carry;
	DS = R1					// ISA1.3 and above
	R1 = D:[R2++];
	R2 = D:[R2];
L_GetMaxPitch?:
	DS = R2;
	R4 = D:[R1];			// Get Max Pitch of searched instrument!...R4
	jz L_IsEndIRQ?          //;If instrument table content is 0, exit
	cmp R4, R5;				// Compare with current note!
	jcs L_IsEndIRQ?   		// If max pitch > or = note pitch, get it!
	R1 += 5
	R2 += 0, carry;
	jmp L_GetMaxPitch?
L_IsEndIRQ?:	
	R1 += 3;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];
//	[R_AddrLow] = R3;			//;Get instrument table address BS
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];
//	[R_AddrHigh] = R4;			//;Get instrument table address DS
		
//==========================================================================================================	
	R3 += 4;
	R4 += 0, carry;		
		
	DS = R4;
	R2 = D:[R3]					//; DS of loop	
	
	R1 = [R_BackUpChIRQ];
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_DPTR_H
	[R1] = R2
	
	R3 += 1;
	R4 += 0, carry;	
	
	DS = R4;
	R2 = D:[R3]					//; BS of loop	
	
	R1 = [R_BackUpChIRQ];
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_DPTR_L
	[R1] = R2
	
	R3 += 1;
	R4 += 0, carry;	
	
	DS = R4;
	R2 = D:[R3]					//;Get loop length
	
	R1 = [R_BackUpChIRQ]	
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_LoopLength
	[R1] = R2	
	
	R1 = [R_BackUpChIRQ]	
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 &= ~(D_AdpcmJumpPcm) 	
	[R2] = R3
	
	R3 = [R_BackUpChIRQ]
	R1 = [P_SPU_INT_Ctrl]
	R1 &= 0x00ff
	clrb R1, R3 					//;Disable channel IRQ
	R2 = R3 + 0x0008
	setb R1, R2						//;Clear INT status
	[P_SPU_INT_Ctrl] = R1
	goto L_ExitSetMIDIIrqPara		
		
//==========================================================================
//Concatenate jump mode
//==========================================================================		
L_InstZCJumpIRQ:
	R1 = [R_BackUpChIRQ]
	R2 = R1 + R_Note;
	R5 = [R2];
	
	R2 = R1 + R_InstIndex;	// ;Get the MIDI channel of current SPU channel
	R3 = [R2];
	R2 = R3 + R_ChInst;	// Get instrument index!...R4
	R4 = [R2];
	R4 = R4 lsl 1;
	R1 = seg T_Instruments;	// Get Instrument AddrB
	R2 = R4 + T_Instruments;
	R1 += 0, carry;
	DS = R1
	R1 = D:[R2++];
	R2 = D:[R2];
	
L_GetMaxPitch?:
	DS = R2;
	R4 = D:[R1];			// Get Max Pitch of searched instrument!...R4
	jz ?L_IsEndIRQ			// If instrument table content is 0, Exit! 
	cmp R4, R5;				// Compare with current note!
	jcs ?L_IsEndIRQ			// If max pitch > or = note pitch, get it!
	R1 += 5;
	R2 += 0, carry;
	jmp L_GetMaxPitch?
?L_IsEndIRQ:
//==========================================================================================================
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];				// Get Base pitch in section table!
	R4 = R3;
	R4 = R4 - R5;				// R5 is current Note
								// Compare Base-MIDI number(Base freq - Note), difference = Base - Current Note
	jpl L_BaseIsLargeIRQ		// If overflow(Base-Note),Base is Smaller than Note!
L_BaseIsSmallIRQ:	
	R5 -= R3;				// difference = Current Note - Base
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];				// Get table index of sample rate Base!(T_ToneFreq_End)
	R3 = R3 lsl 1;
	R4 = seg T_SampleRateBase;
	DS = R4
	R4 = R3 + T_SampleRateBase;
	
	R3 = D:[R4++];
	R4 = D:[R4];
	
	R3 += R5;
	R4 += 0, carry;

	DS = R4;
	R3 = D:[R3];
	
	R5 = [R_BackUpChIRQ]
//	R5 += T_ChMap
//	R5 = [R5]
	R5 = R5 lsl 4
	R4 = R5 + P_SPU_Ch0_SampleFreq;
	[R4] = R3;			// low byte
	
	.IF PITCH_BEND == D_ON
	R4 = [R_BackUpChIRQ]
	R4 += R_ChNoteFs
	[R4] = R3
	.ENDIF
	goto L_SetChParaIRQ
	
L_BaseIsLargeIRQ:
	R3 = seg D_PhaseIndexOffset;
	DS = R3
	R3 = D_PhaseIndexOffset;
	R5 = D:[R3];
	R5 &= 0x00FF;				// Get low byte, because offset is not so large
	R5 -= R4;
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];				// Get table index of sample rate!(T_ToneFreq)
	R3 = R3 lsl 1;
	R4 = seg T_SampleRate;
	DS = R4
	R4 = R3 + T_SampleRate;
	
	R3 = D:[R4++];
	R4 = D:[R4];
	
	R3 += R5;
	R4 += 0, carry;

	DS = R4;
	R3 = D:[R3];
	
	R5 = [R_BackUpChIRQ]
//	R5 += T_ChMap
//	R5 = [R5]
	R5 = R5 lsl 4
	R4 = R5 + P_SPU_Ch0_SampleFreq;
	[R4] = R3;			// low byte
	
	.IF PITCH_BEND == D_ON
	R4 = [R_BackUpChIRQ]
	R4 += R_ChNoteFs
	[R4] = R3
	.ENDIF
	
L_SetChParaIRQ:	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];			//;Get instrument table address BS
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];			//;Get instrument table address HB
	
	R3 += 2;
	R4 += 0, carry;
	
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Attack
	test R2, 0x8000;
	jnz L_AttackIsPCM
L_AttackIsADPCM:
	R3 += 2;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	test R2, 0x8000;
	jz L_BothADPCM_ZCIrq?
	goto L_ADPCM_PCM_ZCIrq	
L_BothADPCM_ZCIrq?:
	goto L_BothADPCM_ZCIrq	
L_AttackIsPCM:
	R3 += 2;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	test R2, 0x8000;
	jz L_PCM_ADPCM_ZCIrq
	goto L_BothPCM_ZCIrq	
//==========================================================================
//Attack(PCM) + Loop(ADPCM)
//==========================================================================
L_PCM_ADPCM_ZCIrq:	
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_H
	[R1] = R2
	
	R3 += 1;
	R4 += 0, carry;

	DS = R4;
	R2 = D:[R3];			// Get High and Low address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_L
	[R1] = R2
	
	R1 = [R_BackUpChIRQ];
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= D_NotePlaying
	R3 &= ~(D_ZCJump+D_AdpcmJumpPcm+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3
	
	R1 = [R_BackUpChIRQ];
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2 
	[P_SPU_INT_Ctrl] = R4
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	setb [R3], 7			//;Set as absolute jump mode
	clrb [R3], 15			//;Set as relative jump mode
	goto L_ExitSetMIDIIrqPara
		
//==========================================================================
//Attack(ADPCM) + Loop(ADPCM)
//==========================================================================
L_BothADPCM_ZCIrq:	
	R1 = [R_BackUpChIRQ]	
	R2 = R1 + R_ChStatus;
	R3 = [R2];	
	R3 |= D_NotePlaying
	R3 &= ~(D_ZCJump+D_AdpcmJumpPcm+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	clrb [R3], 7
	clrb [R3], 15
//	R4 = [R3]
//	R4 &= ~0x0080			//;Set as relative jump mode
//	R4 &= ~0x8000			//;Set as relative jump mode
//	[R3] = R4
	goto L_ExitSetMIDIIrqPara
		
//==========================================================================
//Attack(PCM) + Loop(PCM)
//==========================================================================
L_BothPCM_ZCIrq:	
	R3 += 2;
	R4 += 0, carry;

	DS = R4;
	R2 = D:[R3];			// Get Loop length
	
	R1 = [R_BackUpChIRQ]	
//	R3 = R1 + T_ChMap
//	R3 = [R3]
	R3 = R1 lsl 4
	R3 += P_SPU_Ch0_LoopLength
	[R3] = R2
	
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_NotePlaying
	R3 &= ~(D_ZCJump+D_AdpcmJumpPcm+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3	
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	clrb [R3], 7
	clrb [R3], 15
//	R4 = [R3]
//	R4 &= ~0x0080			//;Set as relative jump mode
//	R4 &= ~0x8000			//;Set as relative jump mode
//	[R3] = R4
	goto L_ExitSetMIDIIrqPara
		
//==========================================================================
//Attack(ADPCM) + Loop(PCM)
//==========================================================================
L_ADPCM_PCM_ZCIrq:	
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_H
	[R1] = R2
	
	R3 += 1;
	R4 += 0, carry;

	DS = R4;
	R2 = D:[R3];			// Get High and Low address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_L
	[R1] = R2	
	
	R1 = [R_BackUpChIRQ]
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_AdpcmJumpPcm+D_NotePlaying
	R3 &= ~(D_ZCJump+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	R2 = R1 + T_ChEnableHB
	R2 = [R2]
	R4 |= R2	
	[P_SPU_INT_Ctrl] = R4	
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	R4 = [R3]
	R4 |= 0x0080			//;Set as absolute jump mode
	R4 &= ~0x8000			//;Set as relative jump mode
	[R3] = R4
	goto L_ExitSetMIDIIrqPara
	
//==========================================================================
//Play drum
//==========================================================================
L_GoChkDrumIrqFlag:	
	R1 = [R_BackUpChIRQ]
	R2 = R1 + R_ChStatus
	R2 = [R2]
	test R2, D_ZCJump
	jnz L_DrumZCJumpIRQ?
	test R2, D_AdpcmJumpPcm
	jz L_ExitIrq?
	goto L_AdpcmJumpPcmIRQ_D
L_DrumZCJumpIRQ?:
	goto L_DrumZCJumpIRQ	
L_ExitIrq?:
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	goto L_ExitSetMIDIIrqPara	
//==========================================================================
//ADPCM jump to PCM
//==========================================================================
L_AdpcmJumpPcmIRQ_D:	
	R2 = R1 + R_ChDrumIndex;	//	R1 = [R_ChIndex];
	R1 = [R2];					// Get Drum Inst. Index
	R1 = R1 lsl 1;
	R4 = seg T_DrumInst;
	R2 = R1 + T_DrumInst;
	R4 += 0, carry;
	DS = R4
	R3 = D:[R2++];				// Get address of Drum Inst.
	R4 = D:[R2];
	
	R3 += 9
	R4 += 0, carry
	
	DS = R4
	R2 = D:[R3];				// Get Loop length
    
    R1 = [R_BackUpChIRQ]
//    R3 = R1 + T_ChMap
//    R3 = [R3]
	R3 = R1 lsl 4
    R3 += P_SPU_Ch0_LoopLength
    [R3] = R2
    
    R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_DrumPlaying
	R3 &= ~(D_ZCJump+D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag)
	[R2] = R3
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	
	goto L_ExitSetMIDIIrqPara
		
//==========================================================================
//Concatenate jump mode
//==========================================================================
L_DrumZCJumpIRQ:		
	R2 = R1 + R_ChDrumIndex;	//	R1 = [R_ChIndex];
	R1 = [R2];					// Get Drum Inst. Index
	R1 = R1 lsl 1;
	R4 = seg T_DrumInst;
	R2 = R1 + T_DrumInst;
	R4 += 0, carry;
	DS = R4
	R3 = D:[R2++];				// Get address of Drum Inst.
	R4 = D:[R2];
	
	DS = R4
	R2 = D:[R3];				// Get index of sampling rate table
		
	R2 = R2 lsl 1;
    R1 = seg T_SampleRateBase;
	DS = R1;
	R2 = R2 + T_SampleRateBase;
	R1 = D:[R2++];
	R2 = D:[R2];

	DS = R2;
	R2 = D:[R1];				// Get Sample rate value	
		
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_SampleFreq
	[R1] = R2	
		
	.IF PITCH_BEND == D_ON	
	R1 = [R_BackUpChIRQ]
	R1 += R_ChNoteFs
	[R1] = R2
	.ENDIF
	
L_ChkDrumModeInZCIrq:	
	R3 += 1;
	R4 += 0, carry;	
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Attack
	test R2, 0x8000;
	jnz L_AttackIsPCM_D
L_AttackIsADPCM_D:
	R3 += 6;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	test R2, 0x8000;
	jz L_BothADPCM_ZCIrq_D?
	goto L_ADPCM_PCM_ZCIrq_D
L_BothADPCM_ZCIrq_D?:
	goto L_BothADPCM_ZCIrq_D
L_AttackIsPCM_D:		
	R3 += 6;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	test R2, 0x8000;
	jz L_PCM_ADPCM_ZCIrq_D
	goto L_BothPCM_ZCIrq_D
//==========================================================================
//Attack(PCM) + Loop(ADPCM)
//==========================================================================
L_PCM_ADPCM_ZCIrq_D:	
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_H
	[R1] = R2
	
	R3 += 1;
	R4 += 0, carry;

	DS = R4;
	R2 = D:[R3];			// Get High and Low address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_L
	[R1] = R2
	
	R1 = [R_BackUpChIRQ];
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= D_DrumPlaying
	R3 &= ~(D_ZCJump+D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag)
	[R2] = R3
	
	R1 = [R_BackUpChIRQ];
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	setb [R3], 7			//;Set as absolute jump mode
	clrb [R3], 15			//;Set as relative jump mode
//	R4 = [R3]
//	R4 |= 0x0080			//;Set as absolute jump mode
//	R4 &= ~0x8000			//;Set as relative jump mode
//	[R3] = R4
	goto L_ExitSetMIDIIrqPara
//==========================================================================
//Attack(ADPCM) + Loop(ADPCM)
//==========================================================================
L_BothADPCM_ZCIrq_D:	
	R1 = [R_BackUpChIRQ]	
	R2 = R1 + R_ChStatus;
	R3 = [R2];	
	R3 |= D_DrumPlaying
	R3 &= ~(D_ZCJump+D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag)
	[R2] = R3
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	clrb [R3], 7			//;Set as relative jump mode
	clrb [R3], 15			//;Set as relative jump mode
//	R4 = [R3]
//	R4 &= ~0x0080			//;Set as relative jump mode
//	R4 &= ~0x8000			//;Set as relative jump mode
//	[R3] = R4
	goto L_ExitSetMIDIIrqPara
//==========================================================================
//Attack(PCM) + Loop(PCM)
//==========================================================================
L_BothPCM_ZCIrq_D:	
	R3 += 2;
	R4 += 0, carry;

	DS = R4;
	R2 = D:[R3];			// Get Loop length
	
	R1 = [R_BackUpChIRQ]	
//	R3 = R1 + T_ChMap
//	R3 = [R3]
	R3 = R1 lsl 4
	R3 += P_SPU_Ch0_LoopLength
	[R3] = R2
	
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_DrumPlaying
	R3 &= ~(D_ZCJump+D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag)
	[R2] = R3	
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	clrb R4, R1
	R2 = R1 + 0x0008
	setb R4, R2
	[P_SPU_INT_Ctrl] = R4
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	clrb [R3], 7			//;Set as relative jump mode
	clrb [R3], 15			//;Set as relative jump mode
//	R4 = [R3]
//	R4 &= ~0x0080			//;Set as relative jump mode
//	R4 &= ~0x8000			//;Set as relative jump mode
//	[R3] = R4
	goto L_ExitSetMIDIIrqPara
//==========================================================================
//Attack(ADPCM) + Loop(PCM)
//==========================================================================
L_ADPCM_PCM_ZCIrq_D:	
	DS = R4;
	R2 = D:[R3];			// Get Bank address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_H
	[R1] = R2
	
	R3 += 1;
	R4 += 0, carry;

	DS = R4;
	R2 = D:[R3];			// Get High and Low address of Loop
	
	R1 = [R_BackUpChIRQ]
//	R1 += T_ChMap
//	R1 = [R1]
	R1 = R1 lsl 4
	R1 += P_SPU_Ch0_NextDPTR_L
	[R1] = R2	
	
	R1 = [R_BackUpChIRQ]
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_DrumPlaying+D_AdpcmJumpPcm
	R3 &= ~(D_ZCJump+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3
	
	R4 = [P_SPU_INT_Ctrl]
	R4 &= 0x00ff
	R2 = R1 + 0x0008
	setb R4, R2
//	R2 = R1 + T_ChEnableHB
//	R2 = [R2]
//	R4 |= R2	
	[P_SPU_INT_Ctrl] = R4	
	
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R3 = R2 + P_SPU_Ch0_Volume_Ctrl
	R4 = [R3]
	R4 |= 0x0080			//;Set as absolute jump mode
	R4 &= ~0x8000			//;Set as relative jump mode
	[R3] = R4
	goto L_ExitSetMIDIIrqPara
L_ExitSetMIDIIrqPara:
	pop R1, R5 from [SP];	
	retf;
	.endp		
;@	
//****************************************************************
// Function    : F_InitialADSR
// Description : Target and slope both need to multiply the value of "R_Velovol".
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
F_ChPlayTone:	.proc
	R5 = [R_BackUpCh]
	R1 = P_SPU_CH_Ctrl
	tstb [R1], R5						//;If channel is idle, play note directly; otherwise concatenate jump
	jz L_PlayNoteDirectly
	R4 = R5 + 0x0008
	tstb [R1], R4
	jnz L_CloseCh?
	goto L_ConcatenationM
L_CloseCh?:
	clrb [R1], R5
L_PlayNoteDirectly:                     //;When the channel is idle, play note directly	
	R2 = [R_BackUpCh]
	call F_GetInstAddr           		//;Get instrument address
	R1 = [R_InstAddr_BS]
	R2 = [R_InstAddr_DS]
	R1 += 1
	R2 += 0, carry
	DS = R2
	R4 = D:[R1]							//;Base Pitch - Note Pitch
	cmp R4, [R_MIDITemp]				
	jb L_BaseIsSmall					//;If overflow, Base is smaller than Note
L_BaseIsLarge:                          //;Note is smaller than Base	
	R4 -= [R_MIDITemp];
	[R_MIDITemp] = R4;
	
	R3 = D_PhaseIndexOffset;
	R4 = seg16 (D_PhaseIndexOffset);
	
	DS = R4;
	R4 = D:[R3];
	R4 &= 0x00FF;			// Get low byte, because offset is not so large
	R4 -= [R_MIDITemp];
	[R_MIDITemp] = R4;		// Offset(Get Phase Adder value) = D_PhaseIndexOffset - difference
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];			// get sample rate index of T_SampleRate or T_SampleRateBase
	R3 = R3 lsl 1;
	
	R4 = seg16 (T_SampleRate);
	DS = R4
	R4 = R3 + T_SampleRate;
	R3 = D:[R4++];
	R4 = D:[R4];
	jmp L_UpdateNoteFs;
L_BaseIsSmall:
	R3 = [R_MIDITemp];
	R3 -= R4;				// difference = Current Note - Base
	[R_MIDITemp] = R3;		// Offset = difference
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];			// get sample rate index of T_SampleRate or T_SampleRateBase
	R3 = R3 lsl 1;
	R4 = seg16 (T_SampleRateBase);
	DS = R4
	R4 = R3 + T_SampleRateBase;
	R3 = D:[R4++];
	R4 = D:[R4];    
L_UpdateNoteFs:
	R5 = [R_MIDITemp];
	R3 += R5;
	R4 += 0, carry;
	DS = R4;
	R5 = D:[R3];			// sampling rate
?L_UpdateFs:		
    IRQ OFF
	R3 = [R_BackUpCh]
	R3 = R3 lsl 4
	R4 = R3 + P_SPU_Ch0_SampleFreq
	[R4] = R5

	
	.IF PITCH_BEND == D_ON
	R4 = [R_BackUpCh]
	R4 += R_ChNoteFs
	[R4] = R5
    .ENDIF
    IRQ ON

L_SetChPara:    
	R5 = 0x0000;
	R4 = R3 + P_SPU_Ch0_LoopLength;	
	[R4] = R5;
	R4 = R3 + P_SPU_Ch0_Filter_S1;		// Set S1,S2=0 to avoid noise
	[R4] = R5;
	R4 = R3 + P_SPU_Ch0_Filter_S2;
	[R4] = R5;
	R4 = R3 + P_SPU_Ch0_PhaseAdder
	[R4] = R5;
	
	
L_Attack_Loop_M:	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];			// get ADSR table address low word
	
	R1 += 1;
	R2 += 0, carry;

	DS = R2;
	R4 = D:[R1];			// get ADSR tabel address high word
	
	R3 += 2;
	R4 += 0, carry;
?L_SetDPTR:
	IRQ OFF
	DS = R4;
	R1 = D:[R3];			// High word
	
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			// Low word
	
	R5 = R1 & 0xc000
	R1 = R1 & 0x0fff
    R2 += R2
    R1 += R1, carry
    //R2 -= (0x8000 + 0x0001)
    R2 -= (0x0001)
    R1 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeader?
    //R2 += 0xa
    R2 += 0x4
    R1 += 0, carry
L_NoHeader?:
    R1 |= R5
    R1 |= 0x2000 	//jump mode
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_DPTR_H;	
	[R5] = R1
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_DPTR_L;	
	[R5] = R2
	

	R1 = [R_BackUpCh]
	R2 = R1 lsl 4
	R5 = R1 + R_Volume
	R5 = [R5]
	R5 &= 0x7f80
	R5 = R5 lsl 1
	R1 = R5 lsr 4
	R1 = R1 lsr 4
	R5 |= R1
	//R5 |= 0x8080
	R1 = R2 + P_SPU_Ch0_Volume_Ctrl
	[R1] = R5
	
	
	R3 += 1;
	R4 += 0, carry;
?L_SetDPTNBAddr:
	DS = R4;
	R1 = D:[R3];			//High word
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];			//Low word
	
	R5 = R1 & 0xc000
	R1 = R1 & 0x0fff
    R2 += R2
    R1 += R1, carry
    R2 -= (0x0001)
    R1 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeaderN?
    R2 += 0xa
    R1 += 0, carry
L_NoHeaderN?:    
    R1 |= R5
    R1 |= 0x2000 	//jump mode
    
    R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R5 = D:[R3];			//Loop Length
	
	R2 -= R5
	R1 -= 0, carry
    
//    test R5, 0x8000
//    jnz L_Loop?
//    R5 = [R_BackUpCh];
//	R5 += T_ChMap
//	R5 = [R5]
//	R5 += P_SPU_Ch0_Volume_Ctrl;	
//	R3 = [R5]
//	R3 &= ~0x0080
//	[R5] = R3
//	
//	/////////////////////////////////////////////////SPU Check
//	[R_SPU_Vol] = R3
//	/////////////////////////////////////////////////
	
	
L_Loop?:    
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_NextDPTR_H;	
	[R5] = R1
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_NextDPTR_L;	
	[R5] = R2
	
	
	R1 = [R_BackUpCh];
	IRQ OFF
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= D_NotePlaying
	R3 &= ~(D_ZCJump+D_AdpcmJumpPcm+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3						//;Clear note off flag
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	clrb R2, R1						//;Disable channel IRQ
	R5 = R1 + 0x0008
	setb R2, R5
	[P_SPU_INT_Ctrl] = R2

	
	R2 = P_SPU_CH_Ctrl
 	setb [R2], R1					//;Enable SPU Channel
	IRQ ON
	
	retf;	
	
//==========================================================================
//Attack(PCM) + Loop(ADPCM)
//==========================================================================
.comment @
L_PCM_ADPCM_M:	
	R1 = [R_BackUpCh]
	//R2 = R1 + T_ChMap
	//R2 = [R2]
	R2 = R1 lsl 4
	R5 = R1 + R_Volume
	R5 = [R5]
	R5  = R5 lsr 4 
	R5  = R5 lsr 4 
	R1 = R5
	R5 |= 0x0080;					//;Absoulte jump to next wave
	R1  = R1 lsl 4 
	R1  = R1 lsl 4
	R5 |= R1						//;Set next sample's vloume and relative jump mode
	R1 = R2 + P_SPU_Ch0_Volume_Ctrl
	[R1] = R5
	
	R3 += 1;
	R4 += 0, carry;
?L_SetDPTNBAddr:
	DS = R4;
	R5 = D:[R3];	
	R1 = R2 + P_SPU_Ch0_NextDPTR_H;
	[R1] = R5;
	
	R3 += 1;
	R4 += 0, carry;
	
	DS = R4;
	R5 = D:[R3];
	R1 = R2 + P_SPU_Ch0_NextDPTR_L;
	[R1] = R5;
	
	R1 = [R_BackUpCh];
	IRQ OFF
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= D_NotePlaying
	R3 &= ~(D_ZCJump+D_AdpcmJumpPcm+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3						//;Clear note off flag
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	clrb R2, R1
	R5 = R1 + 0x0008
	setb R2, R5
	[P_SPU_INT_Ctrl] = R2

	R2 = P_SPU_CH_Ctrl
	setb [R2], R1					//;Enable SPU Channel

	IRQ ON
	retf;
	
//==========================================================================
//Attack(ADPCM) + Loop(ADPCM)
//==========================================================================
L_ADPCM_ADPCM_M:
	R1 = [R_BackUpCh]	
//	R2 = R1 + T_ChMap
//	R2 = [R2] 
	R2 = R1 lsl 4
	R1 = 0
	IRQ OFF
	R5 = R2 + P_SPU_Ch0_LoopLength			//;Initialize loop length before playing ADPCM
	[R5] = R1
	IRQ ON
	
	R1 = [R_BackUpCh]	
	R3 = R1 + R_Volume
	R3 = [R3]
	R3 = R3 lsr 4;
	R3 = R3 lsr 4;
	R3 &= 0x007F;
	R4 = R2 + P_SPU_Ch0_Volume_Ctrl
	[R4] = R3						// Set volume(ADSR), relative jump mode.
	
	IRQ OFF
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= D_NotePlaying
	R3 &= ~(D_AdpcmJumpPcm+D_ZCJump+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3	
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	clrb R2, R1						//;Disable channel IRQ
	R5 = R1 + 0x0008
	setb R2, R5
	[P_SPU_INT_Ctrl] = R2
	
	R2 = P_SPU_CH_Ctrl
	setb [R2], R1					//;Enable SPU Channel
	
	IRQ ON
	retf;
	
//==========================================================================
//Attack(ADPCM) + Loop(PCM)
//==========================================================================
L_ADPCM_PCM_M:
	R1 = [R_BackUpCh]	
//	R2 = R1 + T_ChMap
//	R2 = [R2] 
	R2 = R1 lsl 4
	R1 = 0
	
	R5 = R2 + P_SPU_Ch0_LoopLength			//;Initialize loop length before playing ADPCM
	[R5] = R1
	IRQ ON
	
	R1 = [R_BackUpCh]	
	R1 = R1 + R_Volume
	R1 = [R1]
	R1 = R1 lsr 4;
	R1 = R1 lsr 4;
	R1 &= 0x007f
	R5 = R1 lsl 4
	R5 = R5 lsl 4
	R1 |= R5
	R1 |= 0x0080				// Set Attack section volume(ADSR), absolute jump mode.
	R5 = R2 + P_SPU_Ch0_Volume_Ctrl			// Set Loop section volume(ADSR), relative jump mode.
	IRQ OFF
	[R5] = R1
	IRQ ON	
						
?L_GetNoteDPTNBAddr:	
	R3 += 1;
	R4 += 0, carry;
?L_SetDPTNBAddr:
	DS = R4;
	R5 = D:[R3];
	R1 = R2 + P_SPU_Ch0_NextDPTR_H
	[R1] = R5
	
	R3 += 1;
	R4 += 0, carry;
	
	DS = R4;
	R5 = D:[R3];
	R1 = R2 + P_SPU_Ch0_NextDPTR_L
	[R1] = R5
	
	R1 = [R_BackUpCh]
	IRQ OFF
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= (D_NotePlaying+D_AdpcmJumpPcm)
	R3 &= ~(D_ZCJump+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3	
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	setb R2, R1						//;Enable channel IRQ
	R5 = R1 + 0x0008
	setb R2, R5						//;Clear previous IRQ status, avoid IRQ happen immediately after channel IRQ is enabled
	[P_SPU_INT_Ctrl] = R2
	
	R2 = P_SPU_CH_Ctrl
	setb [R2], R1					//;Enable SPU Channel
	
	IRQ ON
	retf;
	
//==========================================================================
//Attack(PCM) + Loop(PCM)
//==========================================================================	
L_PCM_PCM_M:
	R1 = [R_BackUpCh]	
//	R2 = R1 + T_ChMap
//	R2 = [R2] 
	R2 = R1 lsl 4
	R1 = R1 + R_Volume
	R1 = [R1]
	R1 = R1 lsr 4;
	R1 = R1 lsr 4;
	R1 &= 0x007f				//;Relative jump mode
	R5 = R1 lsl 4
	R5 = R5 lsl 4
	R1 |= R5
	R5 = R2 + P_SPU_Ch0_Volume_Ctrl			
	IRQ OFF
	[R5] = R1
	IRQ ON	
	
	R3 += 3;
	R4 += 0, carry;
	
	DS = R4;
	R1 = D:[R3];				//;Get loop length
	R5 = R2 + P_SPU_Ch0_LoopLength	
	IRQ OFF	
	[R5] = R1
	IRQ ON
	
	R1 = [R_BackUpCh]
	IRQ OFF
	R2 = R1 + R_ChStatus;
	R3 = [R2];
	R3 |= (D_NotePlaying)
	R3 &= ~(D_AdpcmJumpPcm+D_ZCJump+D_NoteOffFlag+D_DrumPlaying)
	[R2] = R3					// ;Clear note off flag
	
	R2 = [P_SPU_INT_Ctrl]
	R2 &= 0x00ff
	clrb R2, R1						//;Disable channel IRQ
	R5 = R1 + 0x0008
	setb R2, R5						//;Clear previous IRQ status, avoid IRQ happen immediately after channel IRQ is enabled
	[P_SPU_INT_Ctrl] = R2	
	
	R2 = P_SPU_CH_Ctrl
	setb [R2], R1
	
	IRQ ON
	retf;
;@	
//==========================================================================
//When a channel is busy, concatenate jump mode
//==========================================================================
L_ConcatenationM:                   //;When a channel is busy	
	R2 = [R_BackUpCh]
	call F_GetInstAddr           		//;Get instrument address
	R1 = [R_InstAddr_BS]
	R2 = [R_InstAddr_DS]
	
	R1 += 3;
	R2 += 0, carry;

	DS = R2;
	R3 = D:[R1];
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];
	R3 += 2;
	R4 += 0, carry;
?L_SetDPTNB:	
	DS = R4;
	R1 = D:[R3];
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];
	
	R5 = R1 & 0xc000
	R1 = R1 & 0x0fff
    R2 += R2
    R1 += R1, carry
    R2 -= (0x0001)
    R1 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeaderN?
    R2 += 0xa
    R1 += 0, carry
L_NoHeaderN?:    
    R1 |= R5
    R1 |= 0x2000
	
	R4 = [R_BackUpCh]
	R5 = R4 lsl 4
	R3 = R5 + P_SPU_Ch0_NextDPTR_H;
	[R3] = R1
	R3 = R5 + P_SPU_Ch0_NextDPTR_L;
	[R3] = R2						//address of Attack
	
	
	R1 = R4 + R_Volume
	R1 = [R1]
	R1 &= 0x7f80
	R1 = R1 lsl 1
	//R1 |= 0x8000
	R2 = R5 + P_SPU_Ch0_Volume_Ctrl
	R3 = [R2]
	R3 &= 0x00ff
	R1 |= R3
	[R2] = R1
	
//==========================================================================
//Attack + Loop
//==========================================================================
L_AnyMode_CONC:	
	IRQ OFF
	R1 = P_SPU_INT_Ctrl
	setb [R1], R4
	R1 = 0
	setb R1, R4
	[P_SPU_INT_Status] = R1
	
	R1 = R4 + R_ChStatus
	R2 = [R1]
	R2 |= D_ZCJump
	R2 &= ~(D_AdpcmJumpPcm+D_DrumPlaying)
	[R1] = R2
	
	R1 = P_SPU_CH_Ctrl
	R5 = R4 + 0x0008
	setb [R1], R5						// ;Concatenate jump to new sample
	IRQ ON
L_ExitChPlayTone:	
	retf;
	.endp		
	
//****************************************************************
// Function    : F_PlayDrum
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_PlayDrum:		.proc
	R5 = [R_BackUpCh]
	R1 = P_SPU_CH_Ctrl
	tstb [R1], R5						//;If channel is idle, play note directly; otherwise concatenate jump
	jz L_PlayDrumDirectly
	R4 = R5 + 0x0008
	tstb [R1], R4
	jnz L_CloseCh?
	goto L_ConcatenationD
L_CloseCh?:
	clrb [R1], R5	
L_PlayDrumDirectly:	
	R1 = [R_DrumIndex]
	R1 = R1 lsl 1
	R4 = seg T_DrumInst;
	R3 = R1 + T_DrumInst;
	R4 += 0, carry;
	DS = R4;
	R1 = D:[R3];
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];
	
	DS = R2;
	R3 = D:[R1]
	
	R3 = R3 lsl 1;
	R4 = seg16 (T_SampleRateBase);
	DS = R4
	R4 = R3 + T_SampleRateBase;
	R3 = D:[R4++];
	R4 = D:[R4];    
	
	DS = R4
	R3 = D:[R3]				//sampling rate
	R4 = [R_BackUpCh]
	R5 = R4 lsl 4
	R5 += P_SPU_Ch0_SampleFreq
	[R5] = R3

	
	.IF PITCH_BEND == D_ON
	R4 = [R_BackUpCh]
    R5 = R4 + R_ChNoteFs
    [R5] = R3
    .ENDIF 
    
	R3 = [R_BackUpCh]
	R3 = R3 lsl 4
	R5 = 0x0000;
	R4 = R3 + P_SPU_Ch0_LoopLength
	[R4] = R5;
	R4 = R3 + P_SPU_Ch0_Filter_S1;		// Set S1,S2=0 to avoid noise
	[R4] = R5;
	R4 = R3 + P_SPU_Ch0_Filter_S2;
	[R4] = R5;
	R4 = R3 + P_SPU_Ch0_PhaseAdder
	[R4] = R5;
	
	
//==========================================================================
//Attack + Loop
//==========================================================================
L_Attack_Loop_D:	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];			// get address of Attack high word
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// get address of Attack low word
	
	R5 = R3 & 0xc000
	R3 = R3 & 0x0fff
    R4 += R4
    R3 += R3, carry
    //R4 -= (0x8000 + 0x0001)
    R4 -= (0x0001)
    R3 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeader?
    //R4 += 0xa
    R4 += 0x4
    R3 += 0, carry
L_NoHeader?:    
    R3 |= R5
    R3 |= 0x2000	//jump mode
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_DPTR_H
	[R5] = R3
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_DPTR_L
	[R5] = R4
	
	
	R5 = [R_BackUpCh]	
	R3 = R5 + R_Volume
	R3 = [R3]
	R3 &= 0x7f80
	R3 = R3 lsl 1
	R4 = R3 lsr 4
	R4 = R4 lsr 4
	R3 |= R4
	//R3 |= 0x8080
	R4 = R5 lsl 4
	R4 += P_SPU_Ch0_Volume_Ctrl
	[R4] = R3
	
	
	R1 += 5
	R2 += 0, carry
	
	DS = R2
	R3 = D:[R1]
	
	R1 += 1
	R2 += 0, carry
	
	DS = R2
	R4 = D:[R1]
	
	R5 = R3 & 0xc000
	R3 = R3 & 0x0fff
    R4 += R4
    R3 += R3, carry
    //R4 -= (0x8000 + 0x0001)
    R4 -= (0x0001)	
    R3 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeaderN?
    R4 += 0xa
    R3 += 0, carry
L_NoHeaderN?:    
    R3 |= R5
    R3 |= 0x2000	//jump mode
    
    R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R5 = D:[R1];			//Loop Length
	
	R4 -= R5
	R3 -= 0, carry
    
    IRQ OFF
    R1 = [R_BackUpCh]
    R2 = R1 lsl 4
	R5 = R2 + P_SPU_Ch0_NextDPTR_H
	[R5] = R3

	R5 = R2 + P_SPU_Ch0_NextDPTR_L
	[R5] = R4
	
	
L_Loop?:	
	R1 += R_ChStatus
	R2 = [R1]
	R2 &= ~(D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag+D_ZCJump)
	R2 |= D_DrumPlaying
	[R1] = R2
	
	R5 = [R_BackUpCh]
	R1 = P_SPU_INT_Ctrl
	clrb [R1], R5
	R1 = 0
	setb R1, R5
	[P_SPU_INT_Status] = R1
	
	
	R1 = P_SPU_CH_Ctrl
	setb [R1], R5
	
	R5 = [R_BackUpCh]
	R5 += R_ChDrumIndex
	R1 = [R_DrumIndex]
	[R5] = R1	

	IRQ ON
	retf
	
L_ConcatenationD:	
	R1 = [R_DrumIndex]
	R1 = R1 lsl 1
	R4 = seg T_DrumInst;
	R3 = R1 + T_DrumInst;
	R4 += 0, carry;
	DS = R4;
	R1 = D:[R3];
	R3 += 1;
	R4 += 0, carry;
	DS = R4;
	R2 = D:[R3];
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R3 = D:[R1];			// get address of Attack high word
	
	R1 += 1;
	R2 += 0, carry;
	DS = R2;
	R4 = D:[R1];			// get address of Attack low word
	
	R5 = R3 & 0xc000
	R3 = R3 & 0x0fff
    R4 += R4
    R3 += R3, carry
    R4 -= (0x0001)
    R3 -= 0, carry
    test R5, 0x8000
    jnz L_NoHeader?
    R4 += 0xa
    R3 += 0, carry
L_NoHeader?:    
    R3 |= R5
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_NextDPTR_H
	[R5] = R3
	
	R5 = [R_BackUpCh]
	R5 = R5 lsl 4
	R5 += P_SPU_Ch0_NextDPTR_L
	[R5] = R4
	
	
	R5 = [R_BackUpCh]	
	R4 = R5 lsl 4
	R3 = R5 + R_Volume
	R3 = [R3]
	R3 &= 0x7f80
	R3 = R3 lsl 1
	//R3 |= 0x8000
	R2 = R4 + P_SPU_Ch0_Volume_Ctrl
	R1 = [R2]
	R1 &= 0x00ff
	R3 |= R1
	[R2] = R3


	R4 = [R_BackUpCh]	
	IRQ OFF
	R1 = P_SPU_INT_Ctrl
	setb [R1], R4
	R1 = 0
	setb R1, R4
	[P_SPU_INT_Status] = R1
	
	R1 = R4 + R_ChStatus
	R2 = [R1]
	R2 |= D_ZCJump+D_DrumPlaying
	R2 &= ~(D_NotePlaying+D_AdpcmJumpPcm+D_NoteOffFlag)
	[R1] = R2
	
	R1 = P_SPU_CH_Ctrl
	R5 = R4 + 0x0008
	setb [R1], R5						// ;Concatenate jump to new sample
	
	R5 = [R_BackUpCh]
	R5 += R_ChDrumIndex
	R1 = [R_DrumIndex]
	[R5] = R1	
	
	IRQ ON
L_ExitChPlayDrum:	
	retf;
	.endp	
//****************************************************************
// Function    : F_GetMIDIData
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_GetMIDIData:	.proc
	push R1,R4 to [sp]
	R1 = [R_MIDICtrl]
	R2 = [R_MIDIDPTR_DS]
	R3 = [R_MIDIDPTR_BS]
	DS = R2
	R4 = D:[R3]
	test R1, D_DataHLByte
	jnz ?L_GetHighByte
?L_GetLowByte:
	R4 &= 0x00ff
	[R_MIDIData] = R4
	R1 = [R_MIDICtrl]
	R1 |= D_DataHLByte
	[R_MIDICtrl] = R1
	jmp L_ExitGet_SPU_MIDI_Data
?L_GetHighByte:	
	R3 += 1
	R2 += 0, carry
	[R_MIDIDPTR_BS] = R3
	[R_MIDIDPTR_DS] = R2
	R4 = R4 lsr 4
	R4 = R4 lsr 4
	[R_MIDIData] = R4
	R1 = [R_MIDICtrl]
	R1 &= ~(D_DataHLByte)
	[R_MIDICtrl] = R1
L_ExitGet_SPU_MIDI_Data:	
	pop R1,R4 from [sp]
	retf;
	.endp
	
//****************************************************************
// Function    : F_PauseMIDI
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _PauseMIDI:	.proc	
F_PauseMIDI:
	push R1, R3 to [sp]
	R1 = 0
L_HoldLoop:	
	//.IF SPEECH == D_ON
	R2 = R1 + R_ChSpeechStatus
	R2 = [R2]
	test R2, (D_SpeechPlaying+D_SpeechRepeat+D_SpeechPause)
	jnz L_ChkNextChSp?	
	//.ENDIF
	IRQ OFF
	R2 = R1 + T_ChDisableLB
	R2 = [R2]
	R2 &= [P_SPU_CH_Ctrl]
	[P_SPU_CH_Ctrl] = R2
	IRQ ON
	
	R3 = 0
	R2 = R1 + R_ChTime
	[R2] = R3
L_ChkNextChSp?:
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_HoldLoop
	R1 = [R_MIDICtrl]
	R1 |= D_PauseMIDI
	[R_MIDICtrl] = R1
L_ExitPauseMIDI?:
	pop R1, R3 from [sp]
	retf;
	.endp
	
//****************************************************************
// Function    : F_ResumeMIDI
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
 _ResumeMIDI: 	.proc	
F_ResumeMIDI:	
	push R1 to [sp]
	R1 = [R_MIDICtrl]
	R1 &= ~(D_PauseMIDI)
	[R_MIDICtrl] = R1	
	pop R1 from [sp]
	retf;
	.endp
	
	
//****************************************************************
// Function    : F_SetTempo
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _GetTempo:	.proc
F_GetTempo:	
	R1 = [R_TempoIndex]
	retf
	.endp	
	
//****************************************************************
// Function    : F_SetTempo
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SetTempo:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_SetTempo:	
	cmp R1, [T_TempoIndexBegin]
	jl L_ExitSetTempo
	cmp R1, [T_TempoIndexEnd]
	ja L_ExitSetTempo
	[R_TempoIndex] = R1
L_ExitSetTempo:	
	retf
	.endp	
	
//****************************************************************
// Function    : F_SetTempoUp
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SetTempoUp:	.proc
F_SetTempoUp:	
	push R1 to [sp]
	R1 = [T_TempoIndexBegin]
	cmp R1, [R_TempoIndex]
	je L_ExitSetTempoUp
	R1 = [R_TempoIndex]
	R1 -= 1
	[R_TempoIndex] = R1
L_ExitSetTempoUp:	
	pop R1 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_SetTempoDn
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SetTempoDn:	.proc
F_SetTempoDn:	
	push R1 to [sp]
	R1 = [T_TempoIndexEnd]
	cmp R1, [R_TempoIndex]
	je L_ExitSetTempoDn
	R1 = [R_TempoIndex]
	R1 += 1
	[R_TempoIndex] = R1
L_ExitSetTempoDn:	
	pop R1 from [sp]
	retf
	.endp	
	
//****************************************************************
// Function    : F_MIDIOff
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _MIDIOff:	.proc
F_MIDIOff:	
	push R1, R3 to [sp]
	R1 = 0
L_ChkLoop?:
	R2 = R1 + R_ChStatus
	R2 = [R2]
	test R2, D_NotePlaying
	jnz L_StopCh?
	test R2, D_DrumPlaying
	jz  L_ChkNext?
L_StopCh?:
	IRQ OFF
	R2 = R1 + T_ChDisableLB
	R2 = [R2]
	R2 &= [P_SPU_CH_Ctrl]
	[P_SPU_CH_Ctrl] = R2
	IRQ ON
	
	R3 = 0
	R2 = R1 + R_ChTime
	[R2] = R3
L_ChkNext?:
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_ChkLoop?
	
	R1 = [R_MIDIStatus]	
	R1 |= D_MusicOff
	R1 &= ~(D_MIDIEn)
	[R_MIDIStatus] = R1	
L_ExitMIDIOff?:	
	pop R1, R3 from [sp]
	retf
	.endp
	
//****************************************************************
// Function    : F_MIDIOn
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
 _MIDIOn:	.proc
F_MIDIOn: 	
 	push R1 to [sp]
 	R1 = [R_MIDIStatus]
 	R1 &= ~(D_MusicOff)
 	R1 |= D_MIDIEn
 	[R_MIDIStatus] = R1
 	pop R1 from [sp]
 	retf
 	.endp	
 	
//****************************************************************
// Function    : F_RepeatMIDIOn
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************			
 _RepeatMIDIOn:		.proc
F_RepeatMIDIOn:	
	.IF REPEAT_MIDI == D_ON
	push R1 to [sp]
	R1 = [R_RepeatMIDI]
	R1 |= 0x8000
	[R_RepeatMIDI] = R1
	pop R1 from [SP]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_RepeatMIDIOff
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************			
 _RepeatMIDIOff:		.proc
F_RepeatMIDIOff:	
	.IF REPEAT_MIDI == D_ON
	push R1 to [sp]
	R1 = [R_RepeatMIDI]
	R1 &= 0x7fff
	[R_RepeatMIDI] = R1
	pop R1 from [SP]
	.ENDIF
	retf
	.endp	

//****************************************************************
// Function    : F_MIDIStatus
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************			
 _MIDIStatus:	.proc
F_MIDIStatus: 
 	R1 = [R_MIDIStatus]
	retf
	.endp

//****************************************************************
// Function    : F_MuteMIDICh
// Description : 
// Destory     : 
// Parameter   : R1 = MIDI channel (1 ~ 16)
// Return      : 
// Note        : 
//****************************************************************	
 _MuteMIDICh:	.proc 	
 	R1 = SP + 3;
	R1 = [R1];							// MIDI index
F_MuteMIDICh:
	push R1, R2 to [sp]
	.IF MUTE_MIDI_CH == D_ON
	R2 = 1
L_DisMIDICh?:	
	cmp R1, R2
	jne L_CheckNext?
	R2 -= 1
	R1 = R_EnCh1ToCh16
	setb [R1], R2
	jmp L_Exit?
L_CheckNext?:
	R2 += 1	
	cmp R2, 0x0010
	ja L_Exit?
	jmp L_DisMIDICh?
	.ENDIF
L_Exit?:	
	pop R1, R2 from [SP]
	retf
	.endp
	
//****************************************************************
// Function    : F_UnMuteMIDICh
// Description : 
// Destory     : 
// Parameter   : R1 = MIDI channel (1 ~ 16)
// Return      : 
// Note        : 
//****************************************************************	
 _UnMuteMIDICh:		.proc
 	R1 = SP + 3;
	R1 = [R1];							// MIDI index
F_UnMuteMIDICh:		
	push R2 to [sp]
	.IF MUTE_MIDI_CH == D_ON
	R2 = 1
L_DisMIDICh?:	
	cmp R1, R2
	jne L_CheckNext?
	R2 -= 1
	R2 = R2 + T_ChDisableLB
	R2 = [R2]
	R2 &= [R_EnCh1ToCh16]
	[R_EnCh1ToCh16] = R2
	jmp L_Exit?
L_CheckNext?:
	R2 += 1	
	cmp R2, 0x0010
	ja L_Exit?
	jmp L_DisMIDICh?
	.ENDIF
L_Exit?:	
	pop R2 from [SP]
	retf
	.endp	
	
//****************************************************************
// Function    : F_KeyShiftUp
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
 _KeyShiftUp:	.proc
F_KeyShiftUp:	
	.IF MIDI_KEY_SHIFT == D_ON
	push R1 to [sp]
	R1 = [R_KeyShift]
	R1 += 1
	[R_KeyShift] = R1
	pop R1 from [sp]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_KeyShiftDn
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************			
 _KeyShiftDn:	.proc
F_KeyShiftDn:	
	.IF MIDI_KEY_SHIFT == D_ON
	push R1 to [sp]
	R1 = [R_KeyShift]
	R1 -= 1
	[R_KeyShift] = R1
	pop R1 from [sp]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_ChangeInst
// Description : 
// Destory     : 
// Parameter   : R1 = New instrument index
//				 R2 = MIDI channel (1 ~ 16)
// Return      : 
// Note        : 
//****************************************************************		
 _ChangeInst:	.proc
 	R2 = SP + 3;
	R1 = [R2++];							// New instrument index
	R2 = [R2]								// MIDI channel
F_ChangeInst:	
	push R3 to [sp]
	cmp R2, 0x0000
	je L_ExitChangeInst?
	cmp R2, 0x0010
	ja L_ExitChangeInst?
	R3 = R2 - 0x0001
	R3 += R_ChInst
	[R3] = R1
L_ExitChangeInst?:	
	pop R3 from [sp]
	retf	
	.endp
	
//****************************************************************
// Function    : F_EnMIDIChVolCtrl
// Description : 
// Destory     : 
// Parameter   : R1 = MIDI channel (1 ~ 16)
// Return      : 
// Note        : 
//****************************************************************		
 _EnMIDIChVolCtrl:		.proc
 	R1 = SP + 3;
	R1 = [R1];							// MIDI channel
F_EnMIDIChVolCtrl:
	push R1, R2 to [sp]
	.IF CTRL_MIDI_CH_VOL == D_ON
	R2 = 1
L_DisMIDICh?:	
	cmp R1, R2
	jne L_CheckNext?
	R2 -= 1
	R1 = R_CtrlVolCh1ToCh16
	setb [R1], R2
	jmp L_Exit?
L_CheckNext?:
	R2 += 1	
	cmp R2, 0x0010
	ja L_Exit?
	jmp L_DisMIDICh?
	.ENDIF
L_Exit?:	
	pop R1, R2 from [SP]
	retf
	.endp
	
//****************************************************************
// Function    : F_DisMIDIChVolCtrl
// Description : 
// Destory     : 
// Parameter   : R1 = MIDI channel (1 ~ 16)
// Return      : 
// Note        : 
//****************************************************************		
 _DisMIDIChVolCtrl:		.proc
 	R1 = SP + 3;
	R1 = [R1];							// MIDI channel
F_DisMIDIChVolCtrl:
	push R2 to [sp]
	.IF CTRL_MIDI_CH_VOL == D_ON
	R2 = 1
L_DisMIDICh?:	
	cmp R1, R2
	jne L_CheckNext?
	R2 -= 1
	R2 = R2 + T_ChDisableLB
	R2 = [R2]
	R2 &= [R_CtrlVolCh1ToCh16]
	[R_CtrlVolCh1ToCh16] = R2
	jmp L_Exit?
L_CheckNext?:
	R2 += 1	
	cmp R2, 0x0010
	ja L_Exit?
	jmp L_DisMIDICh?
	.ENDIF
L_Exit?:	
	pop R2 from [SP]
	retf
	.endp	
	
//****************************************************************
// Function    : F_EnAllMIDIChVolCtrl
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************			
 _EnAllMIDIChVolCtrl:	.proc
F_EnAllMIDIChVolCtrl:	
	.IF CTRL_MIDI_CH_VOL == D_ON
	push R1 to [sp]
	R1 = 0xffff
	[R_CtrlVolCh1ToCh16] = R1
	pop R1 from [sp]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_DisAllMIDIChVolCtrl
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************			
 _DisAllMIDIChVolCtrl:	.proc
F_DisAllMIDIChVolCtrl:	
	.IF CTRL_MIDI_CH_VOL == D_ON
	push R1 to [sp]
	R1 = 0
	[R_CtrlVolCh1ToCh16] = R1
	pop R1 from [sp]
	.ENDIF
	retf
	.endp	
	
//****************************************************************
// Function    : F_SetMIDIChVolUp
// Description : Increment = 1/10 per step, it can be up to 20 levels
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SetMIDIChVolUp:	.proc
F_SetMIDIChVolUp:	
	.IF CTRL_MIDI_CH_VOL == D_ON
	push R1 to [sp]
	R1 = [R_CtrlMIDIChVol]
	R1 -= 0x0002
	jmi L_SetToMaxLevel?
	[R_CtrlMIDIChVol] = R1
	jmp L_ExitSetMIDIChVolUp?
L_SetToMaxLevel?:	
	R1 = 0
	[R_CtrlMIDIChVol] = R1
L_ExitSetMIDIChVolUp?:
	pop R1 from [sp]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_SetMIDIChVolDn
// Description : Decrement = 1/10 per step, it can be down to 10 levels
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
 _SetMIDIChVolDn:	.proc
F_SetMIDIChVolDn:
	.IF CTRL_MIDI_CH_VOL == D_ON
	push R1 to [sp]
	R1 = [R_CtrlMIDIChVol]
	R1 += 0x0002
	cmp R1, [MinVolumeLevel]
	jae L_SetToMinLevel?
	[R_CtrlMIDIChVol] = R1
	jmp L_ExitSetMIDIChVolDn?
L_SetToMinLevel?:	
	R1 = [MinVolumeLevel]
	R1 -= 2
	[R_CtrlMIDIChVol] = R1
L_ExitSetMIDIChVolDn?:
	pop R1 from [sp]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_SetMIDIChVolIdx
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _SetMIDIChVolIdx:	.proc
 	R1 = SP + 3
 	R1 = [R1]
F_SetMIDIChVolIdx:	
	.IF CTRL_MIDI_CH_VOL == D_ON
	[R_CtrlMIDIChVol] = R1
	.ENDIF
	retf
	.endp	
	
//****************************************************************
// Function    : F_SetPitchBendUp
// Description : Pitch bend up 39/10000 times per step, it can be up to 2 semitones at most
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SetPitchBendUp:	.proc
F_SetPitchBendUp:
	.IF PITCH_BEND == D_ON
	push R1 to [sp]
	R1 = [R_PitchBendLevel]
	R1 -= 2
	jmi L_SetToMaxPBLevel?
	[R_PitchBendLevel] = R1
	jmp L_ExitSetPitchBendUp
L_SetToMaxPBLevel?:	
	R1 = 0
	[R_PitchBendLevel] = R1
L_ExitSetPitchBendUp:	
	pop R1 from [sp]
	.ENDIF
	retf
	.endp	
	
//****************************************************************
// Function    : F_SetPitchBendDn
// Description : Pitch bend down 39/10000 times per step, it can be down to 2 semitones at most
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************
 _SetPitchBendDn:	.proc
F_SetPitchBendDn:
	.IF PITCH_BEND == D_ON
	push R1 to [sp]
	R1 = [R_PitchBendLevel]
	R1 += 2
	cmp R1, [EndPBLevel]
	jae L_SetToMinPBLevel?
	[R_PitchBendLevel] = R1
	jmp L_ExitSetPitchBendDn
L_SetToMinPBLevel?:	
	R1 = [EndPBLevel]
	R1 -= 2
	[R_PitchBendLevel] = R1
L_ExitSetPitchBendDn:	
	pop R1 from [sp]
	.ENDIF
	retf
	.endp	
	
//****************************************************************
// Function    : F_TonePitchBend
// Description : Modify the hardware frequency to generate the pitch bend effect according to the pitch bend level
// Pitch Bend Level: 04H = Down two semitones
//                   20H = Base pitch
//                   3FH = Up two semitones
// Destory     : 
// Parameter   : R1 = SPU Channel number, R_PitchBendLevel = Pitch bend Level
// Return      : 
// Note        : 
//****************************************************************
 _TonePitchBend:	.proc
 	R1 = SP + 3
 	R1 = [R1] 		// Channel number
F_TonePitchBend:
	.IF PITCH_BEND == D_ON
	push R2, R4 to [sp]
	R3 = R1 + R_ChNoteFs	
	R3 = [R3]		//;Get frequency low byte of pitch bend note
//	R2 = R1 + T_ChMap
//	R2 = [R2]
	R2 = R1 lsl 4
	R4 = 0x003f
	R4 -= [R_PitchBendLevel] 
	R4 += T_PitchBend
	R4 = [R4]
	MR = R3 * R4
	R4 = R4 lsl 4
	R4 = R4 lsl 4
	R3 = R3 lsr 4
	R4 = R4 lsr 4
	R4 |= R3
	R2 += P_SPU_Ch0_SampleFreq
	[R2] = R4
	pop R2, R4 from [sp]
	.ENDIF
	retf
	.endp	
	
//****************************************************************
// Function    : F_PlaySingleNote
// Description : Play a single note from instrument library (*.lib)
// Destory     : 
// Input: R_BackUpCh = SPU channel (0 ~ 7)
//        R_InstIndex = MIDI channel (0 ~ 15)
//        R_Note = Note pitch
//        R_ChInst = Instrument index
//        R_VeloVol = Volume X Velocity
// Return: 
// Note  :To prevent the instrument of a single note is changed while playing a MIDI.
//        The MIDI channel which is used for a single note should be reserved in the MIDI. 
//****************************************************************	
 _PlaySingleNote:	.proc
 	R4 = SP + 3
 	R1 = [R4++]
 	[R_BackUpCh] = R1	
 	R2 = [R4++]
 	[R_InstIndex] = R2
 	R3 = [R4++]
 	R1 += R_Note
 	[R1] = R3
 	R3 = [R4++]
 	R2 += R_ChInst
 	[R2] = R3
 	R3 = [R4]
	R1 = [R_BackUpCh]
	R1 += R_VeloVol
	[R1] = R3
F_PlaySingleNote:	
	push R1, R5 to [sp]
	R2 = [R_BackUpCh]
	cmp R2, D_ChannelNo
	ja L_ExitPlaySingleNote?
	call F_StopSound
	IRQ OFF
	R1 = R2 + R_ChStatus
	R3 = [R1]
	R3 &= ~(D_NoteOffFlag)
	[R1] = R3	
	IRQ ON
	
	R1 = R_SingleNote
	setb [R1], R2				//;Set flag
	R1 = R_SingleDrum
	clrb [R1], R2				//;If a single drum is played, clear it
	
	
	call F_InitialADSR
    call F_ChPlayTone
    //%TurnOnDAC                      ;Before playing a single note, the push-pull DAC must be turned on
L_ExitPlaySingleNote?:	
	pop R1, R5 from [sp]
	retf
	.endp
	
//;==========================================================================
//;Example for playing a single note with CH3
//;==========================================================================	
//	R1 = 0x0003					//;Play a single note with SPU CH3
//	[R_BackUpCh] = R1
//	R2 = R1 + R_InstIndex
//	[R2] = R1					//;MIDI channel of current SPU channel
//	
//	R3 = 0x0045
//	R2 = R1 + R_Note
//	[R2] = R3					//;Note pitch
//	
//	R3 = 0x0004
//	R2 = R1 + R_ChInst			
//	[R2] = R3					//;Instrument index
//	
//	R3 = 0x00fe
//	R4 = 0x007f
//	MR = R3 * R4
//	R3 = R3 lsr 4
//	R3 = R3 lsr 4
//	R2 = R1 + R_VeloVol
//	[R2] = R3 					//;Volume X Velocity
//	call F_PlaySingleNote		//;Play a single note

//****************************************************************
// Function    : F_PlaySingleDrum
// Description : Play a single drum from .lib file(Instrument Library)
// Destory     : 
// Input: R_BackUpCh = SPU channel (0 ~ 7)
//        R_DrumIndex = Drum index
//        R_VeloVol = Volume X Velocity
// Return: 
// Note  :
//****************************************************************	
 _PlaySingleDrum:	.proc
 	R4 = SP + 3
 	R1 = [R4++]
 	[R_BackUpCh] = R1	
 	R2 = [R4++]
 	[R_DrumIndex] = R2
 	R3 = [R4++]
	R1 = [R_BackUpCh]
	R1 += R_VeloVol
	[R1] = R3
F_PlaySingleDrum:
	push R1, R5 to [sp]
	R2 = [R_BackUpCh]
	cmp R2, D_ChannelNo
	ja L_ExitPlaySingleDrum?
	call F_StopSound
	IRQ OFF
	R1 = R2 + R_ChStatus
	R3 = [R1]
	R3 &= ~(D_NoteOffFlag)
	[R1] = R3	
	IRQ ON
	
	R1 = R_SingleDrum
	setb [R1], R2				//;Set flag
	R1 = R_SingleNote
	clrb [R1], R2				//;If a single drum is played, clear it

	call F_InitialDrumADSR
    call F_PlayDrum
    //%TurnOnDAC                      ;Before playing a single drum, the push-pull DAC must be turned on
L_ExitPlaySingleDrum?:
	pop R1, R5 from [sp]
	retf
	.endp
	
//;==========================================================================
//;Example for playing a single drum with CH2
//;==========================================================================
//	R1 = 0x0002					//;Play a single drum with SPU CH2
//	[R_BackUpCh] = R1	
//	R1 = 0x0003
//	[R_DrumIndex] = R1 			//;Drum index
//	
//	R3 = 0x00fe
//	R4 = 0x007f
//	MR = R3 * R4
//	R3 = R3 lsr 4
//	R3 = R3 lsr 4
//	R2 = R1 + R_VeloVol
//	[R2] = R3 					//;Volume X Velocity
//	call F_PlaySingleDrum		//;Play a single drum

//****************************************************************
// Function    : F_SingleNoteOff
// Description : Release a single note/drum on designated SPU channel
// Destory     : 
// Input:  R1 = SPU Channel number (0 ~ 7)
// Return: 
// Note  :
//****************************************************************	
 _SingleNoteOff:	.proc
	R1 = SP + 3
	R1 = [R1]
F_SingleNoteOff:
	push R2, R3 to [sp]
	cmp R1, D_ChannelNo
	ja L_ExitSingleNoteOff?
	IRQ OFF
	R2 = R1 + R_ChStatus
	R3 = [R2]
	R3 |= D_NoteOffFlag
	[R2] = R3
	IRQ ON
	R2 = R1 + R_Volume
	R3 = [R2]
	R3 &= 0xff00
	[R2] = R3
L_ExitSingleNoteOff?:	
	pop R2, R3 from [sp]
	retf
	.endp

//****************************************************************
// Function    : 
// Description : Start to play a midi with one key one note
// Destory     : 
// Input:  R1 = Instrument Index,but if R1 = 0x00ff, do not change instrument
// Return: 
// Note  :
//****************************************************************	
 _PlayOneKeyOneNote:	.proc 
 	R1 = SP + 3
 	R1 = [R1]
F_PlayOneKeyOneNote:
	.IF	OneKeyOneNote == D_ON	
	push R2 to [sp]
	R2 = [R_OKON_Status]
	test R2, D_OKON_ON
	jz ?L_InvalidKeyExit
	[R_ChangeInstIndex] = R1
	R2 = [R_OKON_Status]
	R2 |= D_OKON_Next
	[R_OKON_Status] = R2
?L_InvalidKeyExit:	
	pop R2 from [sp]
	.ENDIF
	retf
	.endp
	
//****************************************************************
// Function    : F_OneKeyOneNoteON
// Description : Setup flag for one key one note
// Destory     : 
// Input:  
// Return: 
// Note  :
//****************************************************************	
 _OneKeyOneNoteON:	.proc 
F_OneKeyOneNoteON:
	.IF	OneKeyOneNote == D_ON	
	push R1, R2 to [sp]
	R1 = [R_OKON_Status]
	test R1, D_OKON_ON
	jnz L_OKON_ONAlready?
	
	R2 = 0
L_StopLoop?:
	call F_StopSound				//;Stop all SPU channel	
	R2 += 1
	cmp R2, D_ChannelNo
	jb L_StopLoop?
	R1 = [R_OKON_Status]
	R1 |= D_OKON_ON
	[R_OKON_Status] = R1
L_OKON_ONAlready?:	
	pop R1, R2 from [sp]
	.ENDIF
	retf
	.endp	
	
//****************************************************************
// Function    : F_OneKeyOneNoteOFF
// Description : Clear flag of one key one note function
// Destory     : 
// Input:  
// Return: 
// Note  :
//****************************************************************		
 _OneKeyOneNoteOFF:		.proc	
F_OneKeyOneNoteOFF:	
	.IF	OneKeyOneNote == D_ON	
	push R1 to [sp]
	R1 = [R_OKON_Status]
	test R1, D_OKON_ON
	jz L_ExitOFF?
	R1 = 0
	[R_OKON_Status] = R1
	[R_DeltaTime] = R1
	R1 = [R_GuideChInst]
	[R_ChInst] = R1 
L_ExitOFF?:
	pop R1 from [sp]	
	.ENDIF
	retf;
	.endp
	
//****************************************************************
// Function    : F_OneKeyOneNoteRelease
// Description : Stop play note when key release
// Destory     : 
// Input:  
// Return: 
// Note  :
//****************************************************************		
 _OneKeyOneNoteRelease:		.proc
F_OneKeyOneNoteRelease:	 
	.IF	OneKeyOneNote == D_ON
	push R1, R5 to [sp]
	R1 = [R_MidiCh1NoteInSpu]
	[R_ADSRChannel] = R1
	call F_NoteOff
	pop R1, R5 from [sp]
	.ENDIF
	retf
	.endp
	 
//==========================================================================
//Purpose: Select dynamic allocation type
//Input: R2 = 0(Dynamic Off), 1(Oldest note out), 2(Newest note out), 3(Minimum volume note out)
//Return: None
//Destroy: A
//==========================================================================
F_SelectDynamic:	.proc
	cmp R2, 0
	je L_SetDynamicOff?
	cmp R2, 1
	je L_SetOldestNoteOut?
	cmp R2, 2
	je L_SetNewestNoteOut?
	cmp R2, 3
	je L_SetMinVolNoteOut?
	jmp L_SetOldestNoteOut?
L_SetDynamicOff?:	
	R3 = [R_MIDIStatus]
	R3 &= ~(D_NewestNoteOut + D_MinVolNoteOut)
	R3 |= D_DynaAllocOff
	[R_MIDIStatus] = R3
	retf;
L_SetOldestNoteOut?:
	R3 = [R_MIDIStatus]
	R3 &= ~(D_DynaAllocOff + D_NewestNoteOut + D_MinVolNoteOut)	
	[R_MIDIStatus] = R3
	retf;
L_SetNewestNoteOut?:
	R3 = [R_MIDIStatus]
	R3 &= ~(D_DynaAllocOff + D_MinVolNoteOut)
	R3 |= D_NewestNoteOut
	[R_MIDIStatus] = R3
	retf;
L_SetMinVolNoteOut?:
	R3 = [R_MIDIStatus]
	R3 &= ~(D_DynaAllocOff + D_NewestNoteOut)
	R3 |= D_MinVolNoteOut
	[R_MIDIStatus] = R3
	retf;
	.endp
	
//****************************************************************
// Function    : F_FindMinChVol
// Description : Find a channel of minimum volume and replace it
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_FindMinChVol:	.proc
	R1 = 0					//;Check current channel is busy or idle
	R2 = [P_SPU_CH_Ctrl]
	R2 &= 0x00ff			//;Bit[7:0]: SPU channelx enable/disable
L_CheckIdleCh?:
	tstb R2, R1				//;Is current channel busy
	jnz L_FindNextCh?
	
	//.IF SPEECH == D_ON
	R3 = R1 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jnz L_FindNextCh?
	//.ENDIF
	
	[R_BackUpCh] = R1
	
	.IF PITCH_BEND == D_ON
	R2 = 0xffff
	R3 = R1 + R_SpuMidiCh
	[R3] = R2
    .ENDIF
    
    retf;
	
L_FindNextCh?:	
	R1 += 1					//;Find next idle channel
	cmp R1, D_ChannelNo
	jb L_CheckIdleCh?
L_FindMinChVol:	
	R2 = 0x00ff
	[R_MIDITemp] = R2		//;Temporary for volume
	R2 = D_ChannelNo-1
	[R_BackUpCh] = R2		//;Temporary for channel
L_SearchLoop?:
	//.IF SPEECH == D_ON
	R3 = R2 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jnz L_NextChMinVol?
	//.ENDIF
	
	R1 = [R_SingleNote]		//;Check if a single note is played
	R1 |= [R_SingleDrum]	//;Check if a single drum is played
	tstb R1, R2
	jnz L_NextChMinVol?
	
	R3 = R2 + R_ChStatus
	R3 = [R3]
	test R3, D_NoteOffFlag
	jnz L_MinVolNoteOff?
	
//	R3 = R2 + T_ChMap
//	R3 = [R3]
	R3 = R2 lsl 4
	R1 = R3 + P_SPU_Ch0_Volume_Ctrl
	R1 = [R1]
	R1 &= 0x00ff 			//R_Ch0Vol[6:0] = VOL
	cmp R1, [R_MIDITemp]
	jae L_NextChMinVol?
	[R_MIDITemp] = R1		//;If Volume < R_MIDITemp, replace previous one
	[R_BackUpCh] = R2		//;Backup channel
L_NextChMinVol?:		
	R2 -= 1
	jpl L_SearchLoop?
	jmp L_MinVolChOff?

L_MinVolNoteOff?:
	[R_BackUpCh] = R2
L_MinVolChOff?:	
	R2 = [R_BackUpCh]
	
	.IF PITCH_BEND == D_ON
	R1 = 0xffff
	R3 = R2 + R_SpuMidiCh
	[R3] = R1
	.ENDIF
	
	call F_StopSound
	retf;
	.endp	
	
//****************************************************************
// Function    : F_FindNewestNote
// Description : Find newest note and replace it (Find maximum R_ChTime)	
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************		
F_FindNewestNote:	.proc                       //;Find newest note and replace it (Find maximum R_ChTime)	
	R1 = 0					//;Check current channel is busy or idle
	R2 = [P_SPU_CH_Ctrl]
	R2 &= 0x00ff			//;Bit[7:0]: SPU channelx enable/disable
L_CheckIdleCh?:				
	tstb R2, R1				//;Is current channel busy
	jnz L_FindNextCh?
	
	//.IF SPEECH == D_ON
	R3 = R1 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jnz L_FindNextCh?
	//.ENDIF
	
	[R_BackUpCh] = R1
	
	.IF PITCH_BEND == D_ON
	R2 = 0xffff
	R3 = R1 + R_SpuMidiCh
	[R3] = R2
    .ENDIF
	retf;
	
L_FindNextCh?:	
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_CheckIdleCh?
L_FindNewestNote:
	R2 = 0
	[R_MIDITemp] = R2		//;Temporary for volume
	R2 = D_ChannelNo-1
L_SearchLoop?:
	//.IF SPEECH == D_ON
	R3 = R2 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jnz L_CheckNextChTime?
    //.ENDIF
    
    R1 = [R_SingleNote]		//;Check if a single note is played
	R1 |= [R_SingleDrum]		//;Check if a single drum is played
	tstb R1, R2
	jnz L_CheckNextChTime?
    
	R3 = R2 + R_ChStatus
	R3 = [R3]
	test R3, D_NoteOffFlag
	jnz L_NewestNoteOff?
	
	R1 = R2 + R_ChTime
	R1 = [R1]
	cmp R1, [R_MIDITemp]
	jb L_CheckNextChTime?
	[R_MIDITemp] = R1		//;If R_ChTime > R_MIDITemp, replace previous one
	[R_BackUpCh] = R2		//;Backup channel
L_CheckNextChTime?:    
	R2 -= 1
	jpl L_SearchLoop?
	jmp L_NewestChOff?
	
L_NewestNoteOff?:
	[R_BackUpCh] = R2	
L_NewestChOff?:
	R2 = [R_BackUpCh]
	
	.IF PITCH_BEND == D_ON
	R1 = 0xffff
	R3 = R2 + R_SpuMidiCh
	[R3] = R1
	.ENDIF	
	
	call F_StopSound         //;Stop enabled channel to prevent the loop region error of original instrument/drum
    retf;
	.endp
	
//****************************************************************
// Function    : F_FindNewestNote
// Description : Find newest note and replace it (Find maximum R_ChTime)	
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
F_FindOldestNote:	.proc    //;Find oldest note and replace it (Find minimum R_ChTime)	
	R1 = 0					//;Check current channel is busy or idle
	R2 = [P_SPU_CH_Ctrl]
	R2 &= 0x00ff			//;Bit[7:0]: SPU channelx enable/disable
L_CheckIdleCh?:
	tstb R2, R1				//;Is current channel busy
	jnz L_FindNextCh?
	
	//.IF SPEECH == D_ON
	R3 = R1 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jnz L_FindNextCh?
	//.ENDIF
	
	[R_BackUpCh] = R1
	
	.IF PITCH_BEND == D_ON
	R2 = 0xffff
	R3 = R1 + R_SpuMidiCh
	[R3] = R2
    .ENDIF
		
	retf;
	
L_FindNextCh?:	
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_CheckIdleCh?
L_FindOldestNote:	
	R2 = 0xffff
	[R_MIDITemp] = R2		//;Temporary for volume
	R2 = D_ChannelNo-1
L_SearchLoop?:
	//.IF SPEECH == D_ON
	R3 = R2 + R_ChSpeechStatus
	R3 = [R3]
	test R3, D_SpeechPlaying
	jnz L_CheckNextChTime?
    //.ENDIF
    
    R1 = [R_SingleNote]		//;Check if a single note is played
	R3 = [R_SingleDrum]		//;Check if a single drum is played
	R1 |= R3
	tstb R1, R2
	jnz L_CheckNextChTime?
    
	R3 = R2 + R_ChStatus
	R3 = [R3]
	test R3, D_NoteOffFlag
	jnz L_OldestNoteOff?
	
	R1 = R2 + R_MidiDuration
	R1 = [R1]
	je L_OldestNoteOff?
	jmi L_OldestNoteOff?
	
	R1 = R2 + R_ChTime
	R1 = [R1]
	R3 = [R_MIDITemp]
	cmp R1, R3
	jae L_CheckNextChTime?
	[R_MIDITemp] = R1		//;If R_ChTime > R_MIDITemp, replace previous one
	[R_BackUpCh] = R2		//;Backup channel	
L_CheckNextChTime?:
	R2 -= 1
	jpl	L_SearchLoop?
	jmp L_OldestChOff?
	
L_OldestNoteOff?:	
	[R_BackUpCh] = R2
L_OldestChOff?:
	R2 = [R_BackUpCh]
	
	.IF PITCH_BEND == D_ON
	R1 = 0xffff
	R3 = R2 + R_SpuMidiCh
	[R3] = R1
	.ENDIF	
	
	call F_StopSound         //;Stop enabled channel to prevent the loop region error of original instrument/drum
    retf;
	.endp
	
//****************************************************************
// Function    : F_CheckMIDIChVol
// Description : Deal with the volume control of designated MIDI channel
// Destory     : 
// Parameter   : R2 = Channel number	
// Return      : R1 = New volume = R_VeloVol,X
// Note        : 
//****************************************************************		
F_CheckMIDIChVol: 	.proc
	push R2,R5 to [sp]
	R3 = R2 + R_InstIndex
	R3 = [R3]				 //;R3 = MIDI Channel
	R1 = [R_CtrlVolCh1ToCh16]
	R5 = 0
L_CtrlChxVol?:
	tstb R1, R5
	jz L_CheckNextCh?
	cmp R3, R5
	jne L_CheckNextCh?
	jmp L_SetVolLevel?
L_CheckNextCh?:
	R5 += 1	
	cmp R5, 0x0010
	jb L_CtrlChxVol?
	jmp L_ExitCheckMIDIChVol?
L_SetVolLevel?:	
	R3 = R2 + R_VeloVol
	R3 = [R3]
	R2 = [R_CtrlMIDIChVol]
	R4 = R2 + T_VolumeLevel
	R4 = [R4]
	MR = R3 * R4
	R2 = [R_BackUpCh]
	cmp R4, 0
	jne L_SetToMax?
	R1 = R3 lsr 4
	R1 = R1 lsr 4
	R1 &= 0x00ff
	cmp R1, 0x0080
	jb L_NonOverflow?
L_SetToMax?:	
	R1 = 0x007f
L_NonOverflow?:	
	R3 = R2 + R_VeloVol
	[R3] = R1
L_ExitCheckMIDIChVol?:	
	pop R2,R5 from [sp]
	retf;
	.endp	
	
GPCE5_MIDISquencer_CODE_ISR:		.section	.CODE	
//****************************************************************
// Function    : MIDI_DataCounter
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	
 _MIDI_DataCounter:	.proc
F_MIDI_DataCounter:
	push R1,R3 to [sp]	
	R1 = [R_4KIntCnt]
	R1 += 1
	[R_4KIntCnt] = R1
	cmp R1,D_TimerDiv4k
	jb	L_Not4000?
	R1 = 0
	[R_4KIntCnt] = R1
	R1 = [R_MIDIStatus]
	test R1, D_MIDIEn
	jz L_ExitDeltaTime?
	R1 = [R_MIDICtrl]
	test R1, D_PauseMIDI
	jnz L_ExitDeltaTime?
	
	R1 = [R_DTCounter]
	R1 += 1
	[R_DTCounter] = R1					//;Adjust tempo
	R2 = [R_TempoIndex]
	cmp R1, R2							//;Counter for delta time(tick), adjust tempo by R_TempoIndex
	jb L_ExitDeltaTime?
	R1 = 0
	[R_DTCounter] = R1					//;Reset counter
	R1 = [R_DeltaTime]					//;Delta Time - 1
	R1 -= 1
	[R_DeltaTime] = R1
L_DeltaTimeOut?:	
	//%ChkMidiDuration
	R1 = 0
L_ChkChDuraLoop?:
	R2 = R1 + R_MidiDuration
	R3 = [R2]
	jz L_ChkNextChDura?
	R3 -= 1								//;Decrease duration
	[R2] = R3
L_ChkNextChDura?:
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_ChkChDuraLoop?	
L_ExitDeltaTime?:	
	R1 = [R_1024IntCnt]
	R1 -= 1
	[R_1024IntCnt] = R1
	jnz L_Not4096Div4?
	R1 = 4							// 4096H/4
	[R_1024IntCnt] = R1
	//%ChkADSRTimeBase				// Time base of Check ADSR = 4*1000000/4096 = 976us
	R1 = [R_MIDIStatus]
	test R1, D_MIDIEn
	jnz L_GOTimeBase?
	R1 = [R_SingleNote]
	R1 |= [R_SingleDrum]
	jne L_GOTimeBase?
	jmp L_ExitChkTimeBaseCh?
L_Not4000?:		
	jmp L_ExitChkTimeBaseCh?
L_GOTimeBase?:	
	R1 = 0
L_ChkChTimeBase?:	
	R2 = R1 + R_EnvTimeBase
	R3 = [R2]
	je L_ChkNextTimeBase?
	R3 -= 1
	[R2] = R3
L_ChkNextTimeBase?:	
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_ChkChTimeBase?
L_ExitChkTimeBaseCh?:	
L_Not4096Div4?:	
	
	pop R1,R3 from [sp]	
	retf;
	.endp		
	

	
	
	
	