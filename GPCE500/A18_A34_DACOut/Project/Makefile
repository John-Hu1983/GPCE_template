#####################################################################
#																	 
#	Created by u'nSP IDE V4.1.1		08:52:15	04/26/25
#
#####################################################################




COMPILEDATE = %date:~0,4%%date:~5,2%%date:~8,2%

COMPILEDATE_ = %date:~0,4%-%date:~5,2%-%date:~8,2%

COMPILETIME = %time:~0,2%%time:~3,2%%time:~6,2%

PRJDIR	= D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project

APPDIR	= C:\PROGRA~2\GENERA~1\UNSPID~2.1

USERDIR	= C:\Users\hujia\AppData\Roaming\Generalplus\unSPIDE

OUTDIR	= .\Debug

MK	= $(APPDIR)\make

CC	= "$(APPDIR)\toolchain\udocc"

AS	= "$(APPDIR)\toolchain\xasm16"

LD	= "$(APPDIR)\toolchain\xlink16_GPCE3"

LDIRAM0	= "$(APPDIR)\toolchain\xlink16_GPCE3_IRAM0"

AR	= "$(APPDIR)\toolchain\xlib16"

RESC	= "$(APPDIR)\toolchain\resc"

RM	= del	/F	1>NUL	2>NUL

STRIP	= "$(APPDIR)\toolchain\stripper"

S37STRIP	= "$(APPDIR)\toolchain\BinaryFileStripper"

RD	= rd /S /Q

GETCHKSUM	= "$(APPDIR)\toolchain\GetChecksum"

HDBPACKER	= "$(APPDIR)\toolchain\HDBPacker"

BOOTPACKER	= "$(APPDIR)\toolchain\BootPacker" 

LIKMODIFIER	= "$(APPDIR)\toolchain\unSP_LIKModifier" 

INCLUDES	= -I"D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Project" -I"C:/Program Files (x86)/Generalplus/unSPIDE_4.1.1/library/include" -I"C:/Program Files (x86)/Generalplus/unSPIDE_4.1.1/library/include/sys" -I"../Include" -I"../Library"

BODY	= -body GPCE500A -nobdy -bfile "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\GPCE500A_DacSpk.bdy"

BODYFILE	= "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\GPCE500A_DacSpk.bdy" 

BINFILE	= "$(OUTDIR)\GPCE500A_DacSpk.TSK"

PRJNAME = GPCE500A_DacSpk

BODYNAME = GPCE500A

SWTOOLID = 0x0008

IDEBUILDVER = 0x04010100

BINFILENOEXT	= $(OUTDIR)\GPCE500A_DacSpk

ARYFILE	= "$(OUTDIR)\GPCE500A_DacSpk.ary"

SBMFILE	= "$(OUTDIR)\GPCE500A_DacSpk.sbm"

PKINFOFILE	= "$(BINFILENOEXT).pki"

OPT	= -S -gstabs -Wall -mnonb_data -mglobal-var-ram -mISA=2.0

ASFLAGS	= -t4 -d -sr -Wno-A2013

CASFLAGS	= -t4 -sr -Wno-A2013 -wpop

CFLAGS	= $(OPT) -B$(APPDIR)\toolchain\ $(INCLUDES) 

BINTYPE	= -at

LDFLAGS	= -Wno-L0062 -blank 0x00 -initdata -infblk "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\GPCE500A_DacSpk.inb" -conf "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\Body\GPCE5\Checksum\GPCE5.cks"

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\SpinVoice_bin.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\BootCode_User.obj" \
	"$(OUTDIR)\SACM_A34Pro_fptr_User.obj" \
	"$(OUTDIR)\SACM_A1800_fptr_User.obj" \
	"$(OUTDIR)\SACM_Mixer_User.obj" \
	"$(OUTDIR)\VolCompress_User.obj" \
	"$(OUTDIR)\SPI_Flash.obj" \
	"$(OUTDIR)\ORAM_Arrangement.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\phy_adc.obj" \
	"$(OUTDIR)\phy_ext.obj" \
	"$(OUTDIR)\phy_gpio.obj" \
	"$(OUTDIR)\phy_i2c.obj" \
	"$(OUTDIR)\phy_iopwm.obj" \
	"$(OUTDIR)\phy_spi.obj" \
	"$(OUTDIR)\phy_uart.obj" \
	"$(OUTDIR)\board.obj" \
	"$(OUTDIR)\dev_voice.obj" \
	"$(OUTDIR)\dev_button.obj" \
	"$(OUTDIR)\dev_cap_touch.obj" \
	"$(OUTDIR)\kernel.obj" \
	"$(OUTDIR)\os_beason.obj" 

