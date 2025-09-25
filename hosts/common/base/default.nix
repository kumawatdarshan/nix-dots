{inputs, ...}: {
  imports = [
    ./secrets.nix
    inputs.home-manager.nixosModules.home-manager
  ];
}
