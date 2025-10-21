# Visual Studio Marketplace Publisher Setup Guide

**Publisher:** Barrer Software  
**Domain:** barrersoftware.com  
**Extension:** AMP Plugin Template (.NET 8)  
**Date:** October 21, 2025

## ✅ Step 1: Domain Verification (COMPLETE)

The domain verification files have been deployed to barrersoftware.com:

**Verification URLs:**
- https://barrersoftware.com/.well-known-vscode-verification.html
- https://barrersoftware.com/.well-known/vscode-verification.html

**Status:** ✅ Files committed and pushed to GitHub

**Test URLs (once DNS propagates):**
```bash
curl https://barrersoftware.com/.well-known-vscode-verification.html
```

## Step 2: Create Visual Studio Marketplace Publisher Account

### 2.1 Go to Visual Studio Marketplace
Navigate to: https://marketplace.visualstudio.com/manage

### 2.2 Sign in with Microsoft Account
Use your Microsoft/Azure DevOps account

### 2.3 Create Publisher

1. Click **"Create a publisher"**
2. Fill in the form:

```
Publisher ID: BarrerSoftware
Display Name: Barrer Software
Description: Professional software solutions and development tools for game server management and plugin development
```

3. **Add Verified Domain:**
   - Domain: `barrersoftware.com`
   - The marketplace will check for verification files
   - It should find: `/.well-known-vscode-verification.html`

### 2.4 Verification Process

The marketplace will:
1. Check DNS records for barrersoftware.com
2. Look for verification file at `/.well-known-vscode-verification.html`
3. Verify ownership
4. Grant verified badge ✓

**Expected wait time:** 24-48 hours for verification

## Step 3: Upload Extension to Marketplace

### 3.1 Prepare Extension Files

**Files ready:**
- ✅ `AMPPluginTemplate.NET8.vsix` (13 KB)
- ✅ Marketplace-ready manifest
- ✅ Publisher information configured
- ✅ Icon and preview images
- ✅ MIT License
- ✅ Complete documentation

**Local path:**
```
/home/ubuntu/AMPPluginTemplate.NET8.vsix
```

### 3.2 Upload via Web Interface

1. Go to: https://marketplace.visualstudio.com/manage/publishers/BarrerSoftware
2. Click **"New extension"**
3. Select **"Visual Studio"**
4. Upload: `AMPPluginTemplate.NET8.vsix`
5. Fill in any additional marketplace-specific fields
6. Click **"Upload"**

### 3.3 Upload via Command Line (Alternative)

Install vsce (VS Code Extension Manager):
```bash
npm install -g @vscode/vsce
```

Publish extension:
```bash
vsce publish --pat YOUR_PERSONAL_ACCESS_TOKEN
```

**Note:** You'll need to create a Personal Access Token (PAT) from Azure DevOps:
- Go to: https://dev.azure.com/
- User Settings → Personal Access Tokens
- Create token with **Marketplace (Publish)** scope

## Step 4: Extension Listing Configuration

### 4.1 Marketplace Listing Information

**Extension Name:** AMP Plugin Template (.NET 8)

**Short Description:**
```
Modern .NET 8 project template for CubeCoders AMP plugin development
```

**Full Description:**
```markdown
# AMP Plugin Template for .NET 8

Updated, community-maintained project template for developing CubeCoders AMP plugins targeting .NET 8.

## Features

- ✅ Modern SDK-style project format
- ✅ .NET 8 target framework
- ✅ C# 12 language features
- ✅ Nullable reference types enabled
- ✅ Complete PluginMain.cs example
- ✅ Modern web interface with dark theme
- ✅ JavaScript API helpers
- ✅ Comprehensive documentation

## What's Included

- Complete plugin structure
- Example web API methods
- Dark theme web interface (HTML/CSS/JS)
- Installation and deployment guides
- Best practices and examples

## Requirements

- Visual Studio 2022 (17.0+)
- .NET 8 SDK
- CubeCoders AMP 2.5 or later

## Quick Start

1. Create new project
2. Search for "AMP Plugin"
3. Enter plugin name
4. Build and deploy to AMP

## Updated from Legacy Template

This template replaces the outdated .NET Framework 4.8 template with modern .NET 8 support.

### Changes:
- Project format: Legacy → SDK-style
- Target: .NET 4.8 → .NET 8
- Language: C# 7.3 → C# 12
- Features: Modern nullable types, async/await patterns

## Support

- Documentation: https://github.com/ssfdre38/amp-plugin-template-net8
- Issues: https://github.com/ssfdre38/amp-plugin-template-net8/issues
- Website: https://barrersoftware.com

## License

MIT License - Free to use and modify
```

