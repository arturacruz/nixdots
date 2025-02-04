{
  description = "arturacruz NixOS flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
	url = "github:nix-community/nixvim";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, hyprland, ...} @ inputs:
  let
    system = "x86_64-linux";

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      inherit system;

      config = {
	allowUnfree = true;
      };
    };
  in
  {

    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = { inherit inputs nixosModules homeManagerModules; };
      modules = [
        ./hosts/nitro/configuration.nix
      ];
    };
  };
}
