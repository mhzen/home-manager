{
  imports = [
    ./gdm.nix
    ./wayland.nix
  ];

  services.xserver.desktopManager.gnome = {
    enable = true;
  };
}
