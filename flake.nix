{
  description = "Warofzen's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org?priority=10"
      # "https://nyx.chaotic.cx"
      "https://chaotic-nyx.cachix.org"
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
      "https://niri.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      # "nyx.chaotic.cx-1:hfnxsw4pj95ii/n17ridy40aghj12wff+gqk6sonit8="
      # "chaotic-nyx.cachix.org-1:hfnxsw4pj95ii/n17ridy40aghj12wff+gqk6sonit8="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "anyrun.cachix.org-1:pqbobmoji7nklsumv25u9qha9btjk65/c8vno3p346s="
      "hyprland.cachix.org-1:a7pgxzmz7+chwvl3/pzj6jibmioijm7ypfp8pwtkugc="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland?submodules=1?ref=v0.40.0";
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./home/hosts
        ./system/hosts
        inputs.pre-commit-hooks.flakeModule
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            alejandra
            git
            nodePackages.prettier
            nixFlakes
            home-manager
            nh
          ];
          name = "nix-config";
          DIRENV_LOG_FORMAT = "";
          shellHook = ''
            ${config.pre-commit.installationScript}
          '';
        };

        pre-commit = {
          settings.excludes = ["flake.lock"];

          settings.hooks = {
            alejandra.enable = true;
            prettier = {
              enable = true;
              excludes = [".js" ".md" ".ts"];
            };
          };
        };

        formatter = pkgs.alejandra;
      };
    };
}
