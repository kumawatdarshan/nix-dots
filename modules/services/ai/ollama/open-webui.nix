{
  pkgs,
  config,
  ...
}: {
  services.open-webui = {
    enable = true;
    package = pkgs.unstable.open-webui;
    host = config.localhost;
    port = config.port.llmUi;
    openFirewall = false;
    environment.WEBUI_AUTH = "False";
  };
}
