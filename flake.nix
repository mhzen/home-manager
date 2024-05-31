{
  description = "Warofzen's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org?priority=10"
      "https://nyx.chaotic.cx"
      "https://chaotic-nyx.cachix.org"
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nyx.chaotic.cx-1:hfnxsw4pj95ii/n17ridy40aghj12wff+gqk6sonit8="
      "chaotic-nyx.cachix.org-1:hfnxsw4pj95ii/n17ridy40aghj12wff+gqk6sonit8="
      "anyrun.cachix.org-1:pqbobmoji7nklsumv25u9qha9btjk65/c8vno3p346s="
      "hyprland.cachix.org-1:a7pgxzmz7+chwvl3/pzj6jibmioijm7ypfp8pwtkugc="
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
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    devShells = forAllSystems (system: import ./shell.nix {pkgs = nixpkgs.legacyPackages.${system};});

    nixosConfigurations = {
      pavilion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./os/hosts/pavilion
        ];
      };
    };

    homeConfigurations = {
      "mham@pavilion" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/hosts/pavilion
        ];
      };
    };
  };
}
