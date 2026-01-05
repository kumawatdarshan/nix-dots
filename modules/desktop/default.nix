{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./compositors/niri
    ./compositors/kde

    ./compositors/common/stylix

    ./apps/browsers
    ./apps/documents
    ./apps/media
    ./apps/messaging
    ./apps/flatpak

    ./apps/misc/kdeconnect
    ./apps/misc/tofi

    ./fonts

    ./services/keyd
    # ./services/goldwarden
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
    cliphist
    hyprpicker
  ];
}
