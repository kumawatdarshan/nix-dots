{
  inputs,
  config,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.default
  ];

  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v3;
    # kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModulePackages = with config.boot.kernelPackages; [lenovo-legion-module];
    kernelModules = [
      "ntsync"
      "thinkpad_acpi"
      "v4l2loopback"
      "uvcvideo"
    ];
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
      options v4l2loopback devices=1 video_nr=10 exclusive_caps=1 card_label="WebCam"
    '';
  };
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
}
