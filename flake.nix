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

  # outputs = {
  #   nixpkgs,
  #   home-manager,
  #   nix-index-database,
  #   ...
  # }: 
  # let
  #   lib = nixpkgs.lib;
  #   system = "x86_64-linux";
  #   pkgs = import nixpkgs { inherit system; };
  # in {
  #   homeConfigurations.mham =
  #     home-manager.lib.homeManagerConfiguration {
  #       inherit pkgs;
  #       modules = [ ./home.nix ];
  #     };
  #   };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-index-database,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    homeConfigurations = {
      "mham@ttyhero" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
