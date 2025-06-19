#####################################################################
#																	 
#	Created by u'nSP IDE V4.1.1		14:04:34	06/19/25
#
#####################################################################




COMPILEDATE = %date:~0,4%%date:~5,2%%date:~8,2%

COMPILEDATE_ = %date:~0,4%-%date:~5,2%-%date:~8,2%

COMPILETIME = %time:~0,2%%time:~3,2%%time:~6,2%

PRJDIR	= D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project

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

INCLUDES	= -I"D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Project" -I"C:/Program Files (x86)/Generalplus/unSPIDE_4.1.1/library/include" -I"C:/Program Files (x86)/Generalplus/unSPIDE_4.1.1/library/include/sys" -I"../Include" -I"../Library"

BODY	= -body GPCE500A -nobdy -bfile "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\GPCE500A_Demo.bdy"

BODYFILE	= "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\GPCE500A_Demo.bdy" 

BINFILE	= "$(OUTDIR)\GPCE500A_Demo.TSK"

PRJNAME = GPCE500A_Demo

BODYNAME = GPCE500A

SWTOOLID = 0x0008

IDEBUILDVER = 0x04010100

BINFILENOEXT	= $(OUTDIR)\GPCE500A_Demo

ARYFILE	= "$(OUTDIR)\GPCE500A_Demo.ary"

SBMFILE	= "$(OUTDIR)\GPCE500A_Demo.sbm"

PKINFOFILE	= "$(BINFILENOEXT).pki"

OPT	= -S -gstabs -Wall -mnonb_data -mglobal-var-ram -mISA=2.0

ASFLAGS	= -t4 -d -sr -Wno-A2013

CASFLAGS	= -t4 -sr -Wno-A2013 -wpop

CFLAGS	= $(OPT) -B$(APPDIR)\toolchain\ $(INCLUDES) 

BINTYPE	= -at

LDFLAGS	= -Wno-L0062 -blank 0x00 -initdata -infblk "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\GPCE500A_Demo.inb" -conf "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\Body\GPCE5\Checksum\GPCE5.cks"

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\SpinVoice_bin.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\BootCode_User.obj" \
	"$(OUTDIR)\GEO_User.obj" \
	"$(OUTDIR)\SACM_A34Pro_fptr_User.obj" \
	"$(OUTDIR)\SACM_A1800_fptr_User.obj" \
	"$(OUTDIR)\VolCompress_User.obj" \
	"$(OUTDIR)\MIDI.obj" \
	"$(OUTDIR)\MIDI_User.obj" \
	"$(OUTDIR)\SPU.obj" \
	"$(OUTDIR)\SPUSpeech.obj" \
	"$(OUTDIR)\ORAM_Arrangement.obj" \
	"$(OUTDIR)\SPI_Flash.obj" \
	"$(OUTDIR)\SACM_Mixer_CH2_User.obj" \
	"$(OUTDIR)\SACM_Mixer_User.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\dev_audio.obj" \
	"$(OUTDIR)\board.obj" \
	"$(OUTDIR)\dev_button.obj" \
	"$(OUTDIR)\dev_cap_touch.obj" \
	"$(OUTDIR)\dev_sleep.obj" \
	"$(OUTDIR)\phy_adc.obj" \
	"$(OUTDIR)\phy_ccp.obj" \
	"$(OUTDIR)\phy_ext.obj" \
	"$(OUTDIR)\phy_gpio.obj" \
	"$(OUTDIR)\phy_i2c.obj" \
	"$(OUTDIR)\phy_iopwm.obj" \
	"$(OUTDIR)\phy_spi.obj" \
	"$(OUTDIR)\phy_timer.obj" \
	"$(OUTDIR)\phy_uart.obj" \
	"$(OUTDIR)\kernel.obj" \
	"$(OUTDIR)\os_beason.obj" \
	"$(OUTDIR)\app_operate.obj" \
	"$(OUTDIR)\app_shell.obj" 

"$(OUTDIR)\SpinVoice_bin.res": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\voice\SpinVoice.bin"
	$(RESC) "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\voice\SpinVoice.bin" "$(OUTDIR)\SpinVoice_bin.res" RES_SPINVOICE_BIN 

