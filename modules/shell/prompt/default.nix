{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.starship
  ];
  programs.starship = {
    enable = true;
  };
}
