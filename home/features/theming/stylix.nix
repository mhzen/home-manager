{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = pkgs.fetchurl {
      name = "evening-sky.jpg";
      url = "https://w.wallhaven.cc/full/3l/wallhaven-3l6jj9.jpg";
      sha256 = "sha256-m4l83eNlBVwlpwwzLbF4xrR/cVujeb7uCjz1iWFw/Wk=";
    };
    # image = ../../../resources/wallpaper/wallhaven-l8o29q.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ia-dark.yaml";
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.nerdfonts;
        name = "JetBrains Mono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 22;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
