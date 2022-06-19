{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = i@{ self, ... }: {
    nixosConfigurations.cludadwy = i.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./default.nix
        {nix.registry.nixpkgs.flake = i.nixpkgs;}
        i.home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.qlixior = import ./home.nix;
        }
      ];

    };
  };
}
