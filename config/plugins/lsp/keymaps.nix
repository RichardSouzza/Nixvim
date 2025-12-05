{
  keymaps = [
    {
      mode = "n";
      key = "gr";
      action.__raw = "function() vim.lsp.buf.rename() end";
      options = {
        desc = "LSP rename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gd";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options = {
        desc = "Go to definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = "function() Snacks.picker.lsp_declarations() end";
      options = {
        desc = "Go to declaration";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gi";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options = {
        desc = "Go to declaration";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options = {
        desc = "Go to type definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gt";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
      options = {
        desc = "Go to type definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = ".";
      action = "<CMD>Lspsaga code_action<CR>";
      options = {
        desc = "Show code actions";
        silent = true;
      };
    }
  ];
}
