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
