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

    # Launchers
    heroic
    # itch
    # lutris
  ];

  environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.homeDir}/.steam/root/compatibilitytools.d";
}
