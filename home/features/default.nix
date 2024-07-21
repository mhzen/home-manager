{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.nur.hmModules.nur
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";

  home.activation = {
    linkDesktopApplications = {
      after = ["writeBoundary" "createXdgUserDirectories"];
      before = [];
      data = ''
        rm -rf ${config.xdg.dataHome}/"applications/home-manager"
        mkdir -p ${config.xdg.dataHome}/"applications/home-manager"
        cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/"applications/home-manager/"
      '';
    };
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "$HOME/.nix-profile/share/applications"
  ];
}
