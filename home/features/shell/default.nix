{pkgs, ...}: {
  imports = [
    # shell
    ./fish.nix
    ./bash.nix

    # shell ext
    ./bat.nix
    ./lsd.nix
    ./zoxide.nix
    ./ripgrep.nix
    ./starship.nix

    # git
    ./git.nix
    ./ssh.nix

    # nix stuff
    ./direnv.nix
    ./nix-index.nix

    # shell editor
    ../editors/nixvim.nix
  ];

  home.packages = with pkgs; [
    # man pages
    man
    man-pages
    tealdeer

    nh # nixos and home manager wrapper

    # archive stuff
    p7zip
    unzip
    unrar

    fastfetch

    yazi
    fd
    trashy
  ];
}
