{
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    inputs.nix-index-database.hmModules.nix-index
    ./lazyvim
  ];

  home.packages = with pkgs; [
    bat
    fd
    ripgrep
    trash-cli
    television
    lazygit
    just
    devbox
    gh
  ];

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };

    fzf.enable = true;

    lsd = {
      enable = true;
      enableAliases = true;
    };

    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };

    zoxide.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      shellAbbrs = {
        rt = "trash-put";
        lg = "lazygit";
      };
      functions = {
        mkcd = "mkdir -pv $argv; cd $argv;";
      };
      plugins = [
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
      ];
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      userName = user;
      userEmail = "warofzen1@proton.me";
      extraConfig = {
        gpg.format = "ssh";
        commit.gpgsign = true;
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };

    nix-index-database.comma.enable = true;
    command-not-found.enable = false;
    nix-index = {
      enable = true;
    };
  };
}
