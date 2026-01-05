{
  pkgs,
  inputs,
  ...
}: {
  # nixpkgs.overlays = [
  #   inputs.floorp.overlays.default
  # ];

  environment.systemPackages = with pkgs; [
    # floorp-bin
    vivaldi
    vivaldi-ffmpeg-codecs
    brave
  ];
}
