{
  inputs,
  ...
}:{
  imports = [
    inputs.ironbar.homeManagerModules.default
  ];

  systemd.user.services.ironbar.Service.Environment = "RUST_BACKTRACE=full";
  programs.ironbar = {
    enable = true;
    config = {
      position = "top";
      height = 34;
      start = [
        {
          type = "workspaces";
          all_monitors = false;
        }
      ];
      center = [
        {
          type = "clock";
        }
      ];
      end = [
        {
          type = "volume";
        }
        {
          type = "notifications";
        }
        # {
        #   type = "upower";
        # }
        {
          type = "tray";
        }
      ];
    };
    style = ''
    '';
  };
}
