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
        "trayIconsReloaded@selfmade.pl"
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
  };

  home.packages = with pkgs; [
    gnomeExtensions.paperwm
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
  ];
}
