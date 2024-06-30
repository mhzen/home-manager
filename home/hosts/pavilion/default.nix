{
  imports = [
    ../../features

    ../../features/shell
    ../../features/shell/distrobox.nix

    ../../features/editors/nixvim.nix
    ../../features/editors/vscode.nix

    ../../features/apps
    ../../features/apps/discord.nix
    ../../features/apps/libreoffice.nix
    ../../features/apps/obsidian.nix
    ../../features/apps/wezterm.nix
    ../../features/apps/newsflash.nix

    ../../features/browsers/firefox.nix

    ../../features/gaming

    ../../features/media/beet.nix
    ../../features/media/g4music.nix
    ../../features/media/celluloid.nix
    ../../features/media/transmission.nix

    # ../../features/gui/gnome.nix
    ../../features/gui/plasma.nix

    ../../features/services

    ../../features/theming
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
