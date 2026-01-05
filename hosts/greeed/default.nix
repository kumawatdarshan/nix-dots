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
    enable = false;
    doc.enable = false;
    dev.enable = false;
    man.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  # https://github.com/NixOS/nixpkgs/issues/211345#issuecomment-1397825573
  systemd.tmpfiles.rules =
    map
    (
      e: "w /sys/bus/${e}/power/control - - - - auto"
    ) [
      "pci/devices/0000:00:01.0" # Renoir PCIe Dummy Host Bridge
      "pci/devices/0000:00:02.0" # Renoir PCIe Dummy Host Bridge
      "pci/devices/0000:00:14.0" # FCH SMBus Controller
      "pci/devices/0000:00:14.3" # FCH LPC bridge
      "pci/devices/0000:04:00.0" # FCH SATA Controller [AHCI mode]
      "pci/devices/0000:04:00.1/ata1" # FCH SATA Controller, port 1
      "pci/devices/0000:04:00.1/ata2" # FCH SATA Controller, port 2
      "usb/devices/1-3" # USB camera
    ];

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
