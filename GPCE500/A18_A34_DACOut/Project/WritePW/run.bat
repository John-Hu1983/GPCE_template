@echo off
rem %1: BootPacker exe path
rem %2: Project Path
rem %3: Project Name
echo "Boot Packer:" %1
echo "Project Path:" %2
echo "Project Name:" %3
echo "Output File Path: " %4

SET _BOOT_PACKER_EXE=%1
SET _PRJ_PATH=%2
SET _PRJ_NAME=%3
SET _OUTPUT_FILE=%4

SET _INI_FILE_DEFAULT=.\WritePW\Password.ini
SET _INI_FILE_TEMP=.\Debug\WritePassword_Temp.ini
rem SET _INPUT_TSK_FILE=%_PRJ_PATH%\Debug\%_PRJ_NAME%.tsk
SET _INPUT_TSK_FILE=%_OUTPUT_FILE%
rem SET _INPUT_TSK_FILE_TEMP=%_PRJ_PATH%\Debug\%_PRJ_NAME%_Temp.tsk
SET _INPUT_TSK_FILE_TEMP=.\Debug\%_PRJ_NAME%_Temp.tsk

if not exist "%_INI_FILE_DEFAULT%" 	goto ERROR
if not exist "%_INPUT_TSK_FILE%" 	goto ERROR

rem write config data to Password.ini
if exist "%_INI_FILE_TEMP%" del "%_INI_FILE_TEMP%"
if exist "%_INPUT_TSK_FILE_TEMP%" del "%_INPUT_TSK_FILE_TEMP%"
COPY "%_INI_FILE_DEFAULT%" "%_INI_FILE_TEMP%"
echo Binary=%_INPUT_TSK_FILE%					>> "%_INI_FILE_TEMP%"
echo OutputBinary=%_INPUT_TSK_FILE_TEMP%		>> "%_INI_FILE_TEMP%"

%_BOOT_PACKER_EXE% "%_INI_FILE_TEMP%"
if not exist "%_INPUT_TSK_FILE_TEMP%" goto ERROR
del %_INPUT_TSK_FILE%
COPY "%_INPUT_TSK_FILE_TEMP%" %_INPUT_TSK_FILE%
if not exist %_INPUT_TSK_FILE% goto ERROR
del "%_INPUT_TSK_FILE_TEMP%"
goto DONE

:ERROR
if not exist "%_INI_FILE_DEFAULT%" echo Not exist "%_INI_FILE_DEFAULT%"
if not exist "%_INPUT_TSK_FILE%" echo Not exist "%_INPUT_TSK_FILE%"
echo Pack Password to %_INPUT_TSK_FILE% Fail.
goto END

:DONE
echo Pack Password to %_INPUT_TSK_FILE% Pass.
goto END

:END