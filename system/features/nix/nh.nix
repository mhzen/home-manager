{
  programs.nh = {
    enable = true;
    flake = /home/mham/nix-config;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
