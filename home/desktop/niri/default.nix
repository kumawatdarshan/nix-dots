{...}: let
  services = [
    ./../common/waybar
    ./../common/swaybg
    ./../common/swaync
    # ./../common/xwayland-satellite
    ./../common/poweralertd
  ];
in {
  imports = services;

  services.swayosd = {
    enable = true;
  };
}
