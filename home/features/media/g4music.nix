{pkgs, ...}: {
  imports = [
    ./scrobbler.nix
  ];

  home.packages = [pkgs.g4music];
}
