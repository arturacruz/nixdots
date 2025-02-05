{ pkgs, config, lib, inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {

        lineNumberMode = "number";
        options = {
          autoindent = true;
          shiftwidth = 4;
          tabstop = 4;
        };

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        statusline.lualine.enable = true;
        treesitter = {
          enable = true;
          highlight.enable = true;
          indent.enable = false;
          indent.disable = [ "python" "nix" "java" ];
        };

        lsp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          java = {
            enable = true;
            lsp.enable = true;
          };

          python = {
            enable = true;
            lsp.enable = true;
          };
          nix = {
            enable = true;
            lsp.enable = true;
          };

        };

        autopairs.nvim-autopairs = {
          enable = true;
        };
      };
    };
  };
}
