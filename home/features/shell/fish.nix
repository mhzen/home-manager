{...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_add_path ~/.local/bin

      set fish_greeting
    '';
    shellAbbrs = {
      rt = "trash put";
      # ls = "lsd";
    };
    functions = {
      mkcd = "mkdir -pv $argv; cd $argv;";
      yy = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        	cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };
}
