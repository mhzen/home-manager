#!/bin/bash
set -euo pipefail

usage() {
  cat <<EOF
Usage: $0 {switch|setup}
EOF
  exit 1
}

if [ $# -ne 1 ]; then
  usage
fi

case "$1" in
  switch)
    home-manager switch --flake .
    ;;
  setup)
    nix run home-manager -- switch --flake .
    ;;
  *)
    echo "Error: Unknown command '$1'"
    usage
    ;;
esac

