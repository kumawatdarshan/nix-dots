{config, ...}: {
  programs.home-manager.enable = true;

  imports = [
    ./config
    ./stylix
    ./../lib
  ];

  # REFER: @/modules/dewm/wl-clipboard
  services.cliphist.enable = true;
  services.easyeffects.enable = true;

  qt.enable = true;
  gtk.enable = true;

  # REFER: @/modules/development/tools/kvm
  # REFER: https://nixos.wiki/wiki/Virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  home = {
    stateVersion = "25.05"; # Adapt this to the current Home Manager version
    username = config.username;
    homeDirectory = "/home/${config.username}";
    enableNixpkgsReleaseCheck = true;
  };
}
