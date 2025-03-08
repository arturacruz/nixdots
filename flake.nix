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
  };
  outputs = { self, nixpkgs, hyprland, home-manager, ...} @ inputs:
  let
    system = "x86_64-linux";

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    lib = nixpkgs.lib;
    in
  {

    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = { inherit inputs nixosModules homeManagerModules system; };
      modules = [
        ./hosts/nitro/configuration.nix
      ];
    };

    homeConfigurations.artur = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {inherit system; };
      extraSpecialArgs = {inherit inputs; };
      modules = [ ./home.nix ];
    };
  };
}
