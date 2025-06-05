{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
    nixgl,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    user = "mhzen";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      "mhzen@hinge" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs user;};
        modules = [
          ./home
          ./home/hosts/hinge.nix
        ];
      }; 
    };
  };
} 