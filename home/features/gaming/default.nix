{pkgs, ...}: {
  home.packages = with pkgs; [
    # jc141
    dwarfs
    fuse-overlayfs
    psmisc
    bubblewrap

    # prism
    (prismlauncher.override {withWaylandGLFW = true;})
    # prismlauncher
    # temurin-bin-17

    # steam
    steam
  ];
}
