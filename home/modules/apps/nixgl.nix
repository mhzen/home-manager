{
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      inputs.nixgl.overlays.default
    ];
  };

  nixGL.packages = inputs.nixgl.packages;
}
