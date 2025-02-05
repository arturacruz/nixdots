{ pkgs, config, inputs, ...}:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    colorschemes.gruvbox.enable = true;

    plugins = {
      cmp = {
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      cmp-nvim-lsp.enable = true;
      telescope.enable = true;
    };
  
    opts = {
      number = true;
      shiftwidth = 4;
    };
  };
}
