//==========================================================================
// File Name   : VolCompress.asm
// Description : Users implement functions
// Written by  : Ray Cheng
// Last modified date:
//              2021/03/18
// Note: 
//==========================================================================
//**************************************************************************
// Header File Included Area
//**************************************************************************



//**************************************************************************
// Table Publication Area
//**************************************************************************


//***************************************************************************************
// User Definition Section for IO Event
//***************************************************************************************



//**************************************************************************
// Contant Defintion Area
//**************************************************************************


//**************************************************************************
// Variable Publication Area
//**************************************************************************


//**************************************************************************
// Function Call Publication Area
//**************************************************************************
.public  _SetVolCompressLevel
.public F_SetVolCompressLevel


//**************************************************************************
// External Function Declaration
//**************************************************************************
.external F_VolCompressSetValue


//**************************************************************************
// External Table Declaration
//**************************************************************************


//**************************************************************************
// RAM Definition Area
//**************************************************************************
.RAM


//*****************************************************************************
// Table Definition Area
//*****************************************************************************
//.TEXT
.CODE
T_VolCompressLevel:	
.dw 0x0809, 0x0904, 0x0A1E, 0x0B5A
.dw 0x0CBD, 0x0E4B, 0x1009, 0x11FE
.dw 0x1430, 0x16A7, 0x196B, 0x1C85
.dw 0x2000
.dw 0x23E7, 0x2849, 0x2D33, 0x32B7
.dw 0x38E7, 0x3FD9, 0x47A3, 0x5061
.dw 0x5A30, 0x6531, 0x718A, 0x7F64



//**************************************************************************
// CODE Definition Area
//**************************************************************************
.CODE
//****************************************************************
// Function    : F_SetVolCompressLevel
// Description : Hardware initilazation for A1800, called by library
// Destory     : R1
// Parameter   : None
// Return      : None
// Note        : None
//****************************************************************
 _SetVolCompressLevel:	.proc
	R1 = SP + 3;
	R1 = [R1];
F_SetVolCompressLevel:
	//DS = SEG16 T_VolCompressLevel
	R2 = SEG16 T_VolCompressLevel
	R1 += T_VolCompressLevel;
	R2 += 0, CARRY
	DS = R2
	R1 = D:[R1];
	call F_VolCompressSetValue;
	retf;
	.endp
