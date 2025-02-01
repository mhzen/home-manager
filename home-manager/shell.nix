{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];

  home.packages = with pkgs; [
    trashy
    lazygit
    just
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [batman batdiff batgrep];
    };

    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };

    fd.enable = true;

    fzf.enable = true;

    lsd = {
      enable = true;
      enableAliases = true;
    };

    ripgrep.enable = true;

    starship = {
      enable = true;
    };

    tealdeer = {
      enable = true;
    };

    zoxide.enable = true;

    fish = {
      enable = true;
      interactiveShellInit = ''
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


    nix-index-database.comma.enable = true;
    command-not-found.enable = false;
    nix-index = {
      enable = true;
    };

    zellij = {
      enable = true;
      settings = {
        simplified_ui = true;
        default_shell = "${lib.getExe pkgs.fish}";
        pane_frames = false;
        theme = "gruvbox";
      };
    };
  };
}
