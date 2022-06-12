{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, ... }:
    let
      system = "x86_64-linux";
      defaults = [
        ./default.nix
        #./config/packages.nix
        { nix.registry.nixpkgs.flake = inputs.nixpkgs; }
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.qlixior = import ./config/home.nix;
          };
          nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];
        }
      ];
    in {
      nixosConfigurations = {
        # Laptop
        cludadwy = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/cludadwy/default.nix ] ++ defaults;
        };

        # Desktop
        sylfaenol = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/sylfaenol/default.nix ] ++ defaults;
        };
      };
    };
}