"$(OUTDIR)\Resource.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\Resource.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\Resource.asm" 

"$(OUTDIR)\system.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\system.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\system.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\system.asm" 

"$(OUTDIR)\BootCode_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\BootCode_User.asm" ".\GPCE36_CE5.inc" ".\GPCE36_CE5_Body.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\BootCode_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\BootCode_User.asm" 

"$(OUTDIR)\GEO_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\GEO_User.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\GEO_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\GEO_User.asm" 

"$(OUTDIR)\SACM_A34Pro_fptr_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_A34Pro_fptr_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\A34Pro_fptr.inc" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_A34Pro_fptr_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_A34Pro_fptr_User.asm" 

"$(OUTDIR)\SACM_A1800_fptr_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_A1800_fptr_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\A1800_fptr.inc" "GPCE36_CE5.inc" "Resource.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_A1800_fptr_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_A1800_fptr_User.asm" 

"$(OUTDIR)\VolCompress_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\VolCompress_User.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\VolCompress_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\VolCompress_User.asm" 

"$(OUTDIR)\MIDI.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\MIDI.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\MIDI.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\MIDI.asm" 

"$(OUTDIR)\MIDI_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\MIDI_User.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\MIDI_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\MIDI_User.asm" 

"$(OUTDIR)\SPU.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SPU.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SPU.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SPU.asm" 

"$(OUTDIR)\SPUSpeech.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SPUSpeech.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SPUSpeech.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SPUSpeech.asm" 

"$(OUTDIR)\ORAM_Arrangement.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\ORAM_Arrangement.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\ORAM_Arrangement.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\ORAM_Arrangement.asm" 

"$(OUTDIR)\SPI_Flash.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\SPI_Flash.asm" ".\GPCE36_CE5.inc" ".\GPCE36_CE5_Body.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SPI_Flash.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Project\SPI_Flash.asm" 

"$(OUTDIR)\SACM_Mixer_CH2_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_Mixer_CH2_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_Mixer_CH2_Constant.inc" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_Mixer_CH2_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_Mixer_CH2_User.asm" 

"$(OUTDIR)\SACM_Mixer_User.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_Mixer_User.asm" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_Mixer_Constant.inc" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_Mixer_User.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Include\SACM_Mixer_User.asm" 

"$(OUTDIR)\main.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Main\main.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\main.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Main/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Main\isr.asm" "GPCE36_CE5.inc" "..\Include\A34Pro_fptr.inc" "..\Include\GEO.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\isr.obj" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Main\isr.asm" 

"$(OUTDIR)\dev_audio.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_audio.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Device/dev_audio.c" 

"$(OUTDIR)\dev_audio.obj": "$(OUTDIR)\dev_audio.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_audio.obj" "$(OUTDIR)\dev_audio.asm" 

"$(OUTDIR)\board.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\board.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Device/board.c" 

"$(OUTDIR)\board.obj": "$(OUTDIR)\board.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\board.obj" "$(OUTDIR)\board.asm" 

"$(OUTDIR)\dev_button.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_button.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Device/dev_button.c" 

"$(OUTDIR)\dev_button.obj": "$(OUTDIR)\dev_button.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_button.obj" "$(OUTDIR)\dev_button.asm" 

"$(OUTDIR)\dev_cap_touch.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_cap_touch.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Device/dev_cap_touch.c" 

"$(OUTDIR)\dev_cap_touch.obj": "$(OUTDIR)\dev_cap_touch.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_cap_touch.obj" "$(OUTDIR)\dev_cap_touch.asm" 

"$(OUTDIR)\dev_sleep.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\dev_sleep.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Device/dev_sleep.c" 

"$(OUTDIR)\dev_sleep.obj": "$(OUTDIR)\dev_sleep.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\dev_sleep.obj" "$(OUTDIR)\dev_sleep.asm" 

"$(OUTDIR)\phy_adc.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_adc.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_adc.c" 

"$(OUTDIR)\phy_adc.obj": "$(OUTDIR)\phy_adc.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_adc.obj" "$(OUTDIR)\phy_adc.asm" 

"$(OUTDIR)\phy_ccp.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_ccp.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_ccp.c" 

