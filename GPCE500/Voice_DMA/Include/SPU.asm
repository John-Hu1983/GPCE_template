//**************************************************************************
// Header File Included Area
//**************************************************************************
.include GPCE36_CE5.inc

//**************************************************************************
// External Table Declaration
//**************************************************************************

//**************************************************************************
// Contant Defintion Area
//**************************************************************************
.define		D_ChannelNo		8
.define 	D_ON			1
.define 	D_OFF 			0


//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public 	_SPUPowerUpInitial
.public 	F_SPUPowerUpInitial
.public 	R_ChSpeechStatus
//**************************************************************************
// RAM Definition Area
//**************************************************************************
.RAM
R_ChSpeechStatus:       .dw     D_ChannelNo 	DUP(?)     //For each SPU channel
.define		D_SpeechPlaying 	0x0008
.define		D_SpeechRepeat      0x0004	
.define		D_SpeechPause   	0x0002	
.define		D_SpeechZCJump  	0x0001 
//*****************************************************************************
// Table Definition Area
//*****************************************************************************
.TEXT
.public 	T_ChMap
T_ChMap:
    .dw     0x0000
    .dw     0x0010
    .dw     0x0020
    .dw     0x0030
    .dw     0x0040
    .dw     0x0050
    .dw     0x0060
    .dw     0x0070
    
.public 	T_ChEnableLB   
.public 	T_ChEnableHB     
T_ChEnableLB:                             //Enable Channel
    .dw     0x0001
    .dw     0x0002 
    .dw     0x0004
    .dw     0x0008
    .dw     0x0010 
    .dw     0x0020
    .dw     0x0040
    .dw     0x0080
T_ChEnableHB:                             //Enable Channel
    .dw     0x0100
    .dw     0x0200 
    .dw     0x0400
    .dw     0x0800
    .dw     0x1000 
    .dw     0x2000
    .dw     0x4000
    .dw     0x8000    
    
.public 	T_ChDisableLB   
.public 	T_ChDisableHB   
T_ChDisableLB:                            //Disable Channel
    .dw     0xfffe
    .dw     0xfffd 
    .dw     0xfffb
    .dw     0xfff7
    .dw     0xffef
    .dw     0xffdf
    .dw     0xffbf
    .dw     0xff7f
T_ChDisableHB:                            //Disable Channel
    .dw     0xfeff
    .dw     0xfdff 
    .dw     0xfbff
    .dw     0xf7ff
    .dw     0xefff
    .dw     0xdfff
    .dw     0xbfff
    .dw     0x7fff    
    
//**************************************************************************
// CODE Definition Area
//**************************************************************************
.CODE    
//****************************************************************
// Function    : F_SPUPowerUpInitial
// Description : 
// Destory     : 
// Parameter   : 
// Return      : 
// Note        : 
//****************************************************************	    
 _SPUPowerUpInitial:	.proc
F_SPUPowerUpInitial:
	push R1, R3 to [sp]
	R1 = 0
	R3 = 0
L_ClrLoop?:	
	R2 = R1 + R_ChSpeechStatus
	[R2] = R3
	R1 += 1
	cmp R1, D_ChannelNo
	jb L_ClrLoop?		
	pop R1, R3 from [sp]
	retf
	.endp