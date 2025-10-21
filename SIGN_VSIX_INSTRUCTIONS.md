# How to Sign the VSIX with Barrer Software Certificate

## Files You Need

1. **BarrerSoftware.pfx** - Code signing certificate (Password: Fairfield866)
2. **AMPPluginTemplate.NET8.vsix** - The VSIX file to sign

Both files are available in this directory and at:
- https://github.com/barrersoftware/AMP-Visual-Studios-plugin/releases/tag/v2.0.1

## Method 1: Using Visual Studio Developer Command Prompt (Recommended)

```powershell
# Open "Developer Command Prompt for VS 2022" as Administrator

# Navigate to where you have the files
cd D:\barrer-software\software

# Sign the VSIX
signtool sign /f BarrerSoftware.pfx /p Fairfield866 /fd SHA256 /t http://timestamp.digicert.com AMPPluginTemplate.NET8.vsix

# Verify signature
signtool verify /pa AMPPluginTemplate.NET8.vsix
```

## Method 2: Using OpenSSL + Windows SDK

If you don't have Visual Studio but have Windows SDK:

```powershell
# Sign using signtool from Windows SDK
"C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool.exe" sign /f BarrerSoftware.pfx /p Fairfield866 /fd SHA256 /t http://timestamp.digicert.com AMPPluginTemplate.NET8.vsix
```

## Method 3: Install Certificate First (Easiest)

This installs the certificate so VS will trust it:

```powershell
# As Administrator, import the certificate
Import-PfxCertificate -FilePath BarrerSoftware.pfx -CertStoreLocation Cert:\CurrentUser\My -Password (ConvertTo-SecureString -String "Fairfield866" -AsPlainText -Force)

# Then sign
signtool sign /sha1 <THUMBPRINT> /fd SHA256 /t http://timestamp.digicert.com AMPPluginTemplate.NET8.vsix
```

## After Signing

The VSIX should now install without the "invalid package" error. The signature tells Visual Studio that the package comes from a trusted source (Barrer Software).

## Alternative: Skip Signing and Install Manually

If signing doesn't work, you can install the template manually:

1. Rename `AMPPluginTemplate.NET8.vsix` to `AMPPluginTemplate.NET8.zip`
2. Extract the ZIP file
3. Copy `ProjectTemplates\AMPPluginTemplate.zip` to:
   ```
   %USERPROFILE%\Documents\Visual Studio 2022\Templates\ProjectTemplates\
   ```
4. Restart Visual Studio
5. File → New → Project → Search "AMP"

## Certificate Details

```
Subject: Barrer Software
Issuer: Barrer Software (Self-Signed)
Valid: 10 years (2025-2035)
Country: US
State: California
Location: San Francisco
Email: support@barrersoftware.com
```

## Troubleshooting

### "signtool not found"
Install Windows SDK or use Visual Studio Developer Command Prompt

### "Certificate not trusted"
This is a self-signed certificate. You can:
1. Install it to Trusted Root Certification Authorities
2. Or just accept the warning when installing VSIX

### Still getting "invalid package" error
Try the manual installation method above (extract and copy template)

---

**Copyright © 2025 Barrer Software. All Rights Reserved.**
