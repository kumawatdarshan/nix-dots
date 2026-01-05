{...}: {
  imports = [
    ./../common/brightness.nix
    ./../common/portal
  ];

  # systemd.user.services.dms = {
  #   wantedBy = ["niri.service"];
  # };

  programs.niri = {
    enable = true;
  };
}
