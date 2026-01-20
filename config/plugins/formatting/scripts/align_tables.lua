function align_markdown_tables()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local start = nil

  for i, line in ipairs(lines) do
    if line:find("|") then
      if not start then
        start = i
      end
    else
      if start then
        vim.cmd(string.format("silent! %d,%dEasyAlign*|", start, i - 1))
        start = nil
      end
    end
  end

  if start then
    vim.cmd(string.format("silent! %d,%dEasyAlign*|", start, #lines))
  end

  vim.api.nvim_win_set_cursor(0, cursor)
end
