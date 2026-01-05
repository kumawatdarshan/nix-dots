{pkgs, ...}: {
  imports = [
    ./file-manager.nix
  ];

  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
    zathura
    kdePackages.okular
  ];
}
