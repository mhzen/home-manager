{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      cachix
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
