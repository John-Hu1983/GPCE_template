//==========================================================================
// File Name   : A34Pro_fptr.inc
// Description : SACM A3400Pro API declaration
// Written by  : Ray Cheng
// Last modified date:
//              2005/12/26
//==========================================================================
.ifndef __A34Pro_fptr_INC__
.define __A34Pro_fptr_INC__

.external F_SACM_A34Pro_fptr_Initial
.external F_SACM_A34Pro_fptr_Play
.external F_SACM_A34Pro_fptr_Stop
.external F_SACM_A34Pro_fptr_Volume
.external F_SACM_A34Pro_fptr_Pause
.external F_SACM_A34Pro_fptr_Resume
.external F_SACM_A34Pro_fptr_Status
.external F_SACM_A34Pro_fptr_ServiceLoop
.external F_ISR_Ser_SACM_A34Pro_fptr

.external F_A34Pro_fptr_Event_Initial
.external F_A34Pro_fptr_Event_ServiceLoop
.external F_A34Pro_fptr_IO_Event_Enable
.external F_A34Pro_fptr_IO_Event_Disable
.external F_A34Pro_fptr_ISR_Evt_Ser

.endif
//========================================================================================        
// End of SACM_A34Pro_fptr.inc
//========================================================================================