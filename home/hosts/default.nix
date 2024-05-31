{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations = let
    inherit (inputs.home-manager.lib) homeManagerConfiguration;
    extraSpecialArgs = {inherit inputs self;};
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    "mham@pavilion" = homeManagerConfiguration {
      inherit pkgs extraSpecialArgs;
      modules = [
        ./pavilion
      ];
    };
  };
}
