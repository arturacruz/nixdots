{

  programs.nvf.settings.vim.keymaps = [
    {
      key = "<C-b>";
      mode = "i";
      action = "<ESC>^i";
      desc = "move start of line";
    }   
    {
      key = "<C-e>";
      mode = "i";
      action = "<End>";
      desc = "move end of line";
    }   
    {
      key = "<C-h>";
      mode = "i";
      action = "<Left>";
    }   
    {
      key = "<C-l>";
      mode = "i";
      action = "<Right>";
    }   
    {
      key = "<C-j>";
      mode = "i";
      action = "<Down>";
    }   
    {
      key = "<C-k>";
      mode = "i";
      action = "<Up>";
    }  

    {
      key = "<C-h>";
      mode = "n";
      action = "<C-w>h";
    }   
    {
      key = "<C-l>";
      mode = "n";
      action = "<C-w>l";
    }   
    {
      key = "<C-j>";
      mode = "n";
      action = "<C-w>j";
    }   
    {
      key = "<C-k>";
      mode = "n";
      action = "<C-w>k";
    }  
    {
      key = "<C-s>";
      mode = "n";
      action = "<cmd>w<CR>";
      desc = "save file";
    }  
    {
      key = "<C-n>";
      mode = "n";
      action = "<cmd>NvimTreeToggle<CR>";
      desc = "open file viewer";
    }  
    {
      key = "<leader>tt";
      mode = "n";
      action = "<cmd>Telescope find_files<CR>";
    }  
    {
      key = "<leader>tg";
      mode = "n";
      action = "<cmd>Telescope live_grep<CR>";
    }  
    {
      key = "<leader>tb";
      mode = "n";
      action = "<cmd>Telescope buffers<CR>";
    }  
  ];
}
