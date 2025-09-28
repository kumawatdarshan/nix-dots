{...}: {
  imports = [
    ./../common/waybar
    ./../common/swaybg
    ./../common/swaync
    ./../common/poweralertd
  ];

  services.swayosd = {
    enable = true;
  };
}
