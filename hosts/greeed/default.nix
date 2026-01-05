{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../common/base

    ./home.nix
    ./kernel.nix
    ./hardware-configuration.nix

    ./../common/intel
    ./../common/nvidia
    ./../../modules
  ];
  # should help with RA OOM crashes
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
  };
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 100;
  };
  boot.kernel.sysctl = {
    "vm.swappiness" = 150;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };

  environment.systemPackages = [
    pkgs.lact
  ];

  systemd.services.lact = {
    description = "LACT";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

  services = {
    openssh.enable = true;
    power-profiles-daemon.enable = false;
    upower.enable = true;

    thermald.enable = true;
    # undervolt = {
    #   enable = true;
    #   coreOffset = -125;
    #   turbo = 0;
    # };
  };
  # i mostly use tldr
  documentation = {
    enable = true;
    doc.enable = false;
    dev.enable = true;
    man.enable = true;
    info.enable = false;
    nixos.enable = false;
  };

  users = {
    users.${config.username} = {
      isNormalUser = true;
      description = "Darshan Kumawat";
      extraGroups = [
        "dialout"
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "input"
        "gamemode"
        "wireshark"
      ];
    };
  };
}
