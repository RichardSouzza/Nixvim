let
  focusOrOpen = ''
    function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
          vim.api.nvim_set_current_win(win)
          return
        end
      end

      vim.cmd("Neotree focus")
    end
  '';

  toggle =
  # lua
  ''
    function()
      local neotree_wins = {}

      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
          table.insert(neotree_wins, win)
        end
      end

      if #neotree_wins > 0 then
        for _, win in ipairs(neotree_wins) do
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
        end
        return
      end

      vim.cmd("Neotree show")
    end
  '';

in
{
  keymaps = [
    {
      mode = "n";
      key = "e";
      action.__raw = focusOrOpen;
      options = {
        desc = "Focus on Neotree";
      };
    }
    {
      mode = "n";
      key = "<S-e>";
      action.__raw = toggle;
      options = {
        desc = "Toggle Neotree";
      };
    }
    {
      mode = "n";
      key = "<leader>ef";
      action = "<CMD>Neotree focus filesystem<CR>";
      options = {
        desc = "Focus on filesystem";
      };
    }
    {
      mode = "n";
      key = "<leader>eb";
      action = "<CMD>Neotree focus buffers<CR>";
      options = {
        desc = "Focus on buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>eg";
      action = "<CMD>Neotree focus git_status<CR>";
      options = {
        desc = "Focus on git status";
      };
    }
    {
      mode = "n";
      key = "<leader>ed";
      action = "<CMD>Neotree focus document_symbols<CR>";
      options = {
        desc = "Focus on document symbols";
      };
    }
  ];
}
