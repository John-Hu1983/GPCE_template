//==========================================================================
// File Name   : main.c
// Description : 
// Programmer : Jerry Hsu
// Last modified date: 2023/12/13
// Version: 
// Note: 
//==========================================================================
//**************************************************************************
// Header File Included Area
//**************************************************************************
#include "GPCE36_CE5.h"
#include "SACM.h"
#include "Resource.h"


//**************************************************************************
// Contant Defintion Area
//**************************************************************************
#define Drive_mode    0
#define Sink_mode     1

#define SPIFCHighDrivingCheck 	0


//**************************************************************************
// Function Call Publication Area
//**************************************************************************
void VolCompressInitial(void);
void SetVolCompressLevel(unsigned Lev);
void SACM_Mixer_Init(void);
void SACM_Mixer_ServiceLoop(void);
void SACM_Mixer_Play(unsigned Channel, unsigned RampSet);

//**************************************************************************
// Global Variable Defintion Area
//**************************************************************************
unsigned Key;
unsigned A3400Pro_Idx = 0;          //in fileMerger rom bin  12 ~ 22 is A3400_Idx
unsigned A1800_Idx = 0;             //in fileMerger rom bin  0 ~ 11 is A1800_Idx

//***************************************************************************************
// Main Function Area
//***************************************************************************************
int main()
{		
//add your code here
	Key = 0;
	
	System_Initial();			          	// System initial
	
	SACM_A1800_fptr_Initial();            // A1800 initial
	USER_A1800_fptr_Volume(9);			  // Set volume of A1800
	A1800_fptr_Event_Initial();			  // A1800 IO event initialization
	A1800_fptr_IO_Event_Enable();		  // Enable IO event of A1800
	
	SACM_A34Pro_fptr_Initial();		      // A3400Pro initial	
	USER_A34Pro_fptr_Volume(9);			  // Set volume of A3400Pro
	A34Pro_fptr_Evt_Initial();			  // A3400Pro IO event initialization
	A34Pro_fptr_IO_Evt_Enable();		  // Enable IO event of A3400Pro
	
	SACM_Mixer_Init();					  // Software mixer initialization (This is for A3400Pro)
	SACM_Mixer_Play(DAC2, 0);			  // Enable software mixer
	
	VolCompressInitial();
	SetVolCompressLevel(12);
	
	SACM_A1800_fptr_Stop();
	A1800_Idx = 0;
	USER_A1800_fptr_SetStartAddr(A1800_Idx);
	SACM_A1800_fptr_Play(Manual_Mode_Index, DAC1, 0);
	
	//GEO_Initial(Drive_mode);  			  // GEO initialization (GEO = Generalplus Event Only)
		
	while(1)
	{
		Key = SP_GetCh();
		switch(Key)
		{	
			case 0x0001:	// IOA0 + Vcc
				SACM_A1800_fptr_Stop();
				A1800_Idx ++;
				if((A1800_Idx < 0) || (A1800_Idx >= 12))    //in fileMerger rom bin  0 ~ 11 is A1800_Idx
					A1800_Idx = 0;
				USER_A1800_fptr_SetStartAddr(A1800_Idx);    // Set index address
				SACM_A1800_fptr_Play(Manual_Mode_Index, DAC1, 0);	//Play A1800 Auto mode
				break;
			
			case 0x0002:	// IOA1 + Vcc
				SACM_A1800_fptr_Stop();
				
				break;
	
			case 0x0004:	// IOA2 + Vcc
				SACM_A34Pro_fptr_Stop();
				A3400Pro_Idx ++;			
				if((A3400Pro_Idx < 12) || (A3400Pro_Idx >= 23))  //in fileMerger rom bin  12 ~ 22 is A3400_Idx
					A3400Pro_Idx = 12;
				USER_A34Pro_fptr_SetStartAddr(A3400Pro_Idx);	// Set index address 
				SACM_A34Pro_fptr_Play(Manual_Mode_Index, DAC1, 0);    //Play A3400Pro Auto mode
				break;
	
			case 0x0008:	// IOA3 + Vcc
				SACM_A34Pro_fptr_Stop();
				
				break;
				
			case 0x0010:	// IOA4 + Vcc
				
				break;
				
			case 0x0020:	// IOA5 + Vcc
				
				break;
				
				
			default:
				break;
		} // end of switch
		
		
		SACM_A1800_fptr_ServiceLoop();
		SACM_Mixer_ServiceLoop();

		System_ServiceLoop();
	}
	
	return 0;
}