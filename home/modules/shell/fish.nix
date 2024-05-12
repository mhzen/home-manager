{...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_add_path ~/.local/bin

      set fish_greeting
      set -x LUTRIS_SKIP_INIT 1

      # starship init fish | source
    '';
    shellAbbrs = {
      rt = "trash put";
      # ls = "lsd";
    };
    functions = {
      mkcd = "mkdir -pv $argv; cd $argv;";
    };
  };
}
