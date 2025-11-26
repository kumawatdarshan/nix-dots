# YOU MUST FIRST DEFINE THE CONFIG OPTIONS IN THE ./types.nix
{...}: let
  username = "greeed";
in {
  config = {
    inherit username;

    wallpaper = ./../../assets/images/goatv3.jpg;
    colorscheme = ./../../assets/colorscheme.yaml;

    loopbackAddress = "127.0.0.1";
    ip = "192.168.0.120";

    homeDir = "/home/${username}";
    currentCompositor = "niri";
    localDomain = "local";
    localhost = "0.0.0.0";

    ghUserName = "kumawatdarshan";
    email = "kumawatdarshan.1304@gmail.com";
  };
}
