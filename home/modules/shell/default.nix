{pkgs, ...}: {
  imports = [
    # shell editor
    ../editors/nixvim.nix

    # shell
    ./fish.nix
    ./bash.nix

    # git
    ./git.nix
    ./ssh.nix

    # nix stuff
    ./direnv.nix
    ./nix-index.nix
  ];

  home.packages = with pkgs; [
    # cli tool
    fd
    trashy
    fastfetch

    # man pages
    man
    man-pages
    tealdeer

    # nix stuff
    nh # nixos and home manager wrapper
    # comma
    appimage-run
    alejandra
  ];

  programs = {
    zoxide = {
      enable = true;
    };
    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=150"
        "--max-columns-preview"
        "--smart-case"
      ];
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [batman batdiff batgrep];
    };
    fzf = {
      enable = true;
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    starship = {
      enable = true;
    };
  };
}