"$(OUTDIR)\SpinVoice_bin.res": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\voice\SpinVoice.bin"
	$(RESC) "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\voice\SpinVoice.bin" "$(OUTDIR)\SpinVoice_bin.res" RES_SPINVOICE_BIN 

"$(OUTDIR)\Resource.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\Resource.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\Resource.asm" 

"$(OUTDIR)\system.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\system.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\system.asm" 

"$(OUTDIR)\BootCode_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\BootCode_User.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\BootCode_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\BootCode_User.asm" 

"$(OUTDIR)\SACM_A34Pro_fptr_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_A34Pro_fptr_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\A34Pro_fptr.inc" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_A34Pro_fptr_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_A34Pro_fptr_User.asm" 

"$(OUTDIR)\SACM_A1800_fptr_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_A1800_fptr_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\A1800_fptr.inc" "GPCE36_CE5.inc" "Resource.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_A1800_fptr_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_A1800_fptr_User.asm" 

"$(OUTDIR)\SACM_Mixer_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_Mixer_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_Mixer_Constant.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_Mixer_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\SACM_Mixer_User.asm" 

"$(OUTDIR)\VolCompress_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\VolCompress_User.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\VolCompress_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\VolCompress_User.asm" 

"$(OUTDIR)\SPI_Flash.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\SPI_Flash.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SPI_Flash.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Project\SPI_Flash.asm" 

"$(OUTDIR)\ORAM_Arrangement.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\ORAM_Arrangement.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\ORAM_Arrangement.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Include\ORAM_Arrangement.asm" 

"$(OUTDIR)\main.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Main\main.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\main.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Main/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Main\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\isr.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Main\isr.asm" 

"$(OUTDIR)\phy_adc.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_adc.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_adc.c" 

"$(OUTDIR)\phy_adc.obj": "$(OUTDIR)\phy_adc.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_adc.obj" "$(OUTDIR)\phy_adc.asm" 

"$(OUTDIR)\phy_ext.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_ext.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_ext.c" 

"$(OUTDIR)\phy_ext.obj": "$(OUTDIR)\phy_ext.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_ext.obj" "$(OUTDIR)\phy_ext.asm" 

"$(OUTDIR)\phy_gpio.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_gpio.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_gpio.c" 

"$(OUTDIR)\phy_gpio.obj": "$(OUTDIR)\phy_gpio.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_gpio.obj" "$(OUTDIR)\phy_gpio.asm" 

"$(OUTDIR)\phy_i2c.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_i2c.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_i2c.c" 

"$(OUTDIR)\phy_i2c.obj": "$(OUTDIR)\phy_i2c.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_i2c.obj" "$(OUTDIR)\phy_i2c.asm" 

"$(OUTDIR)\phy_iopwm.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_iopwm.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_iopwm.c" 

"$(OUTDIR)\phy_iopwm.obj": "$(OUTDIR)\phy_iopwm.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_iopwm.obj" "$(OUTDIR)\phy_iopwm.asm" 

"$(OUTDIR)\phy_spi.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_spi.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_spi.c" 

"$(OUTDIR)\phy_spi.obj": "$(OUTDIR)\phy_spi.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_spi.obj" "$(OUTDIR)\phy_spi.asm" 

"$(OUTDIR)\phy_uart.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_uart.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Phy/phy_uart.c" 

"$(OUTDIR)\phy_uart.obj": "$(OUTDIR)\phy_uart.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_uart.obj" "$(OUTDIR)\phy_uart.asm" 

"$(OUTDIR)\board.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\board.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Dev/board.c" 

"$(OUTDIR)\board.obj": "$(OUTDIR)\board.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\board.obj" "$(OUTDIR)\board.asm" 

"$(OUTDIR)\dev_voice.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_voice.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Dev/dev_voice.c" 

"$(OUTDIR)\dev_voice.obj": "$(OUTDIR)\dev_voice.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_voice.obj" "$(OUTDIR)\dev_voice.asm" 

