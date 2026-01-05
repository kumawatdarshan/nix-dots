{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableClipboard = true; # Clipboard history manager
    enableVPN = true; # VPN management widget
    enableDynamicTheming = false; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)

    plugins = {
      dankCalculator.src = "${inputs.dankCalculator}";
      dms-emoji-launcher.src = "${inputs.dms-emoji-launcher}";
    };
  };

  home.packages = with pkgs.kdePackages; [
    kirigami.unwrapped
    sonnet
  ];
}
