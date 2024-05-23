{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  home.packages = with pkgs; [
    haruna
  ];

  programs.plasma = {
    enable = true;

    panels = [
      {
        location = "bottom";
        height = 32;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General.icon = "nix-snowflake-white";
            };
          }
          # {
          #   name = "org.kde.plasma.icontasks";
          #   config = {
          #     General.launchers = [
          #       "applications:firefox.desktop"
          #       "applications:org.kde.dolphin.desktop"
          #       "applications:org.kde.konsole.desktop"
          #     ];
          #   };
          # }
          # "org.kde.plasma.systemtray"
          # {
          #   digitalClock = {
          #     calendar.firstDayOfWeek = "sunday";
          #     time.format = "24h";
          #   };
          # }
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    shortcuts = {
      ksmserver = {
        "Lock Session" = ["Screensaver" "Meta+Alt+M"];
      };
      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };

    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
    };
  };
}
