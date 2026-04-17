require("lsp-file-operations").setup()
local lspconfig = require("lspconfig")

lspconfig.util.default_config =
  vim.tbl_extend("force", lspconfig.util.default_config, {
    capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("lsp-file-operations").default_capabilities()
    ),
  })
