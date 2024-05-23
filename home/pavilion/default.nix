{
  imports = [
    ../features

    ../features/shell
    ../features/shell/distrobox.nix
    ../features/shell/beet.nix

    ../features/apps
    ../features/apps/thunar.nix
    ../features/apps/qutebrowser.nix
    ../features/apps/docs.nix
    # ../features/apps/discord.nix

    ../features/media
    # ../features/gaming

    # ../features/desktop/plasma.nix
    ../features/desktop/hyprland

    ../features/theming
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
