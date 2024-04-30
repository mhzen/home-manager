{
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    # theme = "Gruvbox Material Dark Medium";
    # font = {
    #   package = pkgs.nerdfonts;
    #   name = "JetBrains Mono Nerd Font";
    # };
    shellIntegration.enableFishIntegration = true;
  };
}
