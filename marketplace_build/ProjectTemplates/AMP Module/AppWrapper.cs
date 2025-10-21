using ModuleShared;
using System;
using System.Collections.Generic;

//Remove the line below after creating your project!
#pragma warning disable CS0067

namespace AMPModuleTemplate
{
    public class AppWrapper : AppServerBase, IApplicationWrapper, IHasReadableConsole, IHasSimpleUserList, IHasWriteableConsole
    {
        public int MaxRAMUsage => 0;

        public bool SupportsSleep => false;

        public string ApplicationName => "Not Specified";

        public string ModuleName => "Not Specified";

        public string ModuleAuthor => "Not Specified";

        public SupportedOS SupportedOperatingSystems => SupportedOS.Windows | SupportedOS.Linux;

        public bool CanRunVirtualized => true;

        public bool CanUpdateApplication => true;

        public string BaseDirectory { get; set; }

        public void Kill()
        {
            throw new NotImplementedException();
        }

        public void Restart()
        {
            throw new NotImplementedException();
        }

        public ActionResult Sleep()
        {
            throw new NotImplementedException();
        }

        public ActionResult Start()
        {
            throw new NotImplementedException();
        }

        public void Stop()
        {
            throw new NotImplementedException();
        }

        public ActionResult Update()
        {
            throw new NotImplementedException();
        }

        public void WriteLine(string message)
        {
            throw new NotImplementedException();
        }

        public event EventHandler<UserEventArgs> UserJoins;

        public event EventHandler<UserEventArgs> UserLeaves;

        public List<SimpleUser> Users { get; } = new List<SimpleUser>();

        public int MaxUsers => 0;

    }
}
