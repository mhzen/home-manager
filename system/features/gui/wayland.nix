{
  imports = [
    ./common.nix
  ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
