{
  pkgs,
  lib,
  ...
}: {
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

    gnome = {
      gnome-initial-setup.enable = lib.mkForce false;
      gnome-online-accounts.enable = lib.mkForce false;
      gnome-online-miners.enable = lib.mkForce false;
      gnome-browser-connector.enable = lib.mkForce false;
      evolution-data-server.enable = lib.mkForce false;
    };
  };

  environment.gnome.excludePackages =
    (with pkgs.gnome; [
      gnome-backgrounds
      yelp
      epiphany
      geary
      gnome-contacts
      gnome-software
      gnome-weather
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
