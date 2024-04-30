{
  pkgs,
  lib,
  ...
}:{
  home.packages = with pkgs; [
    font-awesome
    networkmanager_dmenu
    iwgtk
  ];
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        layer = "bottom";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "custom/notification" "wireplumber" "network" "backlight" "battery" "tray" ];

        "hyprland/workspaces" = {
          on-click = "activate";
          disable-scroll = "false";
          all-outputs = "true";
          warp-on-scroll = "true";
        };

        clock = {
          format = "{:%H:%M}";
          "format-alt" = "{:%A, %B %d - %H:%M}";
          "tooltip-format" = "<big>{calendar}</big>";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "󱅫";
            none = "";
            dnd-notification = " ";
            dnd-none = "󰂛";
            inhibited-notification = " ";
            inhibited-none = "";
            dnd-inhibited-notification = " ";
            dnd-inhibited-none = " ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "sleep 0.1 && swaync-client -d -sw";
          escape = true;
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          on-click-right = "swayosd-client --output-volume mute-toggle";
          on-scroll-up = "swayosd-client --output-volume raise";
          on-scroll-down = "swayosd-client --output-volume lower";
          max-volume = 100;
          scroll-step = 5;
        };
        network = {
          format = "󰤯 {essid}";
          tooltip-format = "󰤯 {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
          format-disconnected = "󰤫 ";
          on-click = "${lib.getExe pkgs.iwgtk}";
        };
        backlight = {
          format = " {percent}%";
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
          tooltip-format = "Power profile: {profile}";
        };
        battery = {
          "states" = {
              "good" = 98;
              "warning" = 30;
              "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };
      };
    };
    style = ''
      * {
        font-family: Symbols Nerd Font Mono, Inter;
        font-weight: bold;
        font-size: 14px;
      }

      #clock,
      #custom-notification,
      #custom-nixlogo,
      #battery,
      #backlight,
      #network,
      #power-profiles-daemon,
      #wireplumber,
      #tray {
        margin: 4px;
        padding: 2px 8px 2px;
        border-radius: 3px;
        background-color: @base01;
      }

      #workspaces {
        margin: 4px;
      }

      #workspaces button {
        font-weight: bold;
        padding: 0 5px;
        margin: 0 2px;
        border-radius: 3px;
        background-color: @base01;
      }

      #workspaces button:hover {
        border-bottom: 3px solid @base03;
      }
    '';
  };

  xdg.configFile = {
    "networkmanager-dmenu/config.ini".text = ''
      [dmenu]
      dmenu_command = rofi -i -dmenu
    '';
  };
}
