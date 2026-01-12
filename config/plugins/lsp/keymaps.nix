{
  keymaps = [
    {
      mode = "n";
      key = "<leader>lR";
      action.__raw = "function() vim.lsp.buf.rename() end";
      options = {
        desc = "LSP rename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ld";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options = {
        desc = "Go to definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lD";
      action.__raw = "function() Snacks.picker.lsp_declarations() end";
      options = {
        desc = "Go to declaration";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>li";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options = {
        desc = "Go to declaration";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lr";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options = {
        desc = "Go to type definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lt";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
      options = {
        desc = "Go to type definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>l.";
      action = "<CMD>Lspsaga code_action<CR>";
      options = {
        desc = "Show code actions";
        silent = true;
      };
    }
  ];
}
