{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      defaults = [
        ./configuration.nix ./config/packages.nix
        { nix.registry.nixpkgs.flake = nixpkgs; }
        home-manager.nixosModules.home-manager  {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.qlixior = import ./config/home.nix;
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
