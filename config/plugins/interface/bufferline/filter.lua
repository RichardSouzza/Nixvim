---@diagnostic disable: syntax-error
function(bufnr)
  local arrow_files = vim.g.arrow_filenames or {}
  if #arrow_files == 0 then
    return true
  end

  local bufname = vim.api.nvim_buf_get_name(bufnr)
  if bufname == "" then
    return false
  end

  local bufpath = vim.fn.fnamemodify(bufname, ":p")

  for _, file in ipairs(arrow_files) do
    local full = vim.fn.fnamemodify(file, ":p")
    if full == bufpath then
      return true
    end
  end

  return false
end
