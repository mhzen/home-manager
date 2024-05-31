{lib, ...}: {
  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = lib.mkDefault true;
  };
}
