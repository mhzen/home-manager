{
  pkgs,
  ...
}:{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    excludePackages = [ pkgs.xterm ];
  };
  programs.dconf.enable = true;
}
