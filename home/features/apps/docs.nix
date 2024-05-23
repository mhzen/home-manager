{pkgs, ...}: {
  home.packages = with pkgs; [
    zathura
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["zathura.desktop"];
    };
  };
}
