{ pkgs, lib, ... }: {

  xdg.configFile = {
    # https://ghostty.org/docs/config/reference
    "ghostty/config".text = ''
      font-family = JetBrainsMono Nerd Font Mono
      command = ${lib.getExe pkgs.fish}
      theme = GruvboxDarkHard
    '';

    # https://github.com/Morganamilo/paru/blob/master/paru.conf
    "paru/paru.conf".text = ''
      PgpFetch
      Devel
      Provides
      DevelSuffixes = -git -cvs -svn -bzr -darcs -always -hg -fossil
      BottomUp
      SudoLoop
      CleanAfter
    '';
  };
}
