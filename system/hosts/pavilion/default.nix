{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix

    # core configuration
    ../../features/core

    # /..desktop setup
    # ../../features/gui/gnome.nix
    ../../features/gui/plasma.nix
    # ../../features/gui/hyprland.nix

    # /..hardware setup
    ../../features/hardware/intelgpu.nix
    ../../features/hardware/powersave.nix
    ../../features/hardware/fstrim.nix
    ../../features/hardware/zram.nix
    ../../features/hardware/fwupd.nix

    # /..services
    ../../features/services/podman.nix
    ../../features/services/dns.nix
    ../../features/services/kanata.nix
    ../../features/services/flatpak.nix

    # programs
    ../../features/programs
    ../../features/programs/steam.nix
  ];

  # boot
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = ["ntfs"];
  };
  chaotic.scx.enable = true;
  networking.hostName = "pavilion";
}
