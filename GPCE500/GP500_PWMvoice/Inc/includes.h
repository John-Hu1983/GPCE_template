#ifndef _OVERALL_H_
#define _OVERALL_H_

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <math.h>

#include "System.h"
#include "GPCE36_CE5.h"
#include "SACM.h"
#include "Resource.h"
#include "GEO.h"

#include "../Inc/typedef.h"
#include "../Inc/usr_config.h"

#include "./voice/SpinVoice.h"

#include "../Phy/phy_adc.h"
#include "../Phy/phy_timer.h"
#include "../Phy/phy_gpio.h"
#include "../Phy/phy_iopwm.h"
#include "../Phy/phy_uart.h"
#include "../Phy/phy_spi.h"
#include "../Phy/phy_ext.h"
#include "../Phy/phy_ccp.h"
#include "../Phy/phy_i2c.h"

#include "../Device/board.h"
#include "../Device/dev_audio.h"
#include "../Device/dev_cap_touch.h"
#include "../Device/dev_sleep.h"
#include "../Device/dev_button.h"

#include "../Apps/app_shell.h"
#include "../Apps/app_operate.h"

#include "../Kernel/os_beason.h"
#include "../Kernel/kernel.h"

#endif
