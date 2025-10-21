@echo off
REM Build and Sign VSIX Package - Launcher
REM Copyright (c) 2025 Barrer Software. All Rights Reserved.

echo ========================================
echo Barrer Software VSIX Builder
echo ========================================
echo.

REM Check if PowerShell is available
where powershell >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: PowerShell not found!
    echo Please ensure PowerShell is installed.
    pause
    exit /b 1
)

REM Run the PowerShell script
powershell.exe -ExecutionPolicy Bypass -File "%~dp0build-and-sign-vsix.ps1"

pause
