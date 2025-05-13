
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
	
.public T_SACM_A34Pro_fptr_SpeechTable;
T_SACM_A34Pro_fptr_SpeechTable:
	
.public T_GEO_Table
T_GEO_Table:
