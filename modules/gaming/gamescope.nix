{pkgs, ...}: {
  programs.gamescope = {
    enable = true;
    package = pkgs.unstable.gamescope;
    args = [
      "--expose-wayland"
      "--adaptive-sync"
      "--rt"
      "-W"
      "1920"
      "-H"
      "1080"
      "-w"
      "1920"
      "-h"
      "1080"
    ];
  };

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    extraRules = [
      {
        "name" = "gamescope";
        "nice" = -20;
      }
    ];
  };
}
