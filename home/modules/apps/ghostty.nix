{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nixgl.nix
  ];

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    package = (config.lib.nixGL.wrap pkgs.ghostty);
    settings = {
      font-family = "Jetbrains Mono Nerd Font";
      font-size = "14";
      command = "${lib.getExe pkgs.fish}";
      theme = "gruvbox-material";
      maximize = true;
    };
  };
}
