{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./../common/poweralertd
    ./../common/dms
  ];

  systemd.user.services.niri = {
    Unit = {
      Description = "A scrollable-tiling Wayland compositor";
      BindsTo = "graphical-session.target";
      Before = ["graphical-session.target" "xdg-desktop-autostart.target"];
      Wants = ["graphical-session-pre.target" "xdg-desktop-autostart.target" "dms.service"];
      After = ["graphical-session-pre.target"];
    };
    Service = {
      Slice = "session.slice";
      Type = "notify";
      ExecStart = "${pkgs.niri}/bin/niri --session";
    };
  };
}
