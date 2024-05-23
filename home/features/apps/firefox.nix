{
  inputs,
  pkgs,
  ...
}: let
  betterfox = pkgs.fetchFromGitHub {
    owner = "yokoffing";
    repo = "Betterfox";
    rev = "122.1";
    hash = "sha256-eHocB5vC6Zjz7vsvGOTGazuaUybqigODEIJV9K/h134=";
  };
in {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {pipewireSupport = true;}) {};
    policies = {
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisablePocket = true;
    };
    profiles.default = {
      id = 0;
      isDefault = true;
      extraConfig = builtins.concatStringsSep "\n" [
        (builtins.readFile "${betterfox}/user.js")
      ];
      settings = {
        "privacy.userContext.enabled" = "true";

        # scrolling stuff
        "apz.overscroll.enabled" = true;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "mousewheel.default.delta_multiplier_y" = 275;

        # login managers
        "signon.rememberSignons" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        # https only mode
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_error_page_user_suggestions" = true;

        # dns
        "network.trr.uri" = "https://dns.nextdns.io/ed12d9";
        "network.trr.mode" = 2;
        "network.trr.max-fails" = 5;
      };
      search = {
        force = true;
        default = "DuckDuckGo";
        order = ["DuckDuckGo" "Youtube" "Google" "MyNixOS"];
        engines = {
          "Bing".metaData.hidden = true;
          "Amazon".metaData.hidden = true;

          "MyNixOS" = {
            iconUpdateURL = "https://mynixos.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@nx"];
            urls = [
              {
                template = "https://mynixos.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
        };
      };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        proton-pass
        ublock-origin
        sponsorblock
        sidebery
      ];
    };
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
    "x-scheme-handler/chrome" = ["firefox.desktop"];
    "text/html" = ["firefox.desktop"];
    "application/x-extension-htm" = ["firefox.desktop"];
    "application/x-extension-html" = ["firefox.desktop"];
    "application/x-extension-shtml" = ["firefox.desktop"];
    "application/xhtml+xml" = ["firefox.desktop"];
    "application/x-extension-xhtml" = ["firefox.desktop"];
    "application/x-extension-xht" = ["firefox.desktop"];
  };
}
