{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./gamescope.nix
    ./gamemode.nix
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs.steam;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protontricks
    winetricks
    wineWowPackages.stable
    umu-launcher
    renpy

    # Launchers
    unstable.heroic
    # itch
    # lutris
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "python3.12-ecdsa-0.19.1" # renpy
  ];

  environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.homeDir}/.steam/root/compatibilitytools.d";
}
