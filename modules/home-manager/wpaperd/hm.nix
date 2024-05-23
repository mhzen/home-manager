{
  config,
  lib,
  ...
}: {
  options.stylix.targets.wpaperd = {
    enable = config.lib.stylix.mkEnableTarget "wpaperd" config.programs.wpaperd.enable;
  };

  config =
    lib.mkIf config.stylix.targets.wpaperd.enable {
    };
}
