{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        zram-size = "ram / 2";
      };
    };
  };
  services.earlyoom.enable = true;
}
