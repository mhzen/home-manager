{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.mham.extraGroups = ["libvirtd"];
}
