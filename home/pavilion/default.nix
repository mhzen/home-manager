{
  imports = [
    ../features

    ../features/shell
    ../features/shell/distrobox.nix

    ../features/apps
    ../features/apps/thunar.nix
    ../features/apps/qutebrowser.nix
    ../features/apps/docs.nix

    ../features/media
    ../features/media/beet.nix

    ../features/desktop/gnome.nix

    ../features/theming
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
