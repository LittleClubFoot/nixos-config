{
  description = "Kamrui NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.kamrui-e1 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/kamrui-e1.nix
          ./modules/services/base.nix
          ./modules/services/home-server.nix
          ./modules/services/hyperland.nix
          ./modules/services/nas.nix
          ./modules/packages/all-packages.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          __root = self;
        };
      };
    };
}
