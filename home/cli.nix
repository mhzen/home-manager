{
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];

  home.packages = with pkgs; [
    bat
    fd
    fzf
    ripgrep
    lazygit
    just
    devbox
    gh
    zoxide
  ];

  programs = {
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };

    helix = {
      enable = true;
      defaultEditor = true;
      ignores = [ ".build/" "!.gitignore" ];
      package = pkgs.evil-helix;
      extraPackages = with pkgs; [
        nil
        lua-language-server
        marksman
      ];
      settings = {
        theme = "gruvbox";
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };

    lsd = {
      enable = true;
      enableFishIntegration = true;
    };

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
