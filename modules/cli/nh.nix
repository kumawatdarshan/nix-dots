{config, ...}: {
  programs.nh = {
    enable = true;
    clean.extraArgs = "--keep 4";
    clean.dates = "weekly";
    flake = "${config.homeDir}/dotfiles";
  };
}
