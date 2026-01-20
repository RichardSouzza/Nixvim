function(bufnr)
  local ignored_filetypes = { }
  local filetype = vim.bo[bufnr].filetype

  if vim.tbl_contains(ignored_filetypes, filetype) then
    return
  end

  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
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
