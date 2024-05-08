{
  imports = [
    ./modules
    ./modules/cli
    ./modules/cli/distrobox.nix
    ./modules/gui
    ./modules/gui/gaming.nix
    ./modules/gui/hyprland
    ./modules/gui/stylix.nix
    ./modules/services
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
