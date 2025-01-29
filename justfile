_default:
    @just switch

switch: add
  home-manager switch --flake .

clean:
  nix-collect-garbage -d

add:
  git add .
