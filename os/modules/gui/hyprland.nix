{
  imports = [
    ./greetd.nix
    ./wayland.nix
    ../hardware/audio.nix
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