"$(OUTDIR)\dev_button.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_button.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Dev/dev_button.c" 

"$(OUTDIR)\dev_button.obj": "$(OUTDIR)\dev_button.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_button.obj" "$(OUTDIR)\dev_button.asm" 

"$(OUTDIR)\dev_cap_touch.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_cap_touch.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Dev/dev_cap_touch.c" 

"$(OUTDIR)\dev_cap_touch.obj": "$(OUTDIR)\dev_cap_touch.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_cap_touch.obj" "$(OUTDIR)\dev_cap_touch.asm" 

"$(OUTDIR)\kernel.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\kernel.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Kernel/kernel.c" 

"$(OUTDIR)\kernel.obj": "$(OUTDIR)\kernel.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\kernel.obj" "$(OUTDIR)\kernel.asm" 

"$(OUTDIR)\os_beason.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_voice.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Dev\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\A18_A34_DACOut\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "GPCE36_CE5.h" "Resource.h" "..\Include\SACM.h" "..\Include\System.h" "..\Include\SPI_Flash.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\os_beason.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/A18_A34_DACOut/Kernel/os_beason.c" 

"$(OUTDIR)\os_beason.obj": "$(OUTDIR)\os_beason.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\os_beason.obj" "$(OUTDIR)\os_beason.asm" 


GEN_BOOTPACKER_INFO :
	@echo TagAlgorithm=0x0001 >> "$(OUTDIR)\BootpackerIni.ini"
	@echo BodyName="$(BODYNAME)" >> "$(OUTDIR)\BootpackerIni.ini"
	@echo SWToolID=$(SWTOOLID) >> "$(OUTDIR)\BootpackerIni.ini"
	@echo IDEVersion=$(IDEBUILDVER) >> "$(OUTDIR)\BootpackerIni.ini"
	@echo BuildDate="$(COMPILEDATE)" >> "$(OUTDIR)\BootpackerIni.ini"
	@echo BuildTime="$(COMPILETIME)" >> "$(OUTDIR)\BootpackerIni.ini"

GEN_HDB :
	@echo [Config] > $(PKINFOFILE)
	@echo IDEVersion=$(IDEBUILDVER) >> $(PKINFOFILE)
	@echo SWToolID=$(SWTOOLID) >> $(PKINFOFILE)
	@echo BodyName=$(BODYNAME) >> $(PKINFOFILE)
	@echo TSKFile=$(BINFILE) >> $(PKINFOFILE)
	@echo LODFile="$(BINFILENOEXT).lod" >> $(PKINFOFILE)
	@if exist "$(BINFILENOEXT)_SPI.bin" @echo SPIFile="$(BINFILENOEXT)_SPI.bin" >> $(PKINFOFILE)
	@echo HDBFile="$(BINFILENOEXT).hdb" >> $(PKINFOFILE)
	$(HDBPACKER) -p -conf $(PKINFOFILE)
	@if exist $(BINFILE) del $(BINFILE)

.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 BEFOREBUILD "$(OUTDIR)" GEN_BOOTPACKER_INFO $(BINFILE) GEN_HDB

BEFOREBUILD :

"$(OUTDIR)" :
	@if not exist "$(OUTDIR)\$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) "$(BINFILENOEXT)_SPI.bin" -tskMaxUsed $(LDFLAGS) $(BODY) $(EXTRAFLAGS) -exportvalues "$(OUTDIR)\BootpackerIni.ini" -bootrominfo "BootCode_SEC;0100;BootCode_SEC_EX" -undefined-opt __TgP190708CM -undefined-opt __TgP190708CL -undefined-opt __TgP190708M
	@copy "$(BINFILENOEXT)_SPI.bin" $(BINFILE) /A /Y > NUL
	$(BOOTPACKER) "$(OUTDIR)\BootpackerIni.ini"
	@if exist "$(BINFILENOEXT)_SPI.bin" del "$(BINFILENOEXT)_SPI.bin"
	@copy "$(BINFILENOEXT)_SPI.bintmp" "$(BINFILENOEXT)_SPI.bin" /A /Y > NUL
	@if exist "$(BINFILENOEXT)_SPI.bintmp" del "$(BINFILENOEXT)_SPI.bintmp"
	$(STRIP) "$(BINFILENOEXT)_SPI.bin" "$(BINFILENOEXT)_SPI.bin" 0x10000 0 1 
	".\WritePW\Run.bat" $(BOOTPACKER) "$(PRJDIR)" $(PRJNAME) $(BINFILE)

