{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-colors = {
      url = "github:itepastra/nix-colors";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    automapaper = {
      url = "github:itepastra/automapaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:YaLTeR/niri";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    noa-flake = {
      url = "github:itepastra/nixconf";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-colors,
      automapaper,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        zelden = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs nix-colors automapaper;
          };
          modules = [
            ./configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
