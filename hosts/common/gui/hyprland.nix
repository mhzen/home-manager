{
  imports = [
    ../services/gvfs.nix
    ./wayland.nix
    ./greetd.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
