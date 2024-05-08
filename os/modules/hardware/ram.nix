{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        zram-size = "ram / 4";
      };
    };
  };
  # services.earlyoom.enable = true;
  # systemd.oomd = {
  #   enable = true;
  #
  # };
}
