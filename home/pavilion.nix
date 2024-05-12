{
  imports = [
    ./modules

    ./modules/shell
    ./modules/shell/distrobox.nix
    ./modules/shell/beet.nix
    ./modules/shell/zellij.nix

    ./modules/apps
    ./modules/apps/discord.nix
    ./modules/apps/gaming.nix
    ./modules/apps/qutebrowser.nix
    ./modules/apps/spicetify.nix

    ./modules/theming/stylix.nix
  ];

  home = {
    username = "mham";
    homeDirectory = "/home/mham";
  };
}
