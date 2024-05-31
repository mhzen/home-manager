{
  imports = [
    ../../features

    ../../features/shell
    ../../features/shell/distrobox.nix

    ../../features/apps
    ../../features/apps/libreoffice.nix
    ../../features/apps/obsidian.nix

    ../../features/browsers/firefox.nix

    ../../features/media
    ../../features/media/beet.nix

    ../../features/gui/gnome.nix

    ../../features/theming
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
