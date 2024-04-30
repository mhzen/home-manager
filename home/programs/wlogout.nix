{
  pkgs,
  ...
}:{
  programs.wlogout = {
    enable = true;
    layout = [
      {
          "label" = "lock";
          "action" = "hyprlock";
          "text" = "Lock";
          "keybind" = "l";
      }
      {
          "label" = "hibernate";
          "action" = "systemctl hibernate";
          "text" = "Hibernate";
          "keybind" = "h";
      }
      {
          "label" = "logout";
          "action" = "sleep 1; hyprctl dispatch exit";
          "text" = "Logout";
          "keybind" = "e";
      }
      {
          "label" = "shutdown";
          "action" = "systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "s";
      }
      {
          "label" = "suspend";
          "action" = "systemctl suspend";
          "text" = "Suspend";
          "keybind" = "u";
      }
      {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
      }
    ];
    style = ''
      * {
	      background-image: none;
	      box-shadow: none;
      }

      window {
        background-color: rgba(1, 1, 1, 0.6);
      }

      button {
        border-radius: 4;
      	text-decoration-color: #fbf1c7;
        color: #fbf1c7;
      	background-color: #1d2021;
	      background-repeat: no-repeat;
	      background-position: center;
	      background-size: 25%;
      }

      button:focus, button:active, button:hover {
      	background-color: #504945;
      }

      #lock {
        margin: 6px;
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }

      #logout {
        margin: 6px;
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }

      #suspend {
        margin: 6px;
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
        margin: 6px;
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
        margin: 6px;
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
        margin: 6px;
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }
    '';
  };
}
