{
  config,
  pkgs,
  ...
}: {
  programs.virt-manager.enable = true;

  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
      };
    };
  };

  users.groups.libvirtd.members = [config.username];
  users.users."${config.username}".extraGroups = ["libvirtd"];

  # environment.systemPackages = with pkgs; [
  #   xorg.xf86videoqxl
  #   virtiofsd
  # ];

  # networking.firewall = {
  #   trustedInterfaces = ["virbr0"];
  #   allowedTCPPortRanges = [
  #     # spice
  #     {
  #       from = 5900;
  #       to = 5999;
  #     }
  #   ];
  #   allowedTCPPorts = [
  #     # libvirt
  #     16509
  #   ];
  # };
}
