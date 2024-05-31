{
  programs.qutebrowser = {
    enable = true;
    settings = {
      content.blocking = {
        enabled = true;
        adblock.lists = [
          "https://easylist.to/easylist/easylist.txt"
          "https://easylist.to/easylist/easyprivacy.txt"
        ];
      };
    };
  };

  home.sessionVariables.QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
}
