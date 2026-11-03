{
  extraConfigLuaPre = ''
    package.preload['config.keymaps.session'] = function()
      ${builtins.readFile ./lua/session.lua}
    end
  '';

  keymaps = [
    {
      mode = "n";
      key = "<C-q>";
      action = "<CMD>qa<CR>";
      options = {
        desc = "Exit NeoVim";
      };
    }
    {
      mode = "n";
      key = "<leader>]n";
      action.__raw = ''
        function()
          if vim.o.number and vim.o.relativenumber then
            vim.o.number = false
            vim.o.relativenumber = false
          else
            vim.o.number = true
            vim.o.relativenumber = true
          end
        end
      '';
      options = {
        desc = "Toggle line numbers";
      };
    }
    {
      mode = "n";
      key = "<leader><S-d>";
      action = "<C-w>d";
      options = {
        desc = "Show diagnostics";
      };
    }
  ];
}
