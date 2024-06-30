{pkgs, ...}: {
  imports = [
    ../programs/fish.nix
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

  security.sudo.extraConfig = ''
    Defaults   insults
  '';
}
