{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix

    # core configuration
    ../features/core

    # desktop setup
    ../features/gui/gnome.nix

    # hardware setup
    ../features/hardware/intel.nix
    ../features/hardware/powersave.nix
    ../features/hardware/ppd.nix
    ../features/hardware/ram.nix
    ../features/hardware/ssd.nix

    # services
    ../features/services/podman.nix
    ../features/services/dns.nix
    ../features/services/kanata.nix
    ../features/services/flatpak.nix
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
  networking.hostName = "pavilion";
}
