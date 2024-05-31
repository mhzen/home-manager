{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
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
