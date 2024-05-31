{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ../hardware/audio.nix
  ];

  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };
  environment.gnome.excludePackages =
    (with pkgs.gnome; [
      gnome-backgrounds
      gnome-themes-extra
      yelp
      epiphany
      geary
    ])
    ++ (with pkgs; [
      gnome-tour
      gnome-user-docs
      orca
    ]);

  environment.systemPackages = with pkgs.gnome; [
    gnome-tweaks
  ];
}
