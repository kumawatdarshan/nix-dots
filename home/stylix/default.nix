{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    targets.foot.enable = lib.mkForce false;
    targets.waybar.enable = lib.mkForce false;
    targets.helix.enable = lib.mkForce false;
    targets.hyprlock.enable = lib.mkForce false;

    # cursor.package = pkgs.simp1e-cursors;
    # cursor.name = "Simp1e-Adw-Dark";

    targets.qt.platform = "qtct";
  };
}
