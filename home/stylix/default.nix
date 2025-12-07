{
  pkgs,
  lib,
  ...
}: {
  stylix.targets = {
    foot.enable = lib.mkForce false;
    waybar.enable = lib.mkForce false;
    helix.enable = lib.mkForce false;
    hyprlock.enable = lib.mkForce false;

    # cursor.package = pkgs.simp1e-cursors;
    # cursor.name = "Simp1e-Adw-Dark";

    qt.platform = "qtct";
  };
}
