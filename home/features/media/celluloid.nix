{pkgs, ...}: {
  imports = [
    ./mpv.nix
  ];

  home.packages = [pkgs.celluloid];
}
