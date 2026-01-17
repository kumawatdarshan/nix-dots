{...}: {
  imports = [
    ./../common/brightness.nix
    ./../common/portal
  ];

  programs.niri = {
    enable = true;
  };
}
