{
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ha";
      action = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<C-e>";
      action = "function() require'harpoon':ui():toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<leader>hj";
      action = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>hk";
      action = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<leader>hl";
      action = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<leader>hm";
      action = "function() require'harpoon':list():select(4) end";
    }
  ];
}
