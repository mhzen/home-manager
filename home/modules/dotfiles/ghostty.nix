{
  lib,
  pkgs,
  ...
}:{
  xdg.configFile = {
    # https://ghostty.org/docs/config/reference
    "ghostty/config".text = ''
      font-family = JetBrainsMono Nerd Font Mono
      font-size = 14
      command = ${lib.getExe pkgs.fish}
      theme = gruvbox-material
      maximize = true
    '';
  };
}
