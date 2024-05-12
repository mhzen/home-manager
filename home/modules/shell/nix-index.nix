{inputs, ...}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];

  programs.nix-index-database.comma.enable = true;

  # `command-not-found` relies on nix-channel.
  # Enable and use `nix-index` instead.
  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
