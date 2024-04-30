{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.rink
        inputs.anyrun.packages.${pkgs.system}.stdin
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = {  absolute = 800; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss = ''
      * {
        border-radius: 6px;
      }

      #window {
        background-color: rgba(0, 0, 0, 0);
      }
    '';
  };
}
