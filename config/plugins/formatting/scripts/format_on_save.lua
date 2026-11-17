---@diagnostic disable: syntax-error
function(bufnr)
  local ignored_filetypes = { }
  local filetype = vim.bo[bufnr].filetype

  local autoformat_filetypes = {
    lua = true,
  }

  if vim.tbl_contains(ignored_filetypes, filetype) then
    return
  end

  if not vim.b[bufnr].autoformat then
    return
  end

  -- Allows autoformatting only when the filetype is permitted and global autoformatting is enabled.
  if not (vim.tbl_contains(autoformat_filetypes, filetype) and vim.g.autoformat) then
    return
  end

  if filetype == "markdown" then
    align_markdown_tables()
  end

  if filetype == "sql" then
    replace_sql_parameters(bufnr)
  end

  return { timeout_ms = 5000, lsp_format = "fallback" }
end
