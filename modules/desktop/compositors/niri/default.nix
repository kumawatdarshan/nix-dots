{...}: {
  imports = [
    ./../common/brightness.nix
    ./../common/portal
    # ./../common/hyprlock
  ];

  programs.niri = {
    enable = true;
  };
}
