@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b)

echo Killing AnyDesk process...
taskkill /f /im AnyDesk.exe >nul 2>&1

echo Deleting service* and system* files from %ProgramData%\AnyDesk...
del /f /q "%ProgramData%\AnyDesk\service*" >nul 2>&1
del /f /q "%ProgramData%\AnyDesk\system*" >nul 2>&1

echo Starting AnyDesk...
start "" "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"

echo Done.
pause