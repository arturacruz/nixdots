{
  description = "arturacruz NixOS flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
        url = "github:aylur/ags";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };
  outputs = { self, nixpkgs, hyprland, home-manager, ...} @ inputs:
  let
    system = "x86_64-linux";

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    lib = nixpkgs.lib;
    specialArgs = { inherit inputs nixosModules homeManagerModules system; };
    in
  {

    nixosConfigurations = {
      nitro = lib.nixosSystem {
        inherit specialArgs; 
        modules = [
          ./hosts/nitro/configuration.nix
          ./modules/home-manager.nix
        ];
      };
      aurora = lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/aurora/configuration.nix
          ./modules/home-manager.nix
        ];
      };
    };
  };
}
