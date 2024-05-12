{
  pkgs,
  config,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      (rofi-calc.override {rofi-unwrapped = rofi-wayland-unwrapped;})
      # rofimoji
      # rofi-power-menu
    ];
    extraConfig = {
      show-icons = true;
      modi = "calc,combi,drun,run,window";
    };
    theme = {
      "*" = {
        padding = 0;
        spacing = 0;
      };

      "#window" = {
        border-radius = mkLiteral "6px";
        border-color = mkLiteral "@foreground";
        border = mkLiteral "1px";
      };

      "#inputbar" = {
        padding = mkLiteral "6px 12px";
        spacing = mkLiteral "12px";
      };

      "#message" = {
        border = mkLiteral "2px 0 0";
      };

      "#textbox" = {
        padding = mkLiteral "4px 12px";
      };

      "#listview" = {
        lines = 8;
        column = 1;
        fixed-height = true;
        border = mkLiteral "1px 0 0";
      };

      "#element" = {
        padding = mkLiteral "6px 12px";
        spacing = mkLiteral "12px";
      };
    };
  };

  home.packages = with pkgs; [
    rofimoji
    rofi-power-menu
  ];
}
