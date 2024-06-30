{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./greetd.nix
    ./wayland.nix
    ../hardware/audio.nix
  ];
  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
