//==========================================================================
// File Name   : ORAM_Arrangement.asm
// Description : SACM kernel ORAM arrangement
// Written by  : Benjamin Xu
// Last modified date: 2019/10/16
//==========================================================================


//**************************************************************************
// RAM Definition Area 
//**************************************************************************
OVERLAP_MIXER_RAM_BLOCK:				.section 	.ORAM 	,.addr = 0x10
R_OVERLAP_MIXER_RAM_BLOCK:				.DW 	0x103	DUP(?)
OVERLAP_A18_DACOUT_RAM_BLOCK:			.section 	.ORAM 	,.addr = 0x10 + 0x103
R_OVERLAP_A18_DACOUT_RAM_BLOCK:			.DW 	0x280	DUP(?)
OVERLAP_A1800_fptr_API_BLOCK:			.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280
R_OVERLAP_A1800_fptr_API_BLOCK:			.DW 	0x3	DUP(?)
OVERLAP_A1800_fptr_EVENT_BLOCK:			.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280 + 0x3
R_OVERLAP_A1800_fptr_EVENT_BLOCK:		.DW 	0x5	DUP(?)
OVERLAP_A1800_fptr_RAM_BLOCK:			.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280 + 0x3 + 0x5
R_OVERLAP_A1800_fptr_RAM_BLOCK:			.DW 	0x3E	DUP(?)
OVERLAP_A1800_DM_BLOCK_Global:			.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280 + 0x3 + 0x5 + 0x3E
R_OVERLAP_A1800_DM_BLOCK_Global:		.DW 	0xB5	DUP(?)
OVERLAP_A1800_DM_BLOCK_Local:			.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280 + 0x3 + 0x5 + 0x3E + 0xB5
R_OVERLAP_A1800_DM_BLOCK_Local:			.DW 	0x14C	DUP(?)
OVERLAP_A34Pro_fptr_API_BLOCK:			.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280 + 0x3 + 0x5 + 0x3E + 0xB5 + 0x14C
R_OVERLAP_A34Pro_fptr_API_BLOCK:		.DW 	0x16	DUP(?)
OVERLAP_A34Pro_fptr_EVENT_BLOCK:		.section 	.ORAM 	,.addr = 0x10 + 0x103 + 0x280 + 0x3 + 0x5 + 0x3E + 0xB5 + 0x14C + 0x16
R_OVERLAP_A34Pro_fptr_EVENT_BLOCK:		.DW 	0x5		DUP(?)

