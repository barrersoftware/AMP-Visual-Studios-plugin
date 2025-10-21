# Visual Studio Marketplace Publishing Guide
**For Microsoft Authenticator Login**

Since you use Microsoft Authenticator (passwordless), here's the exact process:

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## STEP 1: SIGN IN TO VISUAL STUDIO MARKETPLACE

### 1.1 Open Browser
Navigate to: https://marketplace.visualstudio.com/manage

### 1.2 Click "Sign In"
- Click the "Sign in" button in top right

### 1.3 Enter Microsoft Email
- Enter your Microsoft account email
- Click "Next"

### 1.4 Authenticate with Microsoft Authenticator
Since you're using passwordless:
1. You'll see: "Approve sign in request"
2. Open Microsoft Authenticator app on your phone
3. Tap the notification or open the app
4. Tap "Approve" or enter the number shown on screen
5. Browser will automatically sign you in

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## STEP 2: CREATE PUBLISHER (First Time Only)

### 2.1 Create Publisher Profile
Once signed in, you'll be at: https://marketplace.visualstudio.com/manage

Click **"Create Publisher"** or **"+ New Publisher"**

### 2.2 Fill Publisher Information

```
Publisher ID*: BarrerSoftware
  (This will be in URLs: marketplace.visualstudio.com/publishers/BarrerSoftware)
  (Cannot be changed later!)

Publisher Name*: Barrer Software

Description:
  Professional software solutions and development tools. 
  Specializing in game server management, plugin development, 
  and security solutions.

Logo: (Upload icon-128.png from /home/ubuntu/amp-vsix-extension/icon-128.png)

More Information URL: https://barrersoftware.com
```

### 2.3 Verify Domain
Under "Verified Domains":

1. Click **"Add Domain"**
2. Enter: `barrersoftware.com`
3. Click **"Generate verification code"**
4. Copy the verification code they provide

**Important:** The verification files are already deployed!
- https://barrersoftware.com/.well-known-vscode-verification.html
- https://barrersoftware.com/.well-known/vscode-verification.html

If they give you a specific code to add, you may need to update the files.
But usually, the existing files should work automatically.

5. Click **"Verify"**
6. Wait 1-5 minutes for verification
7. Refresh page - should show green checkmark ✓

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## STEP 3: UPLOAD EXTENSION

### 3.1 Navigate to Extensions
From publisher dashboard:
- Click **"+ New Extension"**
- Select **"Visual Studio"** (NOT "Visual Studio Code")

### 3.2 Upload VSIX File

**Method 1: Drag and Drop**
1. Open file explorer to `/home/ubuntu/`
2. Find `AMPPluginTemplate.NET8.vsix`
3. Drag and drop it into the upload area

**Method 2: Browse**
1. Click **"Browse"** or **"Choose file"**
2. Navigate to `/home/ubuntu/AMPPluginTemplate.NET8.vsix`
3. Click **"Open"**

### 3.3 Verify Upload
The marketplace will automatically read from the VSIX:

```
Extension Name: AMP Plugin Template (.NET 8)
Version: 2.0.1
Publisher: BarrerSoftware
Description: [Reads from VSIX manifest]
Categories: Programming Languages, Templates
Tags: AMP, CubeCoders, Plugin, .NET 8, C#, etc.
```

**Check that everything looks correct!**

### 3.4 Additional Marketplace Fields (Optional)

You may be asked for:

**Q&A (Optional):**
- Enable Q&A: Yes
- Link: https://github.com/ssfdre38/amp-plugin-template-net8/issues

**Repository (Optional but recommended):**
- Type: GitHub
- URL: https://github.com/ssfdre38/amp-plugin-template-net8

**Support (Optional):**
- Email: [your support email]
- URL: https://barrersoftware.com

**Pricing:**
- Free ✓ (already set in manifest)

### 3.5 Review and Publish
1. Review all information
2. Read and accept marketplace policies
3. Click **"Publish"** or **"Upload"**

**Processing time:** Usually instant, but can take up to 1 hour for first extension

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## STEP 4: VERIFY PUBLICATION

### 4.1 Check Extension Page
Once published, your extension will be at:
```
https://marketplace.visualstudio.com/items?itemName=BarrerSoftware.AMPPluginTemplate-NET8
```

