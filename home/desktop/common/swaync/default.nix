{
  pkgs,
  config,
  lib,
  ...
}: let
  swaync = pkgs.unstable.swaynotificationcenter;
in {
  xdg.configFile."swaync/config.json".source = config.lib.file.mkOutOfStoreSymlink ./config.json;
  xdg.configFile."swaync/style.css".source = config.lib.file.mkOutOfStoreSymlink ./style.css;

  home.packages = [
    swaync
    pkgs.libnotify
  ];

  systemd.user.services.swaync = {
    Unit = {
      Description = "Swaync notification daemon";
      Documentation = "https://github.com/ErikReider/SwayNotificationCenter";
      PartOf = [config.wayland.systemd.target];
      After = [config.wayland.systemd.target];
      Requisite = ["graphical-session.target"];
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };

    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.Notifications";
      ExecStart = lib.getExe swaync;
      Restart = "on-failure";
    };

    Install.WantedBy = [config.wayland.systemd.target];
  };
}
