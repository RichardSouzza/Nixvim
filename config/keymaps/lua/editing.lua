local M = {}

function M.delete_word_ahead()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1
  local rest = vim.api.nvim_get_current_line():sub(col + 1)

  if rest == '' then
    if row < vim.api.nvim_buf_line_count(0) - 1 then
      vim.api.nvim_buf_set_text(0, row, col, row + 1, 0, { '' })
    end
    return
  end

  local patterns = { [[^\s*\k\+]], [[^\s\+]], [[^\%(\k\@!\S\)\+]] }

  local m = ''
  for _, p in ipairs(patterns) do
    m = vim.fn.matchstr(rest, p)
    if m ~= '' then break end
  end

  if m ~= '' then
    vim.api.nvim_buf_set_text(0, row, col, row, col + #m, { '' })
  end
end

return M