### 4.2 Test Installation
1. Open Visual Studio 2022
2. Go to **Extensions → Manage Extensions**
3. Search for "AMP Plugin Template"
4. Your extension should appear!
5. Click **Install** to test

### 4.3 Test Template Creation
1. **File → New → Project**
2. Search for "AMP Plugin"
3. Template should appear in results
4. Create a test project to verify it works

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## TROUBLESHOOTING

### Issue: "Publisher ID already taken"
**Solution:** Try a variation:
- BarrerSoftware (recommended)
- Barrer-Software
- BarrerSoftwareLLC
- BarrerSoft

### Issue: "Domain verification failed"
**Options:**

**A. Check verification file is accessible:**
```bash
curl https://barrersoftware.com/.well-known-vscode-verification.html
```
Should return HTML with meta tag.

**B. If they provide a specific verification code:**
1. Note the code they give you
2. Update the verification file
3. Let me know and I'll update it for you

**C. Alternative verification methods:**
- DNS TXT record (if file method doesn't work)
- Meta tag in homepage

### Issue: "VSIX validation failed"
**Check:**
- File is not corrupted: `ls -lh /home/ubuntu/AMPPluginTemplate.NET8.vsix`
- Should be 21 KB
- Re-download from GitHub if needed

### Issue: Microsoft Authenticator not receiving notification
**Solutions:**
- Check phone is connected to internet
- Try "Use a different verification method"
- Select "Use a verification code" instead
- Open Authenticator app manually and look for code

### Issue: "Sign in failed"
**Try:**
1. Use InPrivate/Incognito window
2. Clear browser cookies
3. Try different browser (Edge, Chrome, Firefox)
4. Check Microsoft account isn't locked

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## FILES YOU'LL NEED

**VSIX to Upload:**
```
/home/ubuntu/AMPPluginTemplate.NET8.vsix (21 KB)
```

**Optional: Publisher Logo:**
```
/home/ubuntu/amp-vsix-extension/icon-128.png
```

**Backup Downloads:**
If you need to re-download the VSIX:
```
https://github.com/ssfdre38/amp-plugin-template-net8/releases/download/v2.0.1-vsix/AMPPluginTemplate.NET8.vsix
```

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## AFTER PUBLICATION

### Update Website
Add to barrersoftware.com:
```html
<a href="https://marketplace.visualstudio.com/items?itemName=BarrerSoftware.AMPPluginTemplate-NET8">
  Download AMP Plugin Template for Visual Studio
</a>
```

### Share the News
Post in:
- AMP community forums (if allowed)
- Your social media
- Developer communities
- GitHub repository README

### Monitor
- Check marketplace statistics
- Respond to Q&A questions
- Monitor GitHub issues
- Update template as needed

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## UPDATING THE EXTENSION

### When you need to update:

1. **Update version** in `/home/ubuntu/amp-vsix-extension/extension.vsixmanifest`
2. **Rebuild VSIX** (let me know, I can do this)
3. **Sign in to marketplace** (same process as above)
4. **Go to your extension** page
5. **Click "Update"** or "Upload new version"
6. **Upload new VSIX**
7. **Publish**

Version numbering:
- Bug fixes: 2.0.1 → 2.0.2
- New features: 2.0.1 → 2.1.0
- Major changes: 2.0.1 → 3.0.0

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## ESTIMATED TIME

- Create publisher account: 5-10 minutes
- Domain verification: 1-5 minutes (files already deployed)
- Upload extension: 2-5 minutes
- Marketplace processing: Instant to 1 hour
- **Total: ~15-30 minutes**

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## HELP AVAILABLE

If you run into issues:
- Take a screenshot
- Note the error message
- Let me know - I can help troubleshoot
- I can update files, rebuild VSIX, etc.

I can do everything EXCEPT the actual marketplace sign-in and upload
(since that requires your Microsoft Authenticator).

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Ready to publish!** 🚀

The process is straightforward:
1. Sign in with Authenticator (approve on phone)
2. Create publisher
3. Verify domain (auto-verifies)
4. Upload VSIX
5. Done!

You've got this! 👍
