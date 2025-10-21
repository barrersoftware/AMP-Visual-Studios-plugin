#!/usr/bin/env pwsh
# Barrer Software VSIX Signing Script

$vsixPath = "AMPPluginTemplate.NET8.vsix"
$pfxPath = "BarrerSoftware.pfx"
$pfxPassword = "BarrerSoftware2025!"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Barrer Software VSIX Signing Tool" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

if (-not (Test-Path $vsixPath)) {
    Write-Host "ERROR: VSIX file not found: $vsixPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $pfxPath)) {
    Write-Host "ERROR: PFX file not found: $pfxPath" -ForegroundColor Red
    exit 1
}

# Find signtool
$signtoolPaths = @(
    "C:\Program Files (x86)\Windows Kits\10\bin\*\x64\signtool.exe",
    "C:\Program Files (x86)\Windows Kits\10\bin\*\x86\signtool.exe"
)

$signtool = $null
foreach ($path in $signtoolPaths) {
    $found = Get-ChildItem $path -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName
    if ($found) {
        $signtool = $found
        break
    }
}

if (-not $signtool) {
    Write-Host "ERROR: SignTool not found. Install Windows SDK." -ForegroundColor Red
    exit 1
}

Write-Host "Found SignTool: $signtool`n" -ForegroundColor Green
Write-Host "Signing $vsixPath...`n" -ForegroundColor Yellow

& $signtool sign /f "$pfxPath" /p "$pfxPassword" /t http://timestamp.digicert.com /v "$vsixPath"

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n========================================" -ForegroundColor Green
    Write-Host "SUCCESS: VSIX signed successfully!" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Green
    Write-Host "The signed VSIX is ready to install!" -ForegroundColor Cyan
} else {
    Write-Host "`n========================================" -ForegroundColor Red
    Write-Host "ERROR: Signing failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    exit 1
}
