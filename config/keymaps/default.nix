{
  imports = [
    ./insert.nix
    ./normal.nix
    ./visual.nix
  ];

  keymaps = [
    {
      mode = [ "n" "v" "i" ];
      key = "<home>";
      action.__raw = ''
        function()
          local col = vim.fn.col('.')
          local first_non_blank = vim.fn.indent('.')
          if col - 1 == first_non_blank then
            vim.cmd('normal! 0')
          else
            vim.cmd('normal! ^')
          end
        end
      '';
      options = {
        desc = "Switches the cursor position between ^ and 0";
        silent = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<PageUp>";
      action = "<C-u>";
      options = {
        desc = "Page up";
        silent = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<PageDown>";
      action = "<C-d>";
      options = {
        desc = "Page down";
        silent = true;
      };
    }
  ];
}
