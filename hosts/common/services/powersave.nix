{
  services = {
    # power-profiles-daemon.enable = true;
    tlp = {
      enable = true;
      settings = {
        USB_AUTOSUSPEND = 0;
        CPU_ENERGY_PERF_POLICY_ON_AC = "power";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        PLATFORM_PROFILE_ON_AC = "balanced";
      };
    };
    thermald.enable = true;
  };
  # powerManagement.powertop.enable = true;
}