**Categories:**
- Programming Languages
- Templates
- Other

**Tags:**
```
AMP, CubeCoders, Plugin, Template, .NET 8, C#, Game Server, SDK, Development
```

### 4.2 Screenshots/Media

**Icon:** Included in VSIX (green "A" icon)  
**Preview Image:** Included in VSIX

**Optional: Add screenshots of:**
1. Template in New Project dialog
2. Generated project structure
3. Example code in IDE
4. Built plugin in AMP

## Step 5: Post-Publication

### 5.1 Verify Listing

After publication, verify at:
```
https://marketplace.visualstudio.com/items?itemName=BarrerSoftware.AMPPluginTemplate-NET8
```

### 5.2 Test Installation

1. Open Visual Studio 2022
2. Go to Extensions → Manage Extensions
3. Search for "AMP Plugin Template"
4. Click Install
5. Verify template appears in New Project

### 5.3 Update Website

Add to barrersoftware.com:
- Link to marketplace listing
- Installation instructions
- Quick start guide

## Troubleshooting

### Domain Verification Not Working

**Check:**
1. DNS propagation: `nslookup barrersoftware.com`
2. HTTPS access to verification file
3. File content is correct
4. No redirect issues

**Fix:**
```bash
# Re-deploy verification files
cd /home/ubuntu/barrersoftware
git pull
git add .well-known*
git commit -m "Update verification"
git push
```

### Extension Upload Fails

**Common issues:**
1. **Manifest errors:** Validate XML syntax
2. **Size limits:** Maximum 50 MB (we're 13 KB, fine)
3. **Icon missing:** Verify icon.png exists
4. **PAT expired:** Create new Personal Access Token

### Publisher Not Verified

**Wait period:** 24-48 hours  
**Check status:** https://marketplace.visualstudio.com/manage

**If still issues after 48h:**
- Contact marketplace support
- Verify DNS is working
- Check verification file accessibility

## Alternative Distribution

If marketplace approval is slow or rejected, you can still distribute via:

1. **GitHub Releases** ✅ (Already done)
   - https://github.com/ssfdre38/amp-plugin-template-net8/releases

2. **Direct Download** ✅ (Already setup)
   - https://barrersoftware.com (add download link)

3. **Your Own Marketplace**
   - Host on barrersoftware.com/extensions
   - Provide installation instructions

## Extension Updates

### To publish an update:

1. **Update version** in extension.vsixmanifest
2. **Rebuild VSIX**:
```bash
cd /home/ubuntu/amp-vsix-extension
# Update version number
zip -r AMPPluginTemplate.NET8.vsix ...
```

3. **Upload to marketplace**
4. **Tag release on GitHub**

## Marketplace URLs

**Publisher Dashboard:**
https://marketplace.visualstudio.com/manage/publishers/BarrerSoftware

**Extension Management:**
https://marketplace.visualstudio.com/manage

**Extension Page (once published):**
https://marketplace.visualstudio.com/items?itemName=BarrerSoftware.AMPPluginTemplate-NET8

**Install Link:**
```
vs:BarrerSoftware.AMPPluginTemplate-NET8
```

## Files Created

### Verification Files
- `/home/ubuntu/barrersoftware/.well-known-vscode-verification.html`
- `/home/ubuntu/barrersoftware/.well-known/vscode-verification.html`

### Extension Files
- `/home/ubuntu/AMPPluginTemplate.NET8.vsix` (marketplace-ready)
- `/home/ubuntu/amp-vsix-extension/` (source)

### Documentation
- `/home/ubuntu/barrersoftware-marketplace-setup/MARKETPLACE_SETUP_GUIDE.md` (this file)
- `/home/ubuntu/barrersoftware-marketplace-setup/publisher-manifest.json`

## Next Steps

1. ✅ Domain verification files deployed
2. ⏳ Wait for DNS propagation (~1 hour)
3. 📝 Create marketplace publisher account
4. ⏳ Wait for domain verification (24-48h)
5. 📤 Upload VSIX to marketplace
6. ✅ Extension goes live!

## Support Contacts

**Technical Issues:**
- GitHub Issues: https://github.com/ssfdre38/amp-plugin-template-net8/issues

**Marketplace Support:**
- VS Marketplace Help: https://aka.ms/vsmarketplace-support

**Domain Issues:**
- Your domain registrar support

---

**Status:** Domain verification deployed, ready for marketplace account creation  
**Created:** 2025-10-21T06:40:00.000Z  
**Updated:** 2025-10-21T06:40:00.000Z
