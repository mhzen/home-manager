{
  boot = {
    plymouth.enable = true;
    consoleLogLevel = 0;
    kernelParams = [ "splash" "quiet" "udev.log_level=0" ];
    supportedFilesystems = [ "ntfs" ];
  };
}
