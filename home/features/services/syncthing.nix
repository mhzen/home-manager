{
  services.syncthing = {
    enable = true;
    tray.enable = true;
    extraOptions = [
      "--wait"
    ];
  };
}
