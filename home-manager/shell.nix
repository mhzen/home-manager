{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];

  home.packages = with pkgs; [
    tealdeer
    fd
    trashy
    ouch
    lazygit
    devenv
    fastfetch
    devbox
    just
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
    topgrade = {
      enable = true;
      settings = {
        misc = {
          pre_sudo = true;
        };
        linux = {
          home_manager_arguments = [
            "--flake"
            "/home/mham/.config/nix-config"
          ];
        };
      };
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        fish_add_path ~/.local/bin
        set fish_greeting
      '';
      shellAbbrs = {
        rt = "trash put";
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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userName = "mham";
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
      # enableFishIntegration = true;
    };

    # zellij = {
    #   enable = true;
    #   settings = {
    #     simplified_ui = true;
    #     default_shell = "${lib.getExe pkgs.fish}";
    #     pane_frames = false;
    #     theme = "gruvbox";
    #   };
    # };
  };
}
