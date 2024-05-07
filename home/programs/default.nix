{
  pkgs,
  ...
}:{
  imports = [
    # ./hyprland
    # ./plasma
    ./theming.nix
    ./gaming.nix
    ./browsers.nix
  ];

  home.packages = with pkgs; [
    # internet stuff
    vesktop

    # files
    cinnamon.nemo-with-extensions

    # docs
    zathura

    # customizations
    papirus-icon-theme
    qadwaitadecorations
    nerdfonts
    bibata-cursors

    # multimedia
    mpv
    g4music
    imv
    pavucontrol
    gimp
    tauon
    youtube-music

    # downloading
    transmission_4-gtk

    # fix stuff
    shared-mime-info
  ];

  xdg.mimeApps = {
    enable = true;
  };
}
