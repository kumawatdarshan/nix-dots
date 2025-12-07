{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${config.homeDir}/.config/sops/age/keys.txt";

    secrets."LastFM.ApiKey" = {};
    secrets."LastFM.Secret" = {};
  };
}
