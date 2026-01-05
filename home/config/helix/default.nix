{
  inputs,
  pkgs,
  config,
  ...
}: {
  xdg.configFile = {
    "helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink ./config.toml;
    "helix/languages.toml".source = config.lib.file.mkOutOfStoreSymlink ./languages.toml;
    "helix/themes/mist.toml".source = config.lib.file.mkOutOfStoreSymlink ./themes/mist.toml;
  };
  home.packages = [
    inputs.helix-driver.packages.${pkgs.stdenv.hostPlatform.system}.helix
  ];
}
