{
  description = "Home Manager configuration";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org?priority=10"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default-linux";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    user = "mham";
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      extraSpecialArgs = {inherit inputs user;};
      modules = [./home-manager];
    };

    devShells.${system} = import ./shell.nix {inherit pkgs;};
  };
}
