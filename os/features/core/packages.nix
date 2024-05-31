{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      killall
      procps
      wget
      git
      vim
      zip
      unzip
      unrar
    ];
  };
}
