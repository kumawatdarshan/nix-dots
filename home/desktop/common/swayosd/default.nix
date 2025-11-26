{
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.configFile."swayosd/style.css".source = config.lib.file.mkOutOfStoreSymlink ./style.css;

  home.packages = [
    pkgs.swayosd
  ];

  systemd.user = {
    services.swayosd = {
      Unit = {
        Description = "Volume/backlight OSD indicator";
        PartOf = [config.wayland.systemd.target];
        After = [config.wayland.systemd.target];
        ConditionEnvironment = "WAYLAND_DISPLAY";
        Documentation = "man:swayosd(1)";
        StartLimitBurst = 5;
        StartLimitIntervalSec = 10;
      };

      Service = {
        Type = "simple";
        ExecStart = lib.getExe' pkgs.swayosd "swayosd-server";
        Restart = "always";
        RestartSec = "2s";
      };

      Install = {
        WantedBy = [config.wayland.systemd.target];
      };
    };
  };
}
