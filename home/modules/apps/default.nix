{pkgs, ...}: {
  imports = [
    ./firefox.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    # docs
    zathura

    # multimedia
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
    defaultApplications = {
      "application/pdf" = ["zathura.desktop"];
    };
  };
}
