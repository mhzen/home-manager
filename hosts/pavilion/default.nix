{
  pkgs,
  inputs,
  ...
}:{
  imports = [
    inputs.chaotic.nixosModules.default
    # hardware config
    ./hardware-configuration.nix

    # common config
    ../common

    # boot
    ../common/boot/systemd-boot.nix

    # gui: hyprland
    ../common/gui
    # ../common/gui/gdm.nix
    # ../common/gui/sddm.nix
    # ../common/gui/kde.nix
    ../common/gui/hyprland.nix
    # ../common/gui/gnome.nix

    # intel hardware accelerationn
    ../common/gui/intel.nix

    # sound setup
    ../common/sound

    # networking setup
    ../common/networking/dns.nix
    ../common/networking/bluetooth.nix

    # services
    ../common/services/zram.nix
    ../common/services/fstrim.nix
    ../common/services/kanata.nix
    ../common/services/powersave.nix

    # users
    ../common/users.nix
  ];

  # boot
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  networking.hostName = "pavilion";
}
