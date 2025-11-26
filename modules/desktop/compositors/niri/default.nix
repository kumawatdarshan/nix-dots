{pkgs, ...}: {
  imports = [
    ./../common/brightness.nix
    ./../common/portal
  ];

  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];

  security.pam.services.hyprlock = {};

  programs.niri = {
    enable = true;
  };
}
