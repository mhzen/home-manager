switch:
  home-manager switch --flake .

setup:
  nix run home-manager -- switch --flake .

clean:
  nix-collect-garbage -d

add:
  git add .
