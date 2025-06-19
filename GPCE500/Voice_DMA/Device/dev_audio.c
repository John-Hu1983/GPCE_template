#include "../Inc/includes.h"
audio_t a18;
audio_t a34;
struct soft_t audio_silent;

//===============only for inside =====================================
/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void _sacm_running_core(void)
{
#if A1800_OPEN
#if A1800_DMA_EN
  SACM_Mixer_CH2_ServiceLoop();
#else
  SACM_A1800_fptr_ServiceLoop();
#endif
#endif

#if A3400_OPEN
  SACM_Mixer_ServiceLoop();
#endif

#if MIDI_OPEN
  CheckMidiDuration();
  ServiceMIDI();
  CheckADSR();
#endif
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void _play_a1800_automatically(void)
{
  SACM_A1800_fptr_Stop();
  SACM_A1800_fptr_Play(Auto, DAC1, 0);
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void _play_a1800_manually(u16 inx)
{
  SACM_A1800_fptr_Stop();
  USER_A1800_fptr_SetStartAddr(inx);                // Set start address
  SACM_A1800_fptr_Play(Manual_Mode_Index, DAC1, 0); // Play A1800 via Manual mode
}

/*
 * argument in  :
 * argument out :
 * description  :
 */
void _play_a3400_automatically(void)
{
  SACM_A34Pro_fptr_Stop(); // Play A3400Pro via Auto mode
  SACM_A34Pro_fptr_Play(0, DAC1, 0);
}

/*
 * argument in  : RES_THEM2_SEEKCTRL_001_SP4_SA
 * argument out :
 * description  :
 */
void _play_a3400_manually(u16 addr)
{
  SACM_A34Pro_fptr_Stop();
  USER_A34Pro_fptr_SetStartAddr(addr);               // Set start address
  SACM_A34Pro_fptr_Play(Manual_Mode_Index, DAC1, 0); // Play A3400Pro via Manual mode
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
int _push_(audio_t *fifo, u8 asc)
{
  fifo->buf[fifo->insert++] = asc;
  if (fifo->insert >= AUDIO_SIZE_LIMIT)
  {
    fifo->insert = 0;
  }
  fifo->size++;
  return 0;
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
int _pull_(audio_t *fifo, u8 *res)
{
  if (fifo->size == 0)
  {
    return -1;
  }

  *res = fifo->buf[fifo->drag++] & 0xff;
  if (fifo->drag >= AUDIO_SIZE_LIMIT)
  {
    fifo->drag = 0;
  }
  fifo->size--;
  return 0;
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
int _is_sacm_a18_free(void)
{
  return (SACM_A1800_fptr_Status() & 0x1) ? -1 : 0;
}

//=============== for outside =====================================
/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void init_audio_equipment(void)
{
#if A1800_OPEN
  SACM_A1800_fptr_Initial();            // A1800 initial
  USER_A1800_fptr_Volume(VOLUME_A1800); // Set volume of A1800
#if A1800_EVENT
  A1800_fptr_Event_Initial();   // A1800 IO event initialization
  A1800_fptr_IO_Event_Enable(); // Enable IO event of A1800
#endif
  SACM_Mixer_CH2_Init();        // Software mixer initialization (This is for A1800)
  SACM_Mixer_CH2_Play(DAC2, 0); // Enable software mixer
#endif

#if A3400_OPEN
  SACM_A34Pro_fptr_Initial();            // A3400Pro initial
  USER_A34Pro_fptr_Volume(VOLUME_A3400); // Set volume of A3400Pro
#if A3400_EVENT
  A34Pro_fptr_Evt_Initial();   // A3400Pro IO event initialization
  A34Pro_fptr_IO_Evt_Enable(); // Enable IO event of A3400Pro
#endif
  SACM_Mixer_Init();        // Software mixer initialization (This is for A3400Pro)
  SACM_Mixer_Play(DAC1, 0); // Enable software mixer
#endif

#if MIDI_OPEN
  SPUPowerUpInitial();
  MIDIPowerUpInitial();
  SpeechPowerUpInitial();
#endif

  VolCompressInitial();
  SetVolCompressLevel(VOICE_COMPRESS);

  create_soft_timer(&audio_silent, Soft_Tp_Decrease);
  memset((void *)&a18, 0, sizeof(a18));
  memset((void *)&a34, 0, sizeof(a34));
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void play_a1800_string(char *str, bool_t renew)
{
  audio_t *audio = &a18;
  u8 ascll, ok;
  u16 len, i;

  if (renew == true)
  {
    audio->size = 0;
    audio->insert = 0;
    audio->drag = 0;
  }

  len = strlen(str);
  for (i = 0; i < len; i++)
  {
    ok = 0;
    if (str[i] >= '0' && str[i] <= '9')
    {
      ok = 1;
      ascll = str[i] - '0' + N000_A18;
    }
    else if (str[i] >= 'a' && str[i] <= 'z')
    {
      ok = 1;
      ascll = str[i] - 'a' + EN_A_A18;
    }
    else if (str[i] >= 'A' && str[i] <= 'Z')
    {
      ok = 1;
      ascll = str[i] - 'A' + EN_A_A18;
    }
    else if (str[i] == ' ')
    {
      ok = 1;
      ascll = SILENT_500MS;
    }
    if (ok)
    {
      _push_(audio, ascll);
    }
  }
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void play_a1800_decimal(u16 dat, bool_t renew)
{
  char buf[32];
  memset(buf, '\0', sizeof(buf));
  sprintf(buf, "%d", dat);
  play_a1800_string(buf, renew);
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void play_a1800_music(u16 music, bool_t renew)
{
  audio_t *audio = &a18;
  if (renew == true)
  {
    audio->size = 0;
    audio->insert = 0;
    audio->drag = 0;
  }
  _push_(audio, music);
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
bool_t is_a1800_free(void)
{
  return (_is_sacm_a18_free() < 0 || a18.size > 0) ? false : true;
}

/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void Kernel_SACM_Process(void)
{
  // char read;
  _sacm_running_core();
  // if (audio_silent.timer.member.ms)
  // {
  //   return;
  // }

  // if (_is_sacm_a18_free() > -1 && _pull_(&a18, &read) > -1)
  // {
  //   if (read == SILENT_SEVERAL)
  //   {
  //     audio_silent.timer.member.ms = 100;
  //     return;
  //   }
  //   else
  //   {
  //     _play_a1800_manually(read);
  //   }
  // }
}