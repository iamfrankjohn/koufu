@echo off
title Activation Script Menu

:menu
cls
echo ================================
echo         Select an Option
echo ================================
echo 1. Activation
echo 2. Help
echo 3. Exit
echo.

choice /c 123 /n /m "Enter choice (1-3): "

set choice=%errorlevel%

if "%choice%"=="1" goto Activation
if "%choice%"=="2" goto Help
if "%choice%"=="3" goto Exit

goto menu

:Activation
:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -ArgumentList 'Activation' -Verb runAs"
    exit /b
)

:: Run the PowerShell command
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"
exit /b

:Help
start https://github.com/NiREvil/windows-activation/blob/main/README.md
exit /b

:Exit
exit /b
