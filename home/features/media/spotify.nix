{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.nur.overlay
  ];

  home.packages = with pkgs; [
    nur.repos.nltch.spotify-adblock
  ];
}
