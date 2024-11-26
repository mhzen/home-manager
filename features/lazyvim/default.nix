{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  }; 

  home.packages = with pkgs; [
  ];

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };
}
