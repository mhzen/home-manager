{lib, ...}: {
  home.homeDirectory = lib.mkForce "/var/home/mhzen";
}
