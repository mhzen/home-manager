{pkgs, ...}: {
  imports = [
    # shell
    ./fish.nix
    ./bash.nix

    # shell ext
    ./yazi.nix

    # git
    ./git.nix
    ./ssh.nix

    # nix stuff
    ./direnv.nix
    ./nix-index.nix
  ];

  home.packages = with pkgs; [
    # man pages
    man
    man-pages
    tealdeer

    fastfetch

    fd
    trashy
    ouch
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [batman batdiff batgrep];
    };
    fzf.enable = true;
    lsd = {
      enable = true;
      enableAliases = true;
    };
    zoxide.enable = true;
    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=150"
        "--max-columns-preview"
        "--smart-case"
      ];
    };
    starship.enable = true;
  };
}
