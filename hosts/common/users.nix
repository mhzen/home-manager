{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  users.users.mham = {
    shell = pkgs.fish;
    description = "Mham";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
  };
  security.sudo.extraConfig = ''
    Defaults   insults
  '';
}
