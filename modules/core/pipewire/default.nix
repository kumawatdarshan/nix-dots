{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;

    # Force consistent buffer size
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 1024;
      };
    };
  };

  # Disable power saving for Intel HDA
  boot.kernelParams = [
    "snd_hda_intel.power_save=0"
  ];
}
