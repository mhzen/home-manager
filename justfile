update:
  home-manager switch --flake .#mham@ttyhero

clean:
  nix-collect-garbage -d

add:
  git add .
