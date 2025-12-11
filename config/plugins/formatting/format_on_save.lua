function(bufnr)
  if vim.g.disable_autoformat then
    return
  end

  if vim.bo[bufnr].filetype == "sql" then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local function to_pascal_case(str)
      local words = {}
      for w in str:gmatch("[A-Za-z0-9]+") do
        table.insert(words, w:sub(1,1):upper() .. w:sub(2):lower())
      end
      return table.concat(words, "")
    end

    for i, line in ipairs(lines) do
      lines[i] = vim.fn.substitute(
        line,
        [[\$P{\(\w\+\)}]],
        function()
          local raw = vim.fn.submatch(1)
          return "@" .. to_pascal_case(raw)
        end,
        "g"
      )
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  end

  return { timeout_ms = 500, lsp_format = "fallback" }
end
