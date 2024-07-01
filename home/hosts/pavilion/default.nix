{
  imports = [
    ../../features

    ../../features/shell
    ../../features/shell/distrobox.nix

    ../../features/editors/nixvim.nix
    ../../features/editors/vscode.nix

    ../../features/apps

    ../../features/browsers/firefox.nix

    ../../features/gaming

    ../../features/media/beet.nix
    ../../features/media/g4music.nix
    ../../features/media/transmission.nix

    ../../features/gui/plasma.nix

    ../../features/services

    ../../features/theming
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
