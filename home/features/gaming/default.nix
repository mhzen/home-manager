{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs;
    [
      # jc141
      dwarfs
      fuse-overlayfs
      psmisc
      bubblewrap

      # prism
      (prismlauncher.override {withWaylandGLFW = true;})

      bottles
      lutris
      protonplus
    ]
    ++ [
      inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    ];
}
# steam is on nixos config

