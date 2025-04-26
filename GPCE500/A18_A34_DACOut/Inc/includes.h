#ifndef _INCLUDE_H_
#define _INCLUDE_H_

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <math.h>

#include "GPCE36_CE5.h"
#include "Resource.h"
#include "SACM.h"
#include "System.h"
#include "SPI_Flash.h"

#include "../Inc/typedef.h"
#include "../Inc/usr_config.h"

#include "./voice/SpinVoice.h"

#include "../Phy/phy_adc.h"
#include "../Phy/phy_gpio.h"
#include "../Phy/phy_iopwm.h"
#include "../Phy/phy_uart.h"
#include "../Phy/phy_spi.h"
#include "../Phy/phy_ext.h"
#include "../Phy/phy_i2c.h"

#include "../Dev/board.h"
// #include "../Dev/dev_leds.h"
#include "../Dev/dev_voice.h"
// #include "../Dev/dev_motor.h"
// #include "../Dev/dev_proximity_sensor.h"
#include "../Dev/dev_cap_touch.h"
// #include "../Dev/dev_aled104.h"
// #include "../Dev/dev_sleep.h"
#include "../Dev/dev_button.h"

// #include "../Math/pid_control.h"

// #include "../Gui/gui_font.h"

#include "../Kernel/os_beason.h"
#include "../Kernel/kernel.h"

// #include "../APP/app_examine.h"
// #include "../APP/app_shell.h"

#endif
