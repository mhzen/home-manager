{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix

    # core configuration
    ../modules/core

    # hyprland setup
    # ../modules/gui/hyprland.nix
    ../modules/gui/plasma.nix

    # hardware setup
    # ../modules/hardware/audio.nix # taken care by hyprland
    # ../modules/hardware/bluetooth.nix
    ../modules/hardware/intel.nix
    ../modules/hardware/powersave.nix
    ../modules/hardware/ram.nix
    ../modules/hardware/ssd.nix

    # services
    # ../modules/services/docker.nix
    ../modules/services/podman.nix
    ../modules/services/dns.nix
    ../modules/services/kanata.nix
    # ../modules/services/ollama.nix
  ];

  # boot
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = ["ntfs"];
  };
  networking.hostName = "pavilion";
}
