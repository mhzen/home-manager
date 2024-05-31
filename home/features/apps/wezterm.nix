{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require "wezterm"

      return {
        check_for_updates = false,
        default_cursor_style = 'SteadyBar',
        enable_scroll_bar = true,
        hide_tab_bar_if_only_one_tab = true,
        scrollback_lines = 10000,
      }
    '';
  };
}
