{
  inputs,
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    extraModulePackages = with config.boot.kernelPackages; [lenovo-legion-module];
    kernelModules = [
      "ntsync"
      "thinkpad_acpi"
      "v4l2loopback"
    ];
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
      options v4l2loopback devices=1 video_nr=0 card_label="WebCam"
    '';
  };
  services.scx = {
    enable = true;
    scheduler = "scx_rusty";
  };
}
