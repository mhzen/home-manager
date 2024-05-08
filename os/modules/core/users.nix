{pkgs, ...}: {
  imports = [
    ../shell/fish.nix
  ];

  # Defines the default user.
  users.users.mham = {
    name = "mham";
    description = "Mham";
    home = "/home/mham";
    isNormalUser = true;
    group = "users";
    initialPassword = "nixos";
    uid = 1000;
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  # Change me later!
  users.users.root.initialPassword = "nixos";

  environment = {
    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_BIN_HOME = "$HOME/.local/bin";
    };
  };

  security.sudo.extraConfig = ''
    Defaults   insults
  '';
}
