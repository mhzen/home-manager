{
  lib,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "ghostty/config".text = ''
      # https://ghostty.org/docs/config/reference
      font-family = JetBrainsMono Nerd Font Mono
      font-size = 14
      command = ${lib.getExe pkgs.fish}
      theme = gruvbox-material
      maximize = true
    '';
  };
}