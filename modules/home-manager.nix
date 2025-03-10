{ inputs, homeManagerModules, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs homeManagerModules; };
    users = {
      artur = import ../home.nix;
    };
  };
}
