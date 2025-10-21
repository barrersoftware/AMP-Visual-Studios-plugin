# Building and Signing VSIX in Visual Studio 2022

## Prerequisites
1. Visual Studio 2022 with VSIX extension development workload installed
2. BarrerSoftware.pfx certificate file (already in project directory)

## Method 1: Sign During Build (Recommended)

### Step 1: Open Project Properties
1. Open the VSIX project in Visual Studio 2022
2. Right-click the VSIX project in Solution Explorer
3. Select **Properties**

### Step 2: Configure Signing
1. Go to the **Signing** tab
2. Check **"Sign the ClickOnce manifests"** or **"Sign the assembly"**
3. Click **"Select from File..."**
4. Browse to `BarrerSoftware.pfx` in your project directory
5. Enter password: `BarrerSoftware2025!`
6. Click **OK**

### Step 3: Build the VSIX
1. Select **Build** > **Build Solution** (or press Ctrl+Shift+B)
2. The signed VSIX will be in `bin\Debug` or `bin\Release` folder

## Method 2: Sign After Build Using Command Line

If you prefer to sign after building, use this PowerShell command:

```powershell
# Set paths
$vsixPath = ".\AMPPluginTemplate.NET8.vsix"
$certPath = ".\BarrerSoftware.pfx"
$certPassword = "BarrerSoftware2025!"
$timestampServer = "http://timestamp.digicert.com"

# Find SignTool.exe (adjust path for your VS version)
$signTool = "C:\Program Files (x86)\Windows Kits\10\bin\10.0.22621.0\x64\SignTool.exe"

# Sign the VSIX
& $signTool sign /f $certPath /p $certPassword /fd SHA256 /t $timestampServer $vsixPath
```

## Method 3: Sign Using Visual Studio Command Line

1. Open **Developer Command Prompt for VS 2022**
2. Navigate to your project directory:
   ```cmd
   cd D:\barrer-software\AMP-Visual-Studios-plugin
   ```
3. Run the sign command:
   ```cmd
   signtool sign /f BarrerSoftware.pfx /p BarrerSoftware2025! /fd SHA256 /t http://timestamp.digicert.com AMPPluginTemplate.NET8.vsix
   ```

## Verify Signature

To verify the VSIX is signed:

```powershell
# Using PowerShell
Get-AuthenticodeSignature .\AMPPluginTemplate.NET8.vsix

# Using SignTool
signtool verify /pa AMPPluginTemplate.NET8.vsix
```

## Troubleshooting

### "The file is not a valid VSIX package" Error

This error typically means:
1. The VSIX wasn't signed properly
2. The manifest files are corrupted
3. The ZIP structure is invalid

**Solution:**
- Rebuild the VSIX from scratch in Visual Studio
- Sign immediately after building
- Verify the certificate is valid

### Certificate Password

The certificate password is: `BarrerSoftware2025!`

If you need to change it, create a new PFX:
```bash
openssl pkcs12 -export -out NewBarrerSoftware.pfx -inkey BarrerSoftware.key -in BarrerSoftware.crt -password pass:YourNewPassword
```

## Quick Steps (Most Common Method)

1. **Open project in VS 2022**
2. **Right-click VSIX project** → Properties → Signing
3. **Check "Sign the assembly"**
4. **Select BarrerSoftware.pfx** (password: `BarrerSoftware2025!`)
5. **Build Solution** (Ctrl+Shift+B)
6. **Find VSIX** in `bin\Release\AMPPluginTemplate.NET8.vsix`
7. **Done!** The VSIX is now signed and ready to install or publish

## Publishing to Visual Studio Marketplace

Once signed, you can upload to:
https://marketplace.visualstudio.com/manage/publishers/barrersoftware

The VSIX must be signed to be accepted by the marketplace.

---

**Copyright © 2025 Barrer Software. All Rights Reserved.**
