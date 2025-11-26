{
  inputs,
  pkgs,
  config,
  ...
}: {
  xdg.configFile."helix/config.toml".source = config.lib.file.mkOutOfStoreSymlink ./config.toml;
  xdg.configFile."helix/languages.toml".source = config.lib.file.mkOutOfStoreSymlink ./languages.toml;
  xdg.configFile."helix/themes/mist.toml".source = config.lib.file.mkOutOfStoreSymlink ./themes/mist.toml;

  home.packages = [
    inputs.helix-driver.packages.${pkgs.system}.helix
  ];
}