compile :	 $(OBJFILES)

CLEANFILES = \
	"$(OUTDIR)\SpinVoice_bin.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\Resource.lst" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\system.lst" \
	"$(OUTDIR)\BootCode_User.obj" \
	"$(OUTDIR)\BootCode_User.lst" \
	"$(OUTDIR)\SACM_A34Pro_fptr_User.obj" \
	"$(OUTDIR)\SACM_A34Pro_fptr_User.lst" \
	"$(OUTDIR)\SACM_A1800_fptr_User.obj" \
	"$(OUTDIR)\SACM_A1800_fptr_User.lst" \
	"$(OUTDIR)\SACM_Mixer_User.obj" \
	"$(OUTDIR)\SACM_Mixer_User.lst" \
	"$(OUTDIR)\VolCompress_User.obj" \
	"$(OUTDIR)\VolCompress_User.lst" \
	"$(OUTDIR)\SPI_Flash.obj" \
	"$(OUTDIR)\SPI_Flash.lst" \
	"$(OUTDIR)\ORAM_Arrangement.obj" \
	"$(OUTDIR)\ORAM_Arrangement.lst" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\main.lst" \
	"$(OUTDIR)\main.asm" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\isr.lst" \
	"$(OUTDIR)\phy_adc.obj" \
	"$(OUTDIR)\phy_adc.lst" \
	"$(OUTDIR)\phy_adc.asm" \
	"$(OUTDIR)\phy_ext.obj" \
	"$(OUTDIR)\phy_ext.lst" \
	"$(OUTDIR)\phy_ext.asm" \
	"$(OUTDIR)\phy_gpio.obj" \
	"$(OUTDIR)\phy_gpio.lst" \
	"$(OUTDIR)\phy_gpio.asm" \
	"$(OUTDIR)\phy_i2c.obj" \
	"$(OUTDIR)\phy_i2c.lst" \
	"$(OUTDIR)\phy_i2c.asm" \
	"$(OUTDIR)\phy_iopwm.obj" \
	"$(OUTDIR)\phy_iopwm.lst" \
	"$(OUTDIR)\phy_iopwm.asm" \
	"$(OUTDIR)\phy_spi.obj" \
	"$(OUTDIR)\phy_spi.lst" \
	"$(OUTDIR)\phy_spi.asm" \
	"$(OUTDIR)\phy_uart.obj" \
	"$(OUTDIR)\phy_uart.lst" \
	"$(OUTDIR)\phy_uart.asm" \
	"$(OUTDIR)\board.obj" \
	"$(OUTDIR)\board.lst" \
	"$(OUTDIR)\board.asm" \
	"$(OUTDIR)\dev_voice.obj" \
	"$(OUTDIR)\dev_voice.lst" \
	"$(OUTDIR)\dev_voice.asm" \
	"$(OUTDIR)\dev_button.obj" \
	"$(OUTDIR)\dev_button.lst" \
	"$(OUTDIR)\dev_button.asm" \
	"$(OUTDIR)\dev_cap_touch.obj" \
	"$(OUTDIR)\dev_cap_touch.lst" \
	"$(OUTDIR)\dev_cap_touch.asm" \
	"$(OUTDIR)\kernel.obj" \
	"$(OUTDIR)\kernel.lst" \
	"$(OUTDIR)\kernel.asm" \
	"$(OUTDIR)\os_beason.obj" \
	"$(OUTDIR)\os_beason.lst" \
	"$(OUTDIR)\os_beason.asm" \
	"$(BINFILENOEXT).s37" \
	"$(BINFILENOEXT).tsk" \
	"$(BINFILENOEXT)_SPI.bin*" \
	"$(BINFILENOEXT).hdb" \
	"$(BINFILENOEXT).lod" \
	"$(BINFILENOEXT).map" \
	"$(BINFILENOEXT).sbm" \
	"$(BINFILENOEXT).sym" \
	"$(BINFILENOEXT).smy" \
	$(PKINFOFILE) \
	$(SBMFILE)

clean :
	$(RM) $(wordlist 1,75,$(CLEANFILES))

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)\$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\$@" $<

