{pkgs, ...}: {
  imports = [
    ./file-manager.nix
  ];

  environment.systemPackages = with pkgs; [
    logseq
    onlyoffice-bin
    zathura
    kdePackages.okular
  ];
}
