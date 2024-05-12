{pkgs, ...}: {
  home.packages = with pkgs; [
    (prismlauncher.override {withWaylandGLFW = true;})
    temurin-bin-17
    steam
    osu-lazer-bin
  ];
}
