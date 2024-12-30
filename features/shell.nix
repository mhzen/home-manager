{ pkgs, ...}: {
  home.packages = with pkgs; [
    tealdeer
    fd
    trashy
    ouch
    lazygit
    gcc
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
  };

}
