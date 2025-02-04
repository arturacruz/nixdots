{ pkgs, config, inputs, ...}:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    colorschemes.gruvbox.enable = true;

    opts = {
      number = true;
      shiftwidth = 4;
    };
  };
}
