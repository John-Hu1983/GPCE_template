
// Resource Table
// Created by IDE, Do not modify this table

.CODE
.public _RES_Table;
.public _SPI_Resources_Folder_Table;
.external __RES_SPINVOICE_BIN_sa
.public _RES_SPINVOICE_BIN_SA;
.external __RES_SPINVOICE_BIN_ea;
.public _RES_SPINVOICE_BIN_EA;


_RES_Table:


_SPI_Resources_Folder_Table:

_RES_SPINVOICE_BIN_SA:
	.DW offset __RES_SPINVOICE_BIN_sa,seg16 __RES_SPINVOICE_BIN_sa;
_RES_SPINVOICE_BIN_EA:
	.DW offset __RES_SPINVOICE_BIN_ea,seg16 __RES_SPINVOICE_BIN_ea;


// End Table
.public T_SACM_A1800_fptr_SpeechTable;
T_SACM_A1800_fptr_SpeechTable:
	; .DW offset __RES_TAILOR3_16K_A18_sa,seg16 __RES_TAILOR3_16K_A18_sa;
	
.public T_SACM_A34Pro_fptr_SpeechTable;
T_SACM_A34Pro_fptr_SpeechTable:
	; .DW offset __RES_ANIMALS02_34K_SP4_sa,seg16 __RES_ANIMALS02_34K_SP4_sa;
	; .DW offset __RES_ANIMALS03_34K_SP4_sa,seg16 __RES_ANIMALS03_34K_SP4_sa;
	; .DW offset __RES_ANIMALS04_34K_SP4_sa,seg16 __RES_ANIMALS04_34K_SP4_sa;
	; .DW offset __RES_ANIMALS08_34K_SP4_sa,seg16 __RES_ANIMALS08_34K_SP4_sa;	
	
.public T_GEO_Table
T_GEO_Table:
//	.DW offset __RES_GEO_3SEC_GEA_GEO_sa,seg16 __RES_GEO_3SEC_GEA_GEO_sa;
