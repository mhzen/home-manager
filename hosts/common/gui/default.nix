{
  # imports = [
  #   ./gdm.nix
  #   ./intel.nix
  #   ./hyprland.nix
  # ];
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
