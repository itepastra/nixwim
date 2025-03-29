{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noa-flake = {
      url = "github:itepastra/nixconf";
      inputs.nixpkgs.follows = "nixpkgs";
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
