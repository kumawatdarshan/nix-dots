{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    foot
  ];
  xdg.configFile."foot/foot.ini".source = config.lib.file.mkOutOfStoreSymlink ./foot.ini;

  systemd.user.services = {
    foot = {
      Unit = {
        Description = "Fast, lightweight and minimalistic Wayland terminal emulator.";
        Documentation = "man:foot(1)";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      Service = {
        ExecStart = "${pkgs.foot}/bin/foot --server";
        Restart = "on-failure";
        OOMPolicy = "continue";
      };

      Install = {
        WantedBy = [config.wayland.systemd.target];
      };
    };
  };
}
