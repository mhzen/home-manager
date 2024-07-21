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
        rm -rf ${config.home.homeDirectory}/.nix-desktop-files
        rm -rf ${config.home.homeDirectory}/.local/share/applications/home-manager
        rm -rf ${config.home.homeDirectory}/.icons/nix-icons
        mkdir -p ${config.home.homeDirectory}/.nix-desktop-files
        mkdir -p ${config.home.homeDirectory}/.icons
        ln -sf ${config.home.homeDirectory}/.nix-profile/share/icons ${config.home.homeDirectory}/.icons/nix-icons
        /usr/bin/desktop-file-install ${config.home.homeDirectory}/.nix-profile/share/applications/*.desktop --dir ${config.home.homeDirectory}/.local/share/applications/home-manager
        sed -i 's/Exec=/Exec=\/home\/${config.home.username}\/.nix-profile\/bin\//g' ${config.home.homeDirectory}/.local/share/applications/home-manager/*.desktop
        /usr/bin/update-desktop-database ${config.home.homeDirectory}/.local/share/applications
      '';
    };
  };

  # home.sessionPath = [
  #   "$HOME/.nix-profile/bin"
  #   "$HOME/.nix-profile/share/applications"
  # ];
}
