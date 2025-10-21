@echo off
REM Sign VSIX Package with Barrer Software Certificate
REM Copyright (c) 2025 Barrer Software. All Rights Reserved.

echo ========================================
echo Barrer Software VSIX Signing Tool
echo ========================================
echo.

REM Set variables
set VSIX_FILE=AMPPluginTemplate.NET8.vsix
set CERT_FILE=BarrerSoftware.pfx
set CERT_PASS=BarrerSoftware2025!
set TIMESTAMP=http://timestamp.digicert.com

REM Check if VSIX exists
if not exist "%VSIX_FILE%" (
    echo ERROR: %VSIX_FILE% not found!
    echo Please build the VSIX first or run this script from the project directory.
    pause
    exit /b 1
)

REM Check if certificate exists
if not exist "%CERT_FILE%" (
    echo ERROR: %CERT_FILE% not found!
    echo Please ensure the certificate is in the same directory.
    pause
    exit /b 1
)

REM Find SignTool.exe
set SIGNTOOL=
for /d %%i in ("C:\Program Files (x86)\Windows Kits\10\bin\10.0.*") do (
    if exist "%%i\x64\signtool.exe" set SIGNTOOL=%%i\x64\signtool.exe
)

if "%SIGNTOOL%"=="" (
    echo ERROR: SignTool.exe not found!
    echo Please install Windows SDK or locate SignTool.exe manually.
    pause
    exit /b 1
)

echo Found SignTool: %SIGNTOOL%
echo.
echo Signing %VSIX_FILE%...
echo.

REM Sign the VSIX
"%SIGNTOOL%" sign /f "%CERT_FILE%" /p "%CERT_PASS%" /fd SHA256 /t "%TIMESTAMP%" "%VSIX_FILE%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! VSIX signed successfully!
    echo ========================================
    echo.
    echo Verifying signature...
    "%SIGNTOOL%" verify /pa "%VSIX_FILE%"
    echo.
    echo The signed VSIX is ready to install or publish!
) else (
    echo.
    echo ========================================
    echo ERROR: Signing failed!
    echo ========================================
)

echo.
pause
