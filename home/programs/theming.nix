{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = pkgs.fetchurl {
      # url = "https://w.wallhaven.cc/full/ex/wallhaven-exyzjo.jpg";
      url = "https://w.wallhaven.cc/full/13/wallhaven-13j2vv.jpg";
      # sha256 = "sha256-S0AFZDnn4K9j2D/WD9SWxDkNmwiXlLli1l6sy9g1qfg=";
      sha256 = "sha256-rGK/M/GEj3FTrzSHhIXjPWv+97ILm26lFRNgm67h/Mk=";
    };
    # image = ../../../Pictures/wallhaven-3lepy9.jpg;
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
    # theme = {
    #   name = lib.mkForce "Breeze";
    #   package = lib.mkForce pkgs.kdePackages.breeze-gtk;
    # };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

  # home.pointerCursor = {
  #   name = "Bibata-Modern-Ice";
  #   size = 23;
  #   package = pkgs.bibata-cursors;
  #   gtk.enable = true;
  #   x11 = {
  #     enable = true;
  #     defaultCursor = "Bibata-Modern-Ice";
  #   };
  # };
  #
  # gtk = {
  #   enable = true;
  #   font = {
  #     name = "Inter";
  #     package = pkgs.inter;
  #     size = 12;
  #   };
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   theme = {
  #     name = "adw-gtk3-dark";
  #     package = pkgs.adw-gtk3;
  #   };
  # };
  #
  # qt = {
  #   enable = true;
  #   platformTheme = "gtk";
  #   style = {
  #     name = "adwaita-dark";
  #     package = pkgs.adwaita-qt6;
  #   };
  # };
  #
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
  # };
  #
  # xdg.configFile = {
  #   "gtk-3.0/gtk.css".source = ./gtk/gtk.css;
  #   "gtk-4.0/gtk.css".source = ./gtk/gtk.css;
  # };
}
