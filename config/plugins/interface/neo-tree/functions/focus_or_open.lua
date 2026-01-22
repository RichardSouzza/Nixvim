function()
  _G.last_win = vim.api.nvim_get_current_win()
  _G.last_buf = vim.api.nvim_get_current_buf()

  for _, w in ipairs(vim.api.nvim_list_wins()) do
    local b = vim.api.nvim_win_get_buf(w)
    if vim.bo[b].filetype == "neo-tree" then
      vim.api.nvim_set_current_win(w)
      return
    end
  end
  vim.cmd("Neotree focus")
end
