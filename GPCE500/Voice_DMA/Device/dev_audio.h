#ifndef _DEV_AUDIO_H_
#define _DEV_AUDIO_H_

#define AUDIO_SIZE_LIMIT (64)
typedef struct
{
  u16 buf[AUDIO_SIZE_LIMIT];
  u16 insert;
  u16 drag;
  u16 size;
} audio_t;
#define SILENT_SEVERAL 0xffff

typedef enum
{
  N000_A18 = 0,
  N001_A18,
  N002_A18,
  N003_A18,
  N004_A18,
  N005_A18,
  N006_A18,
  N007_A18,
  N008_A18,
  N009_A18,
  N010_A18,
  EN_A_A18,
  EN_B_A18,
  EN_C_A18,
  EN_D_A18,
  EN_E_A18,
  EN_F_A18,
  EN_G_A18,
  EN_H_A18,
  EN_I_A18,
  EN_J_A18,
  EN_K_A18,
  EN_L_A18,
  EN_M_A18,
  EN_N_A18,
  EN_O_A18,
  EN_P_A18,
  EN_Q_A18,
  EN_R_A18,
  EN_S_A18,
  EN_T_A18,
  EN_U_A18,
  EN_V_A18,
  EN_W_A18,
  EN_X_A18,
  EN_Y_A18,
  EN_Z_A18,
  DANCEICE_A18,
  DANGER_A18,
  HATCHSONG_A18,
  TAILOR3_A18,
  MICHAEL_A18,


  SILENT_500MS,
} a1800_menu_ascll;

//**************************************************************************
// Contant Defintion Area
//**************************************************************************
#define Drive_mode 0
#define Sink_mode 1

#define SPIFCHighDrivingCheck 0
#define MIDI_File_Max 6

//**************************************************************************
// Global Variable Defintion Area
//**************************************************************************
void GotoSleep(unsigned Mode);
void SACM_Mixer_Init(void);
void SACM_Mixer_ServiceLoop(void);
void SACM_Mixer_Play(unsigned Channel, unsigned RampSet);
void VolCompressInitial(void);
void SetVolCompressLevel(unsigned Lev);
void SPUPowerUpInitial(void);
void MIDIPowerUpInitial(void);
void SpeechPowerUpInitial(void);
void MIDI_Play(unsigned MidiIdx, unsigned DynamicType);
void CheckMidiDuration(void);
void ServiceMIDI(void);
void CheckADSR(void);

void SACM_Mixer_CH2_ServiceLoop(void);
void SACM_Mixer_CH2_Init(void);
void SACM_Mixer_CH2_Play(unsigned, unsigned);

void init_audio_equipment(void);
void Kernel_SACM_Process(void);
bool is_a1800_free(void);
void play_a1800_string(char *str, bool renew);
void play_a1800_decimal(u16 dat, bool renew);
void play_a1800_music(u16 music, bool renew);
bool is_voice_free(void);
#endif