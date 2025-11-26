{
  description = "Yo yo yo. 148-3 to the 3 to the 6 to the 9, representing Darshan's dotfiles, what up biatch?!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
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
    treefmt-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

    treefmtEval = treefmt-nix.lib.evalModule pkgs {
      projectRootFile = "flake.nix";
      programs.taplo = {
        enable = true;
        settings = {
          formatting = {
            array_auto_expand = false; # Don't expand arrays to multiple lines
            array_auto_collapse = true; # Collapse arrays to single line when possible
            inline_table_expand = false; # Don't expand inline tables
            compact_arrays = true; # Keep arrays compact
            compact_inline_tables = true; # Keep inline tables compact
          };
        };
      };
      programs = {
        alejandra.enable = true;
        jsonfmt.enable = true;
        just.enable = true;
        stylua.enable = true;
        yamlfmt.enable = true;
        prettier.enable = true;
      };
    };

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
    formatter.${system} = treefmtEval.config.build.wrapper;
    nixosConfigurations = {
      greeed = nixpkgs.lib.nixosSystem (mkNixOsConfig "greeed");
    };
  };
}
