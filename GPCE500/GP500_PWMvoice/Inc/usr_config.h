#ifndef _USR_CONFIG_H_
#define _USR_CONFIG_H_

#define WATCH_DOG_ENABLE                (1)
#define ADC_TRIGGER_BY_TIM              (0)

#define CAP_TOUCH_EN                    (1)
#define SHELL_LOG_EN                    (0)
#define PCBA_CHECK_MODE                 (0)

//************************voice********************************
#define VOLUME_A1800                    (10)    // maximum :15
#define VOLUME_A3400                    (10)    // maximum :15
#define VOICE_COMPRESS                  (12)    // maximum : 25

//************************RFID********************************
#define RF_ROLE_MASTER                  (0)
#define RF_ROLE_CLIENT                  (1)
#define RF_ROLE_SELECT                  (RF_ROLE_CLIENT)

#endif
