{ pkgs, ... }: {
  home = {
    username = "mham";
    homeDirectory = "/home/mham";
    stateVersion = "24.11";

    packages = with pkgs; [
      just
    ];
  };

  imports = [
    # shell
    ./features
    ./features/shell.nix
    ./features/direnv.nix
    ./features/git.nix
    ./features/ssh.nix
    ./features/nix-index.nix
    ./features/lazyvim
  ];

  programs.home-manager.enable = true;
}
