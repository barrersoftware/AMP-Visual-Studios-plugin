@echo off
REM Barrer Software VSIX Signing Script

echo ========================================
echo Barrer Software VSIX Signing Tool
echo ========================================
echo.

set VSIX_FILE=AMPPluginTemplate.NET8.vsix
set PFX_FILE=BarrerSoftware.pfx
set PFX_PASSWORD=BarrerSoftware2025!

if not exist "%VSIX_FILE%" (
    echo ERROR: VSIX file not found: %VSIX_FILE%
    exit /b 1
)

if not exist "%PFX_FILE%" (
    echo ERROR: PFX file not found: %PFX_FILE%
    exit /b 1
)

REM Find signtool.exe
set SIGNTOOL=
for /f "delims=" %%i in ('dir "C:\Program Files (x86)\Windows Kits\10\bin\*\x64\signtool.exe" /s /b 2^>nul') do (
    set SIGNTOOL=%%i
    goto :found
)

:found
if "%SIGNTOOL%"=="" (
    echo ERROR: SignTool not found. Install Windows SDK.
    exit /b 1
)

echo Found SignTool: %SIGNTOOL%
echo.
echo Signing %VSIX_FILE%...
echo.

"%SIGNTOOL%" sign /f "%PFX_FILE%" /p "%PFX_PASSWORD%" /t http://timestamp.digicert.com /v "%VSIX_FILE%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS: VSIX signed successfully!
    echo ========================================
    echo.
    echo The signed VSIX is ready to install!
) else (
    echo.
    echo ========================================
    echo ERROR: Signing failed!
    echo ========================================
    exit /b 1
)
