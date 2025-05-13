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

//**************************************************************************
// Function Call Publication Area
//**************************************************************************
void VolCompressInitial(void);
void SetVolCompressLevel(unsigned Lev);
void SACM_Mixer_Init(void);
void SACM_Mixer_ServiceLoop(void);
void SACM_Mixer_Play(unsigned Channel, unsigned RampSet);

void init_audio_equipment(void);
void play_a1800_string(char *str, bool renew);
void play_a1800_decimal(u16 dat, bool renew);
void play_a1800_music(u16 music, bool renew);
void task_audio_process(osvar_t ms);

#endif