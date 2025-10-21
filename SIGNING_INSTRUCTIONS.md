# How to Sign the VSIX Extension

## Quick Start

**Password:** `BarrerSoftware2025!`

### Windows

**Option 1 - PowerShell:**
```powershell
.\Sign-VSIX.ps1
```

**Option 2 - Batch File:**
```cmd
Sign-VSIX.bat
```

## Requirements

- Windows SDK (for signtool.exe)
- BarrerSoftware.pfx (included in repo)
- AMPPluginTemplate.NET8.vsix (build output)

## After Signing

The signed VSIX can be installed in Visual Studio 2022 by double-clicking it.

## Certificate Info

- Organization: Barrer Software
- Country: US
- Password: BarrerSoftware2025!

---

© 2025 Barrer Software. All Rights Reserved.
