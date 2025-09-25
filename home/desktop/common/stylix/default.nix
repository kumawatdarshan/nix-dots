{lib, ...}: {
  # stylix.targets = {
  #   waybar = false;
  #   foot = false;
  # };
  stylix.targets.foot.enable = lib.mkForce false;
  stylix.targets.waybar.enable = lib.mkForce false;
  stylix.targets.helix.enable = lib.mkForce false;
  stylix.targets.hyprlock.enable = lib.mkForce false;

  stylix.targets.qt.platform = "qtct";
  # stylix.targets.hyprlock.enable = lib.mkForce false;
}
