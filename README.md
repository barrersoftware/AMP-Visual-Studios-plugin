# AMP Visual Studio Plugin - .NET 8 Template

[![Visual Studio Marketplace](https://img.shields.io/badge/VS%20Marketplace-BarrerSoftware-blue)](https://marketplace.visualstudio.com/publishers/BarrerSoftware)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.txt)
[![.NET 8](https://img.shields.io/badge/.NET-8.0-purple.svg)](https://dotnet.microsoft.com/download/dotnet/8.0)
[![VS 2022](https://img.shields.io/badge/Visual%20Studio-2022-purple.svg)](https://visualstudio.microsoft.com/vs/)

Professional Visual Studio extension providing a modern .NET 8 project template for CubeCoders AMP plugin development.

![Extension Icon](icon-128.png)

## 🎯 Purpose

This extension updates the outdated .NET Framework 4.8 AMP plugin template to modern .NET 8, enabling developers to create AMP plugins using current technology and best practices.

## ✨ Features

- ✅ **Modern .NET 8** - SDK-style project format
- ✅ **C# 12** - Latest language features
- ✅ **Nullable Reference Types** - Better null safety
- ✅ **Complete Example** - Full PluginMain.cs implementation
- ✅ **Web Interface** - Dark theme HTML/CSS/JS template
- ✅ **API Helpers** - JavaScript functions for AMP API calls
- ✅ **Comprehensive Docs** - README with examples and guides

## 📦 What's Included

### Template Structure
```
YourPlugin/
├── YourPlugin.csproj          # .NET 8 SDK-style project
├── PluginMain.cs              # Complete plugin implementation
├── README.md                  # Project documentation
└── WebRoot/
    ├── Plugin.html            # Web interface
    ├── CSS/
    │   └── Plugin.css         # Dark theme stylesheet
    └── Scripts/
        └── Plugin.js          # API helper functions
```

### Code Features
- Modern async/await patterns
- Web API method examples with `[WebMethod]` attribute
- Lifecycle management (Init/Shutdown)
- IPC method support
- Error handling examples
- Full XML documentation

## 🚀 Installation

### From Visual Studio Marketplace (Recommended)
1. Open Visual Studio 2022
2. Go to **Extensions → Manage Extensions**
3. Search for "AMP Plugin Template"
4. Click **Install**
5. Restart Visual Studio

### Manual Installation
1. Download [AMPPluginTemplate.NET8.vsix](AMPPluginTemplate.NET8.vsix)
2. Double-click the file
3. Visual Studio will install the extension
4. Restart Visual Studio

## 📝 Usage

### Create New Plugin
1. Open Visual Studio 2022
2. **File → New → Project**
3. Search for "AMP Plugin"
4. Select **AMP Plugin (.NET 8)**
5. Enter your plugin name
6. Click **Create**

### Configure AMP Path
Before building, set your AMP installation directory:

**Option A: Environment Variable**
```cmd
setx AMPINSTALLDIR "C:\Path\To\Your\AMP\Installation"
```

**Option B: Edit .csproj**
```xml
<Reference Include="ModuleShared">
  <HintPath>C:\Your\Path\ModuleShared.dll</HintPath>
  <Private>false</Private>
</Reference>
```

### Build Your Plugin
```bash
dotnet build -c Release
```

Output: `bin\Release\net8.0\`

### Deploy to AMP

**Windows:**
```cmd
xcopy /E /I bin\Release\net8.0\* "%ProgramData%\CubeCoders\AMP\instances\[Instance]\Plugins\[YourPlugin]\"
```

**Linux:**
```bash
sudo -u amp cp -r bin/Release/net8.0/* /home/amp/.ampdata/instances/[Instance]/Plugins/[YourPlugin]/
```

**Restart AMP:**
```bash
ampinstmgr restart [InstanceName]
```

## 💻 Example Code

### Basic Plugin Structure
```csharp
namespace MyPlugin;

public class PluginMain : AMPPlugin
{
    public override string DisplayName => "My Plugin";
    public override string Author => "Your Name";
    public override Guid PluginID => new Guid("12345678-1234-1234-1234-123456789abc");
    public override string PluginVersion => "1.0.0";
    public override bool HasWebRoot => true;
    
    public override void Init(IApplicationWrapper app, ProviderManifest manifest)
    {
        base.Init(app, manifest);
        Console.WriteLine("[MyPlugin] Loaded!");
    }
}
```

### Web API Method
```csharp
[WebMethod("Get server status", "status")]
public ActionResult GetStatus()
{
    return new ActionResult
    {
        Status = ActionStatus.OK,
        Result = new { success = true, uptime = TimeSpan.FromHours(24) }
    };
}
```

## 🔄 Differences from Old Template

| Feature | Old Template (.NET 4.8) | New Template (.NET 8) |
|---------|------------------------|----------------------|
| Project Format | Legacy .csproj | SDK-style |
| Target Framework | `net48` | `net8.0` |
| NuGet | packages.config | PackageReference |
| AssemblyInfo | Separate file | In .csproj |
| Nullable Types | Disabled | Enabled |
| C# Version | 7.3 | 12.0 |
| Build Tool | msbuild | dotnet CLI |

## 📋 Requirements

- **Visual Studio 2022** (17.0 or later)
- **.NET 8 SDK** ([Download](https://dotnet.microsoft.com/download/dotnet/8.0))
- **CubeCoders AMP 2.5+** (runs on .NET 8)

## 🛠️ For Extension Development

### Building the VSIX

```bash
cd /path/to/repo
zip -r AMPPluginTemplate.NET8.vsix extension.vsixmanifest [Content_Types].xml LICENSE.txt icon.png preview.png ProjectTemplates/AMPPluginTemplate.zip
```

### Updating the Template

1. Edit files in `ProjectTemplates/`
2. Rebuild template ZIP:
```bash
cd ProjectTemplates
zip -r AMPPluginTemplate.zip *
```
3. Rebuild VSIX (see above)
4. Test in Visual Studio

### Publishing to Marketplace

See [MARKETPLACE_SETUP_GUIDE.md](MARKETPLACE_SETUP_GUIDE.md) for detailed instructions.

## 📚 Documentation

- **[Installation Guide](MARKETPLACE_SETUP_GUIDE.md)** - Complete setup instructions
- **[Publishing Guide](publish-to-marketplace.md)** - How to publish to VS Marketplace
- **[Quick Start](MARKETPLACE_QUICK_START.txt)** - Quick reference guide

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 🐛 Issues & Support

- **GitHub Issues:** [Report a bug or request a feature](https://github.com/barrersoftware/AMP-Visual-Studios-plugin/issues)
- **Website:** [barrersoftware.com](https://barrersoftware.com)

## 📄 License

This project is licensed under the MIT License - see [LICENSE.txt](LICENSE.txt) for details.

### Important Notes

- This is an **independent community contribution**
- Not officially endorsed by CubeCoders Limited
- AMP is a trademark of CubeCoders Limited
- Template designed for use with AMP software
- No affiliation or warranty implied

## 🙏 Credits

**Created by:** Barrer Software  
**With assistance from:** GitHub Copilot CLI  
**For:** CubeCoders AMP community  
**Icon Design:** Modern shield (Windows Defender inspired)

## 📊 Project Stats

- **Extension Size:** 21 KB
- **Template Files:** 8 files
- **Code Examples:** Complete plugin with web interface
- **Documentation:** Comprehensive guides included
- **License:** MIT (free and open source)

## 🔗 Links

- **Visual Studio Marketplace:** Coming soon
- **GitHub Repository:** https://github.com/barrersoftware/AMP-Visual-Studios-plugin
- **AMP Documentation:** https://cubecoders.com/AMPdocs
- **.NET 8 Documentation:** https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-8

## 📅 Version History

### v2.0.1 (2025-10-21)
- ✅ Modern shield icon (Windows Defender style)
- ✅ Professional appearance
- ✅ Updated preview images

### v2.0.0 (2025-10-21)
- ✅ Initial release
- ✅ .NET 8 support
- ✅ SDK-style project format
- ✅ Complete example plugin
- ✅ Web interface template
- ✅ Comprehensive documentation

---

**Made with ❤️ for the AMP community**

*Helping developers create modern AMP plugins with .NET 8*
