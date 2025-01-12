{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  }; 

  home.packages = with pkgs; [
    clang
    nodejs-slim

    # lsp
    luajitPackages.lua-lsp

    # formatter
    shfmt
    stylua
  ];

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };
}
