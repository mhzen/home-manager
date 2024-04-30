{
  imports = [
    ./programs
    ./terminal
    ./services
  ];

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      QT_WAYLAND_DECORATION = "adwaita";
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
}
