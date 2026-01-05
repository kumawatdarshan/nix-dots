{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common = {
          # default = ["gtk"];
          # "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        };
      };
      extraPortals = with pkgs; [
        # xdg-desktop-portal-gtk
        # xdg-desktop-portal-gnome
      ];
    };
  };
}
