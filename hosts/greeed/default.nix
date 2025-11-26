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

  environment.systemPackages = [
    pkgs.unstable.lact
  ];

  systemd.services.lact = {
    description = "LACT";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.unstable.lact}/bin/lact daemon";
    };
    enable = true;
  };

  services.openssh.enable = true;
  services.power-profiles-daemon.enable = false;
  services.upower.enable = true;

  services.thermald.enable = true;
  services.undervolt = {
    enable = true;
    coreOffset = -125;
    turbo = 0;
  };
  services.tlp = {
    enable = true;
    settings = {
      # disable cpu module
      CPU_SCALING_GOVERNOR_ON_AC = "";
      CPU_SCALING_GOVERNOR_ON_BAT = "";
      CPU_SCALING_MIN_FREQ_ON_AC = "";
      CPU_SCALING_MAX_FREQ_ON_AC = "";
      CPU_SCALING_MIN_FREQ_ON_BAT = "";
      CPU_SCALING_MAX_FREQ_ON_BAT = "";
      CPU_BOOST_ON_AC = "";
      CPU_BOOST_ON_BAT = "";
      CPU_HWP_ON_AC = "";
      CPU_HWP_ON_BAT = "";
      CPU_HWP_DYN_BOOST_ON_AC = "";
      CPU_HWP_DYN_BOOST_ON_BAT = "";
      SCHED_POWERSAVE_ON_AC = "";
      SCHED_POWERSAVE_ON_BAT = "";

      START_CHARGE_THRESH_BAT0 = 10;
      STOP_CHARGE_THRESH_BAT0 = 85;
    };
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
      ];
    };
  };
}
