{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    pavilion = nixosSystem {
      inherit specialArgs;
      modules = [
        ./pavilion/default.nix
      ];
    };
  };
}
