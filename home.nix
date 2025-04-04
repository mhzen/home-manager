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

  systemd.user.startServices = false;
  targets.genericLinux.enable = true;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";
    sessionVariables = {
      SHELL = "${lib.getExe pkgs.fish}";
    };
    path = {
      enable = true;
      prepend = [
        "$HOME/.nix-profile/bin"
        "/nix/var/nix/profiles/default/bin"
      ];
    };
  };

  manual = {
    json.enable = false;
    html.enable = false;
    manpages.enable = false;
  };

  nixGL.packages = inputs.nixgl.packages;

  home.packages = with pkgs; [
    asciinema
    bat
    fd
    ripgrep
    trash-cli
    television
    lazygit
    just
    devbox
    nerd-fonts.jetbrains-mono
  ];

  programs = {
    home-manager.enable = true;

    ghostty = {
      enable = true;
      enableFishIntegration = true;
      package = (config.lib.nixGL.wrap pkgs.ghostty);
      settings = {
        font-family = "Jetbrains Mono Nerd Font";
        font-size = "14";
        command = "${lib.getExe pkgs.fish}";
        theme = "GruvboxDarkHard";
        maximize = true;
      };
    };

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
        up = "home-manager switch -b backup";
      };
      functions = {
        mkcd = "mkdir -pv $argv; cd $argv;";
      };
      plugins = [
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
        {
          name = "hydro";
          src = pkgs.fishPlugins.hydro.src;
        }
      ];
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
