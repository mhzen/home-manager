{
  pkgs,
  lib,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  systemd.user.startServices = false;

  home = {
    username = "mhzen";
    homeDirectory = lib.mkDefault "/home/mhzen";
    stateVersion = "24.11";
  };

  manual = {
    json.enable = false;
    html.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat
    fd
    fzf
    ripgrep
    lazygit
    just
    devbox
    gh
    comma
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
      ignores = [".build/" "!.gitignore"];
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

    zoxide = {
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
        cht = "curl cht.sh/$argv;";
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
      userName = "mhzen";
      userEmail = "warofzen1@proton.me";
      extraConfig = {
        gpg.format = "ssh";
        commit.gpgsign = true;
        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
    };
  };

  xdg.configFile = {
    "ghostty/config".text = ''
      # https://ghostty.org/docs/config/reference
      font-family = JetBrainsMono Nerd Font Mono
      font-size = 14
      command = ${lib.getExe pkgs.fish}
      theme = gruvbox-material
      maximize = true
    '';
    "zed/settings.json".text = builtins.toJSON {
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "system";
        light = "Gruvbox Light Hard";
        dark = "Gruvbox Dark Hard";
      };
      terminal.shell.program = "fish";
    };
  };
}
