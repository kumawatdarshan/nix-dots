{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qimgv
    # stremio # this is using old qt5 web engine, causing build to fail
    easyeffects
    ani-cli
    ffsubsync
    blanket
    gapless
  ];
}