"$(OUTDIR)\phy_ccp.obj": "$(OUTDIR)\phy_ccp.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_ccp.obj" "$(OUTDIR)\phy_ccp.asm" 

"$(OUTDIR)\phy_ext.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_ext.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_ext.c" 

"$(OUTDIR)\phy_ext.obj": "$(OUTDIR)\phy_ext.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_ext.obj" "$(OUTDIR)\phy_ext.asm" 

"$(OUTDIR)\phy_gpio.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_gpio.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_gpio.c" 

"$(OUTDIR)\phy_gpio.obj": "$(OUTDIR)\phy_gpio.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_gpio.obj" "$(OUTDIR)\phy_gpio.asm" 

"$(OUTDIR)\phy_i2c.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_i2c.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_i2c.c" 

"$(OUTDIR)\phy_i2c.obj": "$(OUTDIR)\phy_i2c.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_i2c.obj" "$(OUTDIR)\phy_i2c.asm" 

"$(OUTDIR)\phy_iopwm.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_iopwm.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_iopwm.c" 

"$(OUTDIR)\phy_iopwm.obj": "$(OUTDIR)\phy_iopwm.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_iopwm.obj" "$(OUTDIR)\phy_iopwm.asm" 

"$(OUTDIR)\phy_spi.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_spi.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_spi.c" 

"$(OUTDIR)\phy_spi.obj": "$(OUTDIR)\phy_spi.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_spi.obj" "$(OUTDIR)\phy_spi.asm" 

"$(OUTDIR)\phy_timer.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_timer.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_timer.c" 

"$(OUTDIR)\phy_timer.obj": "$(OUTDIR)\phy_timer.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_timer.obj" "$(OUTDIR)\phy_timer.asm" 

"$(OUTDIR)\phy_uart.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\phy_uart.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Phy/phy_uart.c" 

"$(OUTDIR)\phy_uart.obj": "$(OUTDIR)\phy_uart.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\phy_uart.obj" "$(OUTDIR)\phy_uart.asm" 

"$(OUTDIR)\kernel.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\kernel.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Kernel/kernel.c" 

"$(OUTDIR)\kernel.obj": "$(OUTDIR)\kernel.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\kernel.obj" "$(OUTDIR)\kernel.asm" 

"$(OUTDIR)\os_beason.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\os_beason.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Kernel/os_beason.c" 

"$(OUTDIR)\os_beason.obj": "$(OUTDIR)\os_beason.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\os_beason.obj" "$(OUTDIR)\os_beason.asm" 

"$(OUTDIR)\app_operate.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\app_operate.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Apps/app_operate.c" 

"$(OUTDIR)\app_operate.obj": "$(OUTDIR)\app_operate.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\app_operate.obj" "$(OUTDIR)\app_operate.asm" 

"$(OUTDIR)\app_shell.asm": "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.c" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\inc\includes.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\typedef.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Inc\usr_config.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_adc.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_timer.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_gpio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_iopwm.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_uart.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_spi.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ext.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_ccp.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Phy\phy_i2c.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\board.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_audio.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_cap_touch.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_sleep.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Device\dev_button.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_shell.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Apps\app_operate.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\os_beason.h" "D:\JohnHu\Github_private\GPCE_template\GPCE500\Voice_DMA\Kernel\kernel.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\string.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdio.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\_ansi.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdarg.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stdlib.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\sys\reent.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine/_types.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\assert.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\limits.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\stddef.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\math.h" "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\library\include\machine\ieeefp.h" "..\Include\System.h" "GPCE36_CE5.h" "..\Include\SACM.h" "Resource.h" "..\Include\GEO.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\app_shell.asm" "D:/JohnHu/Github_private/GPCE_template/GPCE500/Voice_DMA/Apps/app_shell.c" 

"$(OUTDIR)\app_shell.obj": "$(OUTDIR)\app_shell.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\app_shell.obj" "$(OUTDIR)\app_shell.asm" 


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

compile :	 $(OBJFILES)

