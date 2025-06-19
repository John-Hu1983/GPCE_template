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
bool_t is_a1800_free(void);
void play_a1800_string(char *str, bool_t renew);
void play_a1800_decimal(u16 dat, bool_t renew);
void play_a1800_music(u16 music, bool_t renew);
#endif