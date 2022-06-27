@echo off

SET BUILD_SCRIPT_PATH=%~dp0

rem ====================================================
rem Step0 - Environment prepare
rem ====================================================

rem ====================================================
rem Step1 - Build code
rem ====================================================
rmdir archives /s/q

rem ====================================================
rem Step2 - Prepare files for pack
rem ====================================================

cd "%BUILD_SCRIPT_PATH%"

robocopy ..\..\Windows\var archives\var /E
xcopy ..\..\Windows\config_backup.bat archives /Y
xcopy ..\..\Windows\config_restore.bat archives /Y
xcopy ..\..\Windows\influx.exe archives /Y
xcopy ..\..\Windows\influxd.exe archives /Y
xcopy ..\..\Windows\influxdb.conf archives /Y

rem ====================================================
rem Step3 - Prepare advsc and advsc config for pack
rem ====================================================

cd "%BUILD_SCRIPT_PATH%"

xcopy ..\advsc.ini archives /Y

CALL curl -k --fail --output archives/advsc.exe https://dev.azure.com/adv-iedge/EdgeSense-Open/_apis/git/repositories/advsc-binary/items?path=/Windows/latest/advsc.exe
if %ERRORLEVEL% neq 0 (
    echo fail to download advsc.exe
    exit /b 1
)


:END
echo done