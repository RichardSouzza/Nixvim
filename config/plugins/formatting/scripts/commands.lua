-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save

vim.api.nvim_create_user_command("FormatDisable", function(args)
  -- FormatDisable! will disable formatting just for this buffer
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
    vim.b.autoformat = false
    for _, client in ipairs(vim.lsp.get_clients()) do
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
  vim.b.autoformat = true
  for _, client in ipairs(vim.lsp.get_clients()) do
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
  end
end, {
  desc = "Re-enable autoformat-on-save",
})
