{pkgs, ...}: {
  environment.systemPackages = [pkgs.cachix];

  nix.settings = {
    substituters = [
      "https://cache.nixos.org?priority=10"
      "https://nyx.chaotic.cx"
      "https://chaotic-nyx.cachix.org"
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nyx.chaotic.cx-1:hfnxsw4pj95ii/n17ridy40aghj12wff+gqk6sonit8="
      "chaotic-nyx.cachix.org-1:hfnxsw4pj95ii/n17ridy40aghj12wff+gqk6sonit8="
      "anyrun.cachix.org-1:pqbobmoji7nklsumv25u9qha9btjk65/c8vno3p346s="
      "hyprland.cachix.org-1:a7pgxzmz7+chwvl3/pzj6jibmioijm7ypfp8pwtkugc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
