{
  description = "arturacruz NixOS flake config";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs?rev=d2faa1bbca1b1e4962ce7373c5b0879e5b12cef2";
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   # nixvim = {
	 #   url = "github:nix-community/nixvim";
	 #   inputs.nixpkgs.follows = "nixpkgs";
   # };
    #hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = { self, nixpkgs, ...} @ inputs:
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
      specialArgs = { inherit inputs nixosModules homeManagerModules system; };
      modules = [
        ./hosts/nitro/configuration.nix
      ];
    };
  };
}
