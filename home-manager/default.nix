{...}: {
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

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
    stateVersion = "24.11";
  };

  imports = [
    ./shell.nix
    ./lazyvim
  ];
}
