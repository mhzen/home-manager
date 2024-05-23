{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_25;
  };
  users.users.mham.extraGroups = ["docker"];
}
