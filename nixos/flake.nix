{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

    neovim-nightly-overlay = {
      url = github:nix-community/neovim-nightly-overlay;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs ={ self, nixpkgs, neovim-nightly-overlay, home-manager, ... }: let
    system = "x86_64-linux";
    defaults = [
      ./configuration.nix ./config/packages.nix
      { nix.registry.nixpkgs.flake = nixpkgs; }
      home-manager.nixosModules.home-manager  {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.qlixior = import ./config/home.nix;
        nixpkgs.overlays = [
          neovim-nightly-overlay.overlay
        ];
      }
    ];
  in {
    nixosConfigurations = {
      # Laptop
      cludadwy = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/cludadwy/default.nix ] ++ defaults;
      };

      # Desktop
      sylfaenol = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/sylfaenol/default.nix ] ++ defaults;
      };
    };
  };
}
