{pkgs, ...}: {
  home.packages = [pkgs.mpris-scrobbler];

  systemd.user.services.mpris-scrobbler = {
    Unit = {
      Description = "daemon to scrobble tracks loaded from the MPRIS DBus interface to compatible services";
      Requires = ["dbus.socket"];
    };
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.mpris-scrobbler}/bin/mpris-scrobbler -vv";
      ExecReload = "/usr/bin/env kill -HUP $MAINPID";
      CPUQuota = "1%";
      Restart = "on-failure";
      RestartSec = 30;
      PassEnvironment = ["PROXY"];
    };
  };
}
