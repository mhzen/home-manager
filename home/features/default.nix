{inputs, ...}: {
  imports = [
    inputs.nur.hmModules.nur
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
