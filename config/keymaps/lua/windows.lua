local M = {}

---@param direction "h" | "j" | "k" | "l"
function M.focus(direction)
  vim.cmd('wincmd ' .. direction)
  vim.cmd.stopinsert()
end

return M
