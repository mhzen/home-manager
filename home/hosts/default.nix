{
  self,
  inputs,
  ...
}: let
  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "mham@pavilion" = [
      ./pavilion
    ];
  };
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "mham@pavilion" = homeManagerConfiguration {
        modules = homeImports."mham@pavilion";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
