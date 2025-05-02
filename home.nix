{
  config,
  pkgs,
  inputs,
  lib,
  user,
  ...
}: {
  imports = [
    ./lazyvim
    inputs.nix-index-database.hmModules.nix-index
  ];

  nixpkgs = {
    overlays = [
      inputs.nixgl.overlays.default
    ];
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
  targets.genericLinux.enable = true;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";
  };

  manual = {
    json.enable = false;
    html.enable = false;
    manpages.enable = false;
  };

  # nixGL.packages = inputs.nixgl.packages;

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

    nerd-fonts.jetbrains-mono
  ];

  programs = {
    home-manager.enable = true;

    # ghostty = {
    #   enable = true;
    #   enableFishIntegration = true;
    #   package = (config.lib.nixGL.wrap pkgs.ghostty);
    #   settings = {
    #     font-family = "Jetbrains Mono Nerd Font";
    #     font-size = "14";
    #     command = "${lib.getExe pkgs.fish}";
    #     theme = "GruvboxDarkHard";
    #     maximize = true;
    #   };
    # };

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

  xdg.configFile = {
    # https://ghostty.org/docs/config/reference
    "ghostty/config".text = ''
      font-family = JetBrainsMono Nerd Font Mono
      font-size = 14
      command = ${lib.getExe pkgs.fish}
      theme = GruvboxDarkHard
      maximize = true
    '';
  };
}
