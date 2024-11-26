{inputs, ...}: {
  imports = [ inputs.nix-index-database.hmModules.nix-index ];
  programs.nix-index-database.comma.enable = true;
  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    # enableFishIntegration = true;
  };
}
