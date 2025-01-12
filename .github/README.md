```
.
├── flake.lock
├── flake.nix
├── home-manager
│   ├── configs
│   │   └── default.nix
│   ├── default.nix
│   ├── font.nix
│   ├── lazyvim
│   │   ├── default.nix
│   │   └── nvim
│   │       ├── init.lua
│   │       ├── lua
│   │       │   ├── config
│   │       │   │   ├── autocmds.lua
│   │       │   │   ├── keymaps.lua
│   │       │   │   ├── lazy.lua
│   │       │   │   └── options.lua
│   │       │   └── plugins
│   │       │       ├── colorscheme.lua
│   │       │       ├── example.lua
│   │       │       └── mason.lua
│   │       └── stylua.toml
│   └── shell.nix
└── justfile
```
# warofzen/nix-config

KISS home-manager config for my personal use to be used in a non-nixos host (Bluefin and Arch Linux currently).
My old, full nixos config, is available in the old branch.

## spec
- enable trusted-users in `/etc/nix/nix.conf` to use cache
- place in "${HOME}/.config/nix-config"

