{
  time.timeZone = "Asia/Jakarta";
  services.ntp.enable = true;
  services.timesyncd.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };
}
