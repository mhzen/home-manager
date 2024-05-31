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
    ./ouch.nix
    ./yazi.nix

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

    fastfetch

    fd
    trashy
  ];
}
