# Sign VSIX Package with Barrer Software Certificate
# Copyright (c) 2025 Barrer Software. All Rights Reserved.

Write-Host "========================================"
Write-Host "Barrer Software VSIX Signing Tool"
Write-Host "========================================"
Write-Host ""

# Set variables
$vsixFile = "AMPPluginTemplate.NET8.vsix"
$certFile = "BarrerSoftware.pfx"
$certPassword = "Fairfield866"
$timestamp = "http://timestamp.digicert.com"

# Check if VSIX exists
if (-not (Test-Path $vsixFile)) {
    Write-Host "ERROR: $vsixFile not found!" -ForegroundColor Red
    Write-Host "Please build the VSIX first or run this script from the project directory."
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if certificate exists
if (-not (Test-Path $certFile)) {
    Write-Host "ERROR: $certFile not found!" -ForegroundColor Red
    Write-Host "Please ensure the certificate is in the same directory."
    Read-Host "Press Enter to exit"
    exit 1
}

# Find SignTool.exe
$signTool = $null
$windowsKitsPath = "C:\Program Files (x86)\Windows Kits\10\bin"
if (Test-Path $windowsKitsPath) {
    $sdkVersions = Get-ChildItem $windowsKitsPath -Directory | Sort-Object Name -Descending
    foreach ($version in $sdkVersions) {
        $toolPath = Join-Path $version.FullName "x64\signtool.exe"
        if (Test-Path $toolPath) {
            $signTool = $toolPath
            break
        }
    }
}

if (-not $signTool) {
    Write-Host "ERROR: SignTool.exe not found!" -ForegroundColor Red
    Write-Host "Please install Windows SDK or locate SignTool.exe manually."
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Found SignTool: $signTool" -ForegroundColor Green
Write-Host ""
Write-Host "Signing $vsixFile..." -ForegroundColor Yellow
Write-Host ""

# Sign the VSIX
& $signTool sign /f $certFile /p $certPassword /fd SHA256 /t $timestamp $vsixFile

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================"
    Write-Host "SUCCESS! VSIX signed successfully!" -ForegroundColor Green
    Write-Host "========================================"
    Write-Host ""
    Write-Host "Verifying signature..." -ForegroundColor Yellow
    & $signTool verify /pa $vsixFile
    Write-Host ""
    Write-Host "The signed VSIX is ready to install or publish!" -ForegroundColor Green
    Write-Host ""
    
    # Show signature details
    Write-Host "Signature Details:" -ForegroundColor Cyan
    Get-AuthenticodeSignature $vsixFile | Format-List
} else {
    Write-Host ""
    Write-Host "========================================"
    Write-Host "ERROR: Signing failed!" -ForegroundColor Red
    Write-Host "========================================"
}

Write-Host ""
Read-Host "Press Enter to exit"