CLEANFILES = \
	"$(OUTDIR)\SpinVoice_bin.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\Resource.lst" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\system.lst" \
	"$(OUTDIR)\BootCode_User.obj" \
	"$(OUTDIR)\BootCode_User.lst" \
	"$(OUTDIR)\GEO_User.obj" \
	"$(OUTDIR)\GEO_User.lst" \
	"$(OUTDIR)\SACM_A34Pro_fptr_User.obj" \
	"$(OUTDIR)\SACM_A34Pro_fptr_User.lst" \
	"$(OUTDIR)\SACM_A1800_fptr_User.obj" \
	"$(OUTDIR)\SACM_A1800_fptr_User.lst" \
	"$(OUTDIR)\VolCompress_User.obj" \
	"$(OUTDIR)\VolCompress_User.lst" \
	"$(OUTDIR)\MIDI.obj" \
	"$(OUTDIR)\MIDI.lst" \
	"$(OUTDIR)\MIDI_User.obj" \
	"$(OUTDIR)\MIDI_User.lst" \
	"$(OUTDIR)\SPU.obj" \
	"$(OUTDIR)\SPU.lst" \
	"$(OUTDIR)\SPUSpeech.obj" \
	"$(OUTDIR)\SPUSpeech.lst" \
	"$(OUTDIR)\ORAM_Arrangement.obj" \
	"$(OUTDIR)\ORAM_Arrangement.lst" \
	"$(OUTDIR)\SPI_Flash.obj" \
	"$(OUTDIR)\SPI_Flash.lst" \
	"$(OUTDIR)\SACM_Mixer_CH2_User.obj" \
	"$(OUTDIR)\SACM_Mixer_CH2_User.lst" \
	"$(OUTDIR)\SACM_Mixer_User.obj" \
	"$(OUTDIR)\SACM_Mixer_User.lst" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\main.lst" \
	"$(OUTDIR)\main.asm" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\isr.lst" \
	"$(OUTDIR)\dev_audio.obj" \
	"$(OUTDIR)\dev_audio.lst" \
	"$(OUTDIR)\dev_audio.asm" \
	"$(OUTDIR)\board.obj" \
	"$(OUTDIR)\board.lst" \
	"$(OUTDIR)\board.asm" \
	"$(OUTDIR)\dev_button.obj" \
	"$(OUTDIR)\dev_button.lst" \
	"$(OUTDIR)\dev_button.asm" \
	"$(OUTDIR)\dev_cap_touch.obj" \
	"$(OUTDIR)\dev_cap_touch.lst" \
	"$(OUTDIR)\dev_cap_touch.asm" \
	"$(OUTDIR)\dev_sleep.obj" \
	"$(OUTDIR)\dev_sleep.lst" \
	"$(OUTDIR)\dev_sleep.asm" \
	"$(OUTDIR)\phy_adc.obj" \
	"$(OUTDIR)\phy_adc.lst" \
	"$(OUTDIR)\phy_adc.asm" \
	"$(OUTDIR)\phy_ccp.obj" \
	"$(OUTDIR)\phy_ccp.lst" \
	"$(OUTDIR)\phy_ccp.asm" \
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
	"$(OUTDIR)\phy_timer.obj" \
	"$(OUTDIR)\phy_timer.lst" \
	"$(OUTDIR)\phy_timer.asm" \
	"$(OUTDIR)\phy_uart.obj" \
	"$(OUTDIR)\phy_uart.lst" \
	"$(OUTDIR)\phy_uart.asm" \
	"$(OUTDIR)\kernel.obj" \
	"$(OUTDIR)\kernel.lst" \
	"$(OUTDIR)\kernel.asm" \
	"$(OUTDIR)\os_beason.obj" \
	"$(OUTDIR)\os_beason.lst" \
	"$(OUTDIR)\os_beason.asm" \
	"$(OUTDIR)\app_operate.obj" \
	"$(OUTDIR)\app_operate.lst" \
	"$(OUTDIR)\app_operate.asm" \
	"$(OUTDIR)\app_shell.obj" \
	"$(OUTDIR)\app_shell.lst" \
	"$(OUTDIR)\app_shell.asm" \
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
	$(RM) $(wordlist 1,100,$(CLEANFILES))
	$(RM) $(wordlist 101,102,$(CLEANFILES))

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)\$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\$@" $<

