let
  setIcon = (import ./../../keymaps/_shared.nix).setIcon;

in
{
  plugins.which-key.settings.spec = [
    (setIcon { key = "gd"; icon = ""; color = "purple"; })
    (setIcon { key = "gD"; icon = ""; color = "purple"; })
    (setIcon { key = "gi"; icon = "󰐱"; color = "purple"; })
    (setIcon { key = "gr"; icon = "󰌹"; color = "purple"; })
    (setIcon { key = "gR"; icon = ""; color = "purple"; })
    (setIcon { key = "gt"; icon = "󰓹"; color = "purple"; })
    (setIcon { key = "<leader>."; icon = "󱐋"; color = "yellow"; })
  ];

  keymaps = [
    {
      mode = "n";
      key = "gd";
      action.__raw = "function() Snacks.picker.lsp_definitions() end";
      options = {
        desc = "Show definitions";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gD";
      action.__raw = "function() Snacks.picker.lsp_declarations() end";
      options = {
        desc = "Show declarations";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gi";
      action.__raw = "function() Snacks.picker.lsp_implementations() end";
      options = {
        desc = "Show implementations";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gr";
      action.__raw = "function() Snacks.picker.lsp_references() end";
      options = {
        desc = "Show references";
        nowait = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gR";
      action.__raw = "function() vim.lsp.buf.rename() end";
      options = {
        desc = "LSP rename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gt";
      action.__raw = "function() Snacks.picker.lsp_type_definitions() end";
      options = {
        desc = "Show type definitions";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>.";
      action = "<CMD>Lspsaga code_action<CR>";
      options = {
        desc = "Show code actions";
        silent = true;
      };
    }
  ];
}
