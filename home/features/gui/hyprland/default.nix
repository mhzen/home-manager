{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ../wayland/waybar.nix
    ../wayland/anyrun.nix
    ../wayland/rofi.nix
    ../wayland/wlogout.nix
    ../wayland/wpaperd.nix
  ];

  home.packages = with pkgs; [
    # hyprpaper
    hyprlock
    hypridle
    hyprcursor
    # cliphist
    copyq
    wl-clipboard
    grimblast
    swaynotificationcenter
    swayosd
    wlsunset
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    plugins = [
      # inputs.hy3.packages.${pkgs.system}.hy3
      # inputs.hy3.packages."x86_64-linux".hy3
      # hy3.packages.${pkgs.system}.hy3
    ];
    settings = {
      exec-once = [
        "${lib.getExe pkgs.waybar}"
        "wpaperd"
        "hypridle"
        "${pkgs.dbus}/bin/dbus-update-activation-environment PATH"
        "copyq"
        "${pkgs.swaynotificationcenter}/bin/swaync"
        "${pkgs.swayosd}/bin/swayosd-server"
      ];

      monitor = [
        "eDP-1,preferred,auto,1.25"
        ",preferred,auto,auto,mirror"
      ];

      "$filemanager" = "nemo";
      # "$menu" = "rofi -show drun";
      "$menu" = "anyrun";
      "$terminal" = "kitty";
      # "$clipboard" = "cliphist list | rofi -dmenu -p 'clipboard' | cliphist decode | wl-copy";
      "$clipboard" = "copyq toggle";
      # "$powermenu" = "rofi -show power-menu -modi power-menu:rofi-power-menu";
      "$powermenu" = "wlogout";
      "$screenshot" = "grimblast --cursor copysave";

      input = {
        follow_mouse = "0";
        touchpad.natural_scroll = "yes";
      };

      general = {
        gaps_in = "4";
        gaps_out = "8";
        layout = "master";
      };

      decoration = {
        blur.enabled = "false";
        drop_shadow = "false";
        shadow_range = "4";
        shadow_render_power = "3";
        rounding = "4";
      };

      group.groupbar = {
        render_titles = "false";
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          # "windows, 1, 7, myBezier"
          # "windowsOut, 1, 7, default, popin 80%"
          # "border, 1, 10, default"
          # "borderangle, 1, 8, default"
          # "fade, 1, 7, default"
          # "workspaces, 1, 6, default"
          "windows, 1, 4, default, popin 35%"
          "border, 1, 4, default"
          "borderangle, 1, 4, default"
          "fade, 1, 4, default"
          "workspaces, 1, 4, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        vfr = true;
        force_default_wallpaper = "0";
      };

      windowrule = [
        # Essentials
        "float, ^(pavucontrol)$"
        # "float, ^(nemo)$"
        # "size 1000 650, ^(nemo)$"
        # "center, ^(nemo)$"
        "float, ^(imv)$"
        "float, ^(mpv)$"
        "float, ^(zathura)$"

        # Popups
        "float, class:^(GtkFileChooserDialog)$"
        "float, class:^(pop-up)$"
        "float, class:^(Organizer)$"
        "float, class:^(task_dialog)$"

        # Browser indicators
        "float, class:^(firefox)$, title:^(Picture-in-Picture)"
        "pin, class:^(firefox)$, title:^(Picture-in-Picture)"

        # idle inhibit while watching videos
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      "$mainMod" = "SUPER";
      bind =
        [
          "$mainMod, RETURN, exec, $terminal"
          "$mainMod, E, exec, $fileManager"
          "$mainMod SHIFT, RETURN, exec,[float] $terminal"
          "$mainMod, Space, exec, $menu"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, C, exec, $clipboard"
          "$mainMod ALT, M, exec, $powermenu"
          "$mainMod, V, togglefloating,"
          "$mainMod, N, togglesplit, # dwindle"
          "$mainMod, F, fullscreen, 1"
          "$mainMod SHIFT, F, fullscreen, 0,"
          "$mainMod, J, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, I, movefocus, u"
          "$mainMod, K, movefocus, d"
          "$mainMod SHIFT, L, resizeactive, -100 0"
          "$mainMod SHIFT, J, resizeactive, 100 01"
          "$mainMod SHIFT, I, resizeactive, 0 -100"
          "$mainMod SHIFT, K, resizeactive, 0 100"
          "$mainMod, T, togglegroup"
          # "$mainMod, S, togglespecialworkspace, magic"
          # "$mainMod SHIFT, S, movetoworkspace, special:magic"

          "$mainMod, Print, exec, grimblast --cursor copysave output"
          "$mainMod SHIFT, Print, exec, grimblast --cursor copysave area"
          "$mainMod ALT, Print, exec, grimblast --cursor copysave screen"

          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
                "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      bindel = [
        ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
        ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
        ",XF86AudioPlay, exec, playerctl play-pause"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  xdg.configFile = {
    "hypr/hyprlock.conf".source = ./hyprlock.conf;
    "hypr/hypridle.conf".source = ./hypridle.conf;
    "hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  };
}
