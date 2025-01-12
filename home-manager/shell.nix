{ pkgs, inputs, ...}: {
  imports = [ inputs.nix-index-database.hmModules.nix-index ];

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
            "--flake" "/home/mham/.config/nix-config"
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
        # ls = "lsd";
      };
      functions = {
        mkcd = "mkdir -pv $argv; cd $argv;";
        yy = ''
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"
          if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          	cd -- "$cwd"
          end
          rm -f -- "$tmp"
        '';
      };
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
        init.defaultBranch = "main";

        gpg = {
          format = "ssh";
          # ssh.defaultKeyCommand = "sh -c 'echo key::$(ssh-add -L | head -1)'";
        };
        commit.gpgsign = true;

        commit.verbose = true;
        diff.algorithm = "histogram";
        log.date = "iso";
        column.ui = "auto";
        branch.sort = "committerdate";
        # Automatically track remote branch
        push.autoSetupRemote = true;
        # Reuse merge conflict fixes when rebasing
        rerere.enabled = true;

        user.signingkey = "~/.ssh/id_ed25519.pub";
      };
      ignores = [
        ".direnv"
        "result"
      ];
    };
    nix-index-database.comma.enable = true;
    command-not-found.enable = false;
    nix-index = {
      enable = true;
      # enableFishIntegration = true;
    };
  };
}
