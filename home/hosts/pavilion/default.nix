{
  imports = [
    ../../features

    ../../features/shell
    ../../features/shell/distrobox.nix

    ../../features/apps
    ../../features/apps/discord.nix
    ../../features/apps/libreoffice.nix
    ../../features/apps/obsidian.nix
    ../../features/apps/wezterm.nix

    ../../features/browsers/firefox.nix

    ../../features/gaming

    ../../features/media
    ../../features/media/beet.nix
    ../../features/media/g4music.nix

    ../../features/gui/gnome.nix

    ../../features/theming
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
