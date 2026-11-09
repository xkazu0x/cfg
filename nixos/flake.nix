{
  description = "lastdayonearth";

  inputs = {
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # home-manager.url = "github:nix-community/home-manager";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    fetch.url = "github:areofyl/fetch";
    fetch.inputs.nixpkgs.follows = "nixpkgs";

    helium.url = "github:schembriaiden/helium-browser-nix-flake";
    helium.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }@inputs:
  let
    system_make = { system, host, user }:
    inputs.nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${host}/default.nix
        # inputs.chaotic.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        {
          networking.hostName = host;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            overwriteBackup = true;
            backupFileExtension = "hm.bak";
            extraSpecialArgs = { inherit inputs; };
            users.${user} = import ./modules/users/${user}/home/default.nix;
          };
        }
      ];
    };
  in
  {
    nixosConfigurations.misery = system_make {
      system = "x86_64-linux";
      host = "misery";
      user = "loser";
    };
  };
}
