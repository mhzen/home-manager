{
  user,
  ...
}:{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.user.startServices = false;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";
  };

  manual = {
    json.enable = false;
    html.enable = false;
    manpages.enable = false;
  };
}
