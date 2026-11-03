local M = {}

function M.smart_home()
  local line = vim.api.nvim_get_current_line()
  local first_non_blank = (line:find('%S') or 1) - 1
  if vim.fn.col('.') - 1 == first_non_blank then
    vim.cmd('normal! 0')
  else
    vim.cmd('normal! ^')
  end
end

function M.smart_jump(key)
  local count = vim.v.count
  if count >= 3 then vim.cmd("normal! m'") end
  vim.cmd('normal! ' .. (count > 0 and count or 1) .. key)
end

return M
