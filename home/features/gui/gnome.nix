{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "kitty.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "paperwm@paperwm.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
    };
    "org/gnome/mutter" = {
      experimental-features = ["scale-monitor-framebuffer"];
    };
    "org/gnome/shell/extensions/paperwm" = {
      show-window-position-bar = false;
      show-workspace-indicator = false;
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      screensaver = ["<Alt><Super>l"];
    };
    "org/gnome/shell/extensions/paperwm/keybindings" = {
      switch-next-loop = ["<Super>l"];
      switch-previous-loop = ["<Super>j"];
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.paperwm
    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
  ];
}
