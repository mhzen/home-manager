{pkgs, ...}: {
  imports = [
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    # fix stuff
    shared-mime-info
    xdg-utils
    pavucontrol
  ];
}
