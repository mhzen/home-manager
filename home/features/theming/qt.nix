{config, ...}: {
  qt = {
    enable = true;
    platformTheme = "gnome";
    style.name = "adwaita";
  };
  # xdg.configFile = {
  #   "Kvantum/kvantum.kvconfig".text = ''
  #     [General]
  #     theme=MateriaDark
  #   '';
  #   "Kvantum/MateriaDark".source = "${pkgs.materia-kde-theme}/share/Kvantum/MateriaDark";
  # };
}
