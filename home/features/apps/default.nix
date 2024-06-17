{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./localsend.nix
  ];

  home.packages = with pkgs; [
    # fix stuff
    shared-mime-info
    xdg-utils
    pavucontrol
  ];
}
