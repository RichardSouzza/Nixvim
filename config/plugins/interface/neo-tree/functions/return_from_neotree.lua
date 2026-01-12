function()
  if _G.last_win and vim.api.nvim_win_is_valid(_G.last_win) then
    vim.api.nvim_set_current_win(_G.last_win)
    return
  end

  if _G.last_buf and vim.api.nvim_buf_is_valid(_G.last_buf) then
    vim.cmd("buffer " .. _G.last_buf)
    return
  end

  vim.cmd("wincmd l")
end
