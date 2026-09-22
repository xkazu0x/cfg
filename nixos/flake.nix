{
  description = "Misery Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    areofyl-fetch.url = "github:areofyl/fetch";
    areofyl-fetch.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }@inputs:
  let
    mkSystem = { system, host, user }:
    inputs.nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${host}/default.nix
        ./modules/users/${user}/default.nix
        inputs.chaotic.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        {
          networking.hostName = host;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            overwriteBackup = true;
            backupFileExtension = "hm.bak";
            extraSpecialArgs = { inherit inputs; };
            users.${user} = import ./users/${user}/home.nix;
          };
        }
      ];
    };
  in
  {
    nixosConfigurations.misery = mkSystem {
      system = "x86_64-linux";
      host = "misery";
      user = "loser";
    };
  };
}
