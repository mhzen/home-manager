{pkgs, ...}: {
  home.packages = with pkgs; [
    xfce.thunar
  ];

  # xdg.mimeApps.defaultApplications = {
  #   "image/png" = ["imv.desktop"];
  #   "image/jpeg" = ["imv.desktop"];
  #   "image/svg" = ["imv.desktop"];
  #   "image/gif" = ["imv.desktop"];
  #   "image/tiff" = ["imv.desktop"];
  #   "image/raw" = ["imv.desktop"];
  #   "image/webp" = ["imv.desktop"];
  #   # "video/mp4" = ["mpv.desktop"];
  # };
}
