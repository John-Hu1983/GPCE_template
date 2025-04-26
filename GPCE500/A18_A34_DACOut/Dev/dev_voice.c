#include "../Inc/includes.h"

audio_t a18;
audio_t a34;
struct soft_t audio_silent;

/*
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
  called internal
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
*/

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void _open_a1800_voice(unsigned menu)
{
  SACM_A1800_fptr_Stop();
  USER_A1800_fptr_SetStartAddr(menu);
  SACM_A1800_fptr_Play(Manual_Mode_Index, DAC1, 0);
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void _open_a3400_voice(unsigned menu)
{
  SACM_A34Pro_fptr_Stop();
  USER_A34Pro_fptr_SetStartAddr(menu);
  SACM_A34Pro_fptr_Play(Manual_Mode_Index, DAC1, 0);
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
int _is_a1800_free(void)
{
  return (SACM_A1800_fptr_Status() & 0x1) ? -1 : 0;
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
int is_a1800_silent(void)
{
  int res = -1;
  res = (_is_a1800_free() < 0 || a18.size > 0) ? -1 : 0;
  return res;
}

/*
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
  called external
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//
*/
const gpio_obj amplifier_mute = {GPCE_PB, 1};
/*
 * Argument in  :
 * Argument out :
 * Description  :
 */
void init_voice_equipment(void)
{
  SACM_A1800_fptr_Initial();            // A1800 initial
  USER_A1800_fptr_Volume(VOLUME_A1800); // Set volume of A1800
  A1800_fptr_Event_Initial();           // A1800 IO event initialization
  A1800_fptr_IO_Event_Enable();         // Enable IO event of A1800

  SACM_A34Pro_fptr_Initial();            // A3400Pro initial
  USER_A34Pro_fptr_Volume(VOLUME_A3400); // Set volume of A3400Pro
  A34Pro_fptr_Evt_Initial();             // A3400Pro IO event initialization
  A34Pro_fptr_IO_Evt_Enable();           // Enable IO event of A3400Pro

  SACM_Mixer_Init();        // Software mixer initialization (This is for A3400Pro)
  SACM_Mixer_Play(DAC2, 0); // Enable software mixer

  VolCompressInitial();
  SetVolCompressLevel(12);

  create_soft_timer(&audio_silent, Soft_Tp_Decrease);
  memset((void *)&a18, 0, sizeof(a18));
  memset((void *)&a34, 0, sizeof(a34));

  gpio_write_level(amplifier_mute.port, amplifier_mute.pin, true);
  play_a1800_decimal(12345, true);
}

/*
 * argument in  :   none
 * argument out :
 * description  :
 */
void play_a1800_string(char *str, bool renew)
{
  audio_t *audio = &a18;
  u8 ascll, ok, letter;
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
    letter = str[i] & 0xff;
    if (letter >= '0' && letter <= '9')
    {
      ok = 1;
      ascll = _N000_WAV - (letter - '0');
    }
    else if (letter >= 'a' && letter <= 'z')
    {
      ok = 1;
      ascll = _EN_A_16K_WAV - (letter - 'a');
    }
    else if (letter >= 'A' && letter <= 'Z')
    {
      ok = 1;
      ascll = _EN_A_16K_WAV - (letter - 'A');
    }
    else if (letter == ' ')
    {
      ok = 1;
      ascll = SILENT_SEVERAL;
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
void play_a1800_decimal(u16 dat, bool renew)
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
void play_a1800_music(u16 music, bool renew)
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
 * Argument in  :
 * Argument out :
 * Description  :
 */
void Kernel_SACM_Process(void)
{
  char read;
  SACM_A1800_fptr_ServiceLoop();
  SACM_Mixer_ServiceLoop();
  // A34Pro_fptr_Evt_ServiceLoop();
  // GEO_ServiceLoop();

  if (audio_silent.timer.member.ms)
  {
    return;
  }

  if (_is_a1800_free() > -1 && _pull_(&a18, &read) > -1)
  {
    if (read == SILENT_SEVERAL)
    {
      audio_silent.timer.member.ms = 100;
      return;
    }
    else
    {
      _open_a1800_voice(read);
    }
  }
}
