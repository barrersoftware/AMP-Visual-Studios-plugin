using ModuleShared;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AMPModuleTemplate
{
    public class ModuleMain : AppModule
    {
        private readonly ILogger log;
        private readonly IConfigSerializer config;
        private readonly SupportedOS currentPlatform;
        private readonly IRunningTasksManager taskManager;

        public override bool HasFrontendContent => false;

        public override IEnumerable<SettingStore> SettingStores => Enumerable.Empty<SettingStore>();

        public IPluginMessagePusher Message { get; }
        public IFeatureManager Features { get; }

        public ModuleMain(ILogger log, IConfigSerializer config, SupportedOS currentPlatform, 
            IRunningTasksManager taskManager, IPluginMessagePusher Message, IFeatureManager Features)
        {
            this.log = log;
            this.config = config;
            this.currentPlatform = currentPlatform;
            this.taskManager = taskManager;
            this.Message = Message;
            this.Features = Features;
        }

        public override void Init(out IApplicationWrapper Application, out WebMethodsBase APIMethods) //Mandatory Args
        {
            Application = new AppWrapper();
            APIMethods = null;
        }

        public override void PostInit()
        {
            
        }
    }
}
