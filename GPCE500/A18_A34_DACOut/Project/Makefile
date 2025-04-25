#####################################################################
#																	 
#	Created by u'nSP IDE V4.1.1		14:02:32	04/25/25
#
#####################################################################




COMPILEDATE = %date:~0,4%%date:~5,2%%date:~8,2%

COMPILEDATE_ = %date:~0,4%-%date:~5,2%-%date:~8,2%

COMPILETIME = %time:~0,2%%time:~3,2%%time:~6,2%

PRJDIR	= D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project

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

INCLUDES	= -I"D:/JohnHu/Github_private/GPCE500_basecode/GPCE500A_A18_A34_DACOut/Project" -I"C:/Program Files (x86)/Generalplus/unSPIDE_4.1.1/library/include" -I"C:/Program Files (x86)/Generalplus/unSPIDE_4.1.1/library/include/sys" -I"../Include" -I"../Library"

BODY	= -body GPCE500A -nobdy -bfile "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\GPCE500A_DacSpk.bdy"

BODYFILE	= "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\GPCE500A_DacSpk.bdy" 

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

LDFLAGS	= -Wno-L0062 -blank 0x00 -initdata -infblk "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\GPCE500A_DacSpk.inb" -conf "C:\Program Files (x86)\Generalplus\unSPIDE_4.1.1\Body\GPCE5\Checksum\GPCE5.cks"

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\animals02_34K_sp4.res" \
	"$(OUTDIR)\animals03_34K_sp4.res" \
	"$(OUTDIR)\animals04_34K_sp4.res" \
	"$(OUTDIR)\animals08_34K_sp4.res" \
	"$(OUTDIR)\tailor3_16K_a18.res" \
	"$(OUTDIR)\them2_seekctrl_001_sp4.res" \
	"$(OUTDIR)\FileMerger_ROM_bin.res" \
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
	"$(OUTDIR)\isr.obj" 

"$(OUTDIR)\animals02_34K_sp4.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals02_34K.sp4"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals02_34K.sp4" "$(OUTDIR)\animals02_34K_sp4.res" RES_ANIMALS02_34K_SP4 

"$(OUTDIR)\animals03_34K_sp4.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals03_34K.sp4"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals03_34K.sp4" "$(OUTDIR)\animals03_34K_sp4.res" RES_ANIMALS03_34K_SP4 

"$(OUTDIR)\animals04_34K_sp4.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals04_34K.sp4"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals04_34K.sp4" "$(OUTDIR)\animals04_34K_sp4.res" RES_ANIMALS04_34K_SP4 

"$(OUTDIR)\animals08_34K_sp4.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals08_34K.sp4"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\animals08_34K.sp4" "$(OUTDIR)\animals08_34K_sp4.res" RES_ANIMALS08_34K_SP4 

"$(OUTDIR)\tailor3_16K_a18.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\tailor3_16K.a18"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\tailor3_16K.a18" "$(OUTDIR)\tailor3_16K_a18.res" RES_TAILOR3_16K_A18 

"$(OUTDIR)\them2_seekctrl_001_sp4.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\them2_seekctrl_001.sp4"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\them2_seekctrl_001.sp4" "$(OUTDIR)\them2_seekctrl_001_sp4.res" RES_THEM2_SEEKCTRL_001_SP4 

"$(OUTDIR)\FileMerger_ROM_bin.res": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\FileMerger_ROM.bin"
	$(RESC) "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\voice\FileMerger_ROM.bin" "$(OUTDIR)\FileMerger_ROM_bin.res" RES_FILEMERGER_ROM_BIN 

"$(OUTDIR)\Resource.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\Resource.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\Resource.asm" 

"$(OUTDIR)\system.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\system.asm" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\system.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\system.asm" 

"$(OUTDIR)\BootCode_User.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\BootCode_User.asm" ".\GPCE36_CE5.inc" ".\GPCE36_CE5_Body.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\BootCode_User.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\BootCode_User.asm" 

"$(OUTDIR)\SACM_A34Pro_fptr_User.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_A34Pro_fptr_User.asm" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\A34Pro_fptr.inc" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_A34Pro_fptr_User.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_A34Pro_fptr_User.asm" 

"$(OUTDIR)\SACM_A1800_fptr_User.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_A1800_fptr_User.asm" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\A1800_fptr.inc" "GPCE36_CE5.inc" "Resource.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_A1800_fptr_User.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_A1800_fptr_User.asm" 

"$(OUTDIR)\SACM_Mixer_User.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_Mixer_User.asm" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_Mixer_Constant.inc" "GPCE36_CE5.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SACM_Mixer_User.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\SACM_Mixer_User.asm" 

"$(OUTDIR)\VolCompress_User.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\VolCompress_User.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\VolCompress_User.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\VolCompress_User.asm" 

"$(OUTDIR)\SPI_Flash.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\SPI_Flash.asm" ".\GPCE36_CE5.inc" ".\GPCE36_CE5_Body.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\SPI_Flash.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Project\SPI_Flash.asm" 

"$(OUTDIR)\ORAM_Arrangement.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\ORAM_Arrangement.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\ORAM_Arrangement.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Include\ORAM_Arrangement.asm" 

"$(OUTDIR)\main.asm": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Main\main.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)\main.asm" "D:/JohnHu/Github_private/GPCE500_basecode/GPCE500A_A18_A34_DACOut/Main/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Main\isr.asm" "GPCE36_CE5.inc" "..\Include\A34Pro_fptr.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\isr.obj" "D:\JohnHu\Github_private\GPCE500_basecode\GPCE500A_A18_A34_DACOut\Main\isr.asm" 


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
	"$(OUTDIR)\animals02_34K_sp4.res" \
	"$(OUTDIR)\animals03_34K_sp4.res" \
	"$(OUTDIR)\animals04_34K_sp4.res" \
	"$(OUTDIR)\animals08_34K_sp4.res" \
	"$(OUTDIR)\tailor3_16K_a18.res" \
	"$(OUTDIR)\them2_seekctrl_001_sp4.res" \
	"$(OUTDIR)\FileMerger_ROM_bin.res" \
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
	$(RM) $(wordlist 1,42,$(CLEANFILES))

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)\$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)\$@" $<

