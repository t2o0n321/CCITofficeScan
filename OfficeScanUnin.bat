@echo off

echo [+] Finding correspond reg key ...

reg query HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendMicro\PC-cillinNTCorp\CurrentVersion\Misc. | findstr "Uninstall"

if not %ERRORLEVEL% EQU 0 echo [+] Cannot find HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendMicro\PC-cillinNTCorp\CurrentVersion\Misc. && exit

reg add HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendMicro\PC-cillinNTCorp\CurrentVersion\Misc. /v "Allow Uninstall" /t REG_DWORD /d 1 /f

reg query HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendMicro\PC-cillinNTCorp\CurrentVersion\Misc. | findstr "Uninstall"

echo [+] Success, the value of 'Allow Uninstall' has changed to 1 !

echo [+] Please Reboot Your Computer to Uninstall it !
PAUSE