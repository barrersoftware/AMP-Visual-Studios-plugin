# How to Use GitHub Desktop with AMP Plugin Template

This guide shows you how to clone and work with the AMP Plugin Template using GitHub Desktop and Visual Studio 2022.

## Prerequisites

1. **GitHub Desktop** - Download from https://desktop.github.com/
2. **Visual Studio 2022** - Community, Professional, or Enterprise
3. **.NET 8 SDK** - Download from https://dotnet.microsoft.com/download/dotnet/8.0
4. **GitHub Account** (optional, only if you want to create your own fork)

## Step 1: Install the Plugin Template

First, you need to install the template in Visual Studio:

### Option A: Manual Installation (Recommended)

1. Download **AMPPluginTemplate.NET8.vsix** from:
   https://github.com/barrersoftware/AMP-Visual-Studios-plugin/releases/download/v2.0.1/AMPPluginTemplate.NET8.vsix

2. Rename the file to `AMPPluginTemplate.NET8.zip`

3. Extract the ZIP file

4. Copy `ProjectTemplates\AMPPluginTemplate.zip` to:
   ```
   %USERPROFILE%\Documents\Visual Studio 2022\Templates\ProjectTemplates\
   ```
   Example: `C:\Users\YourName\Documents\Visual Studio 2022\Templates\ProjectTemplates\`

5. Restart Visual Studio if it's open

### Option B: Sign and Install VSIX

See `SIGN_VSIX_INSTRUCTIONS.md` for details on signing the VSIX with the included certificate.

## Step 2: Clone Repository with GitHub Desktop

### If You Want to Use the Template Directly:

1. Open **GitHub Desktop**

2. Click **File → Clone repository**

3. Click the **URL** tab

4. Enter:
   ```
   https://github.com/barrersoftware/AMP-Visual-Studios-plugin.git
   ```

5. Choose where to save it (e.g., `D:\GitHub\AMP-Visual-Studios-plugin`)

6. Click **Clone**

### If You Want to Create Your Own Fork:

1. Go to https://github.com/barrersoftware/AMP-Visual-Studios-plugin

2. Click **Fork** in the top right

3. In GitHub Desktop, click **File → Clone repository**

4. Select your fork from the list

5. Choose where to save it

6. Click **Clone**

## Step 3: Create a New AMP Plugin Project

### Option 1: Using the Template in Visual Studio

1. Open **Visual Studio 2022**

2. Click **Create a new project**

3. Search for **"AMP"** in the search box

4. Select **"AMP Plugin Template (.NET 8)"**

5. Click **Next**

6. Enter your plugin details:
   - **Project name**: e.g., `MyAwesomePlugin`
   - **Location**: e.g., `D:\GitHub\MyPlugins\`
   - **Solution name**: Same as project name

7. Click **Create**

8. Your new plugin project opens!

### Option 2: Working with the Cloned Repository

1. In GitHub Desktop, click **Repository → Open in Visual Studio**

2. This opens the solution in Visual Studio 2022

3. You can modify the template itself or create new projects based on it

## Step 4: Making Changes and Committing

### In Visual Studio:

1. Make your changes to the code

2. Save all files (**Ctrl+Shift+S**)

3. Switch to **GitHub Desktop**

4. You'll see all your changes listed

5. Enter a **Summary** for your commit (required):
   ```
   Add custom settings page
   ```

6. Optionally add a **Description**:
   ```
   Added new configuration options for plugin behavior
   ```

7. Click **Commit to master** (or your branch name)

### Pushing to GitHub:

1. After committing, click **Push origin** in GitHub Desktop

2. Your changes are now on GitHub!

## Step 5: Building Your Plugin

### In Visual Studio 2022:

1. Right-click your project in **Solution Explorer**

2. Click **Build**

3. Your plugin DLL will be in:
   ```
   bin\Debug\net8.0\YourPluginName.dll
   ```

4. Copy this DLL to your AMP plugins folder:
   ```
   /home/amp/.ampdata/instances/ADS01/Plugins/
   ```
   (Or on Windows: `C:\AMP\.ampdata\instances\ADS01\Plugins\`)

5. Restart AMP instance

6. Your plugin appears in Configuration menu!

## Step 6: Debugging Your Plugin (Optional)

### Remote Debugging (Advanced):

1. In Visual Studio, go to **Debug → Attach to Process**

2. Set **Connection type** to **SSH**

3. Enter your AMP server details

4. Find the AMP process and attach

5. Set breakpoints in your code

6. When AMP hits your code, Visual Studio breaks!

## Common Workflows

### Creating a New Feature:

1. **GitHub Desktop**: Create a branch
   - **Branch → New branch**
   - Name it: `feature/my-new-feature`

2. **Visual Studio**: Make your changes

3. **GitHub Desktop**: Commit and push

4. **GitHub**: Create a Pull Request

### Updating Your Fork:

1. **GitHub Desktop**: Fetch origin

2. If there are updates: **Branch → Merge into current branch**

3. Select **upstream/master** (if configured)

4. Click **Merge**

## Syncing with Upstream (Barrer Software Repo)

If you forked the repository and want to get updates:

1. In GitHub Desktop, go to **Repository → Repository settings**

2. Click **Remote** tab

3. Add upstream:
   - **Primary remote repository**: Your fork
   - Click **Add** next to "Upstream remote"
   - Enter: `https://github.com/barrersoftware/AMP-Visual-Studios-plugin.git`

4. To get updates:
   - **Branch → Choose a branch to merge into master**
   - Select **upstream/master**
   - Click **Merge**

## Quick Reference

| Task | GitHub Desktop | Visual Studio |
|------|---------------|---------------|
| Clone repo | File → Clone repository | - |
| Create branch | Branch → New branch | - |
| View changes | Changes tab (left) | Team Explorer |
| Commit | Enter summary + Commit button | - |
| Push | Push origin button | - |
| Pull updates | Fetch origin → Pull | - |
| Open in VS | Repository → Open in Visual Studio | - |
| Build | - | Build → Build Solution (Ctrl+Shift+B) |
| Debug | - | Debug → Start Debugging (F5) |

## Troubleshooting

### "Template not showing in Visual Studio"
- Make sure you copied `AMPPluginTemplate.zip` to the correct Templates folder
- Restart Visual Studio
- Check: Tools → Options → Projects and Solutions → Locations

### "GitHub Desktop won't clone"
- Check your internet connection
- Make sure the URL is correct
- If private repo, sign in to GitHub in Desktop

### ".NET 8 SDK not found"
- Download from https://dotnet.microsoft.com/download/dotnet/8.0
- Install "SDK" not just "Runtime"
- Restart Visual Studio after installing

### "Plugin not loading in AMP"
- Check DLL is in correct Plugins folder
- Check AMP is version 2.5+ (.NET 8)
- Check AMP log files for errors
- Restart AMP instance completely

## Resources

- **GitHub Desktop Docs**: https://docs.github.com/en/desktop
- **Visual Studio Docs**: https://docs.microsoft.com/visualstudio
- **AMP Plugin Development**: See project README.md
- **Barrer Software**: https://barrersoftware.com

## Support

For issues with:
- **Template/Plugin**: Create issue at https://github.com/barrersoftware/AMP-Visual-Studios-plugin/issues
- **AMP itself**: Contact CubeCoders (not us - this is an independent template)
- **General help**: Email support@barrersoftware.com

---

**Copyright © 2025 Barrer Software. All Rights Reserved.**

This template is independent software and is not affiliated with, endorsed by, or supported by CubeCoders Limited.
