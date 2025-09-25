{
  description = "Yo yo yo. 148-3 to the 3 to the 6 to the 9, representing Darshan's dotfiles, what up biatch?!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tofi.url = "github:darshanCommits/tofi";
    stylix.url = "github:danth/stylix/release-25.05";

    fenix = {
      url = "github:nix-community/fenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-analyzer-src.follows = ""; # comment if i want to use nightly
      };
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix-driver = {
      url = "github:darshanCommits/helix/driver";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    forAllSystems = nixpkgs.lib.genAttrs [system];

    mkNixOsConfig = host: {
      inherit system;
      specialArgs = {
        inherit inputs self system;
      };
      modules = [
        stylix.nixosModules.stylix

        ./lib
        ./hosts/${host}
        {
          nixpkgs.overlays = [
            (import ./overlays inputs.nixpkgs-unstable)
          ];
        }
      ];
    };
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    nixosConfigurations = {
      greeed = nixpkgs.lib.nixosSystem (mkNixOsConfig "greeed");
    };
  };
}
