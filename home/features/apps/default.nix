{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    # fix stuff
    shared-mime-info
    xdg-utils
    pavucontrol
  ];
}
