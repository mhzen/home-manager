{pkgs, ...}: {
  imports = [
    # neovim
    ./nixvim.nix

    # shell
    ./fish.nix

    # git
    ./git.nix
    ./ssh.nix
  ];

  home.packages = with pkgs; [
    # cli tool
    bat
    fd
    ripgrep
    httpie
    jq
    fzf
    git
    lsd
    trashy
    fastfetch
    starship

    # man pages
    man
    man-pages

    # nix shit
    nh # nixos and home manager wrapper
    cachix
    comma
    appimage-run
    alejandra
  ];
}
