# Build and Sign VSIX Package for Visual Studio 2022
# Copyright (c) 2025 Barrer Software. All Rights Reserved.
# This script builds the VSIX package from the project files and signs it

Write-Host "========================================"
Write-Host "Barrer Software VSIX Builder & Signer"
Write-Host "AMP Plugin Template for .NET 8"
Write-Host "========================================"
Write-Host ""

# Set variables
$vsixFile = "AMPPluginTemplate.NET8.vsix"
$certFile = "BarrerSoftware.pfx"
$certPassword = "Fairfield866"
$timestamp = "http://timestamp.digicert.com"

# Step 1: Check if running in correct directory
if (-not (Test-Path "extension.vsixmanifest")) {
    Write-Host "ERROR: extension.vsixmanifest not found!" -ForegroundColor Red
    Write-Host "Please run this script from the project root directory."
    Read-Host "Press Enter to exit"
    exit 1
}

# Step 2: Remove old VSIX if exists
if (Test-Path $vsixFile) {
    Write-Host "Removing old VSIX file..." -ForegroundColor Yellow
    Remove-Item $vsixFile -Force
}

# Step 3: Build the VSIX package
Write-Host ""
Write-Host "Building VSIX package..." -ForegroundColor Cyan
Write-Host ""

# Create a temporary directory for packaging
$tempDir = "temp_vsix_build"
if (Test-Path $tempDir) {
    Remove-Item $tempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $tempDir | Out-Null

# Copy files to temp directory
Write-Host "Copying files..." -ForegroundColor Yellow
Copy-Item "extension.vsixmanifest" $tempDir
Copy-Item "catalog.json" $tempDir
Copy-Item "manifest.json" $tempDir
Copy-Item "[Content_Types].xml" $tempDir
Copy-Item "icon-*.png" $tempDir
Copy-Item "icon.png" $tempDir
Copy-Item "preview.png" $tempDir
Copy-Item "LICENSE.txt" $tempDir
Copy-Item "README.md" $tempDir
Copy-Item "ProjectTemplates" $tempDir -Recurse

# Create VSIX (which is just a ZIP file)
Write-Host "Creating VSIX package..." -ForegroundColor Yellow
Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
[System.IO.Compression.ZipFile]::CreateFromDirectory($tempDir, $vsixFile, $compressionLevel, $false)

# Clean up temp directory
Remove-Item $tempDir -Recurse -Force

if (-not (Test-Path $vsixFile)) {
    Write-Host "ERROR: Failed to create VSIX package!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "VSIX package created successfully!" -ForegroundColor Green
Write-Host ""

# Step 4: Sign the VSIX
Write-Host "========================================"
Write-Host "Signing VSIX Package"
Write-Host "========================================"
Write-Host ""

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
    Write-Host "Please install Windows SDK from Visual Studio Installer."
    Write-Host ""
    Write-Host "To install:"
    Write-Host "1. Open Visual Studio Installer"
    Write-Host "2. Click 'Modify' on Visual Studio 2022"
    Write-Host "3. Go to 'Individual Components'"
    Write-Host "4. Search for 'Windows 10 SDK' or 'Windows 11 SDK'"
    Write-Host "5. Check the box and click 'Modify'"
    Write-Host ""
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
    Write-Host "SUCCESS!" -ForegroundColor Green
    Write-Host "========================================"
    Write-Host ""
    Write-Host "VSIX built and signed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Verifying signature..." -ForegroundColor Yellow
    & $signTool verify /pa $vsixFile
    Write-Host ""
    
    # Show file info
    $fileInfo = Get-Item $vsixFile
    Write-Host "Output File Details:" -ForegroundColor Cyan
    Write-Host "  Name: $($fileInfo.Name)"
    Write-Host "  Size: $([math]::Round($fileInfo.Length / 1KB, 2)) KB"
    Write-Host "  Path: $($fileInfo.FullName)"
    Write-Host ""
    
    # Show signature details
    Write-Host "Signature Details:" -ForegroundColor Cyan
    Get-AuthenticodeSignature $vsixFile | Format-List
    
    Write-Host ""
    Write-Host "========================================"
    Write-Host "Next Steps:"
    Write-Host "========================================"
    Write-Host "1. Install in Visual Studio:"
    Write-Host "   - Double-click $vsixFile"
    Write-Host "   - Or: Extensions > Manage Extensions > Install from VSIX"
    Write-Host ""
    Write-Host "2. Publish to Marketplace:"
    Write-Host "   - See publish-to-marketplace.md for instructions"
    Write-Host ""
    Write-Host "3. Share the VSIX:"
    Write-Host "   - Upload to GitHub releases"
    Write-Host "   - Share with other developers"
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================"
    Write-Host "ERROR: Signing failed!" -ForegroundColor Red
    Write-Host "========================================"
    Write-Host ""
    Write-Host "Common issues:"
    Write-Host "1. Certificate password incorrect"
    Write-Host "2. Certificate expired or invalid"
    Write-Host "3. SignTool version incompatible"
    Write-Host ""
}

Write-Host ""
Read-Host "Press Enter to exit"
