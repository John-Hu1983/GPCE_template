//==========================================================================
// File Name   : GEO.h
// Description :
// Written by  : Allen Yeh
// Last modified date:
//              2015/05/29
//==========================================================================
#ifndef	__GEO_h__
#define	__GEO_h__

extern void GEO_Initial(unsigned DrvMode);
extern void GEO_ServiceLoop(void);
extern void GEO_Resume(void);
extern void GEO_Pause(void);
extern void ISR_GEO_PWM_Service(void);
extern void ISR_GEO_DeltaTime_Service(void);
extern void GEO_Play(int);
extern void GEO_Stop(void);
extern unsigned int GEO_Status(void);
extern void USER_GEO_SetStartAddr(unsigned ResIdx);

#endif
//========================================================================================        
// End of GEO.h
//========================================================================================