{
  imports = [
    ./insert.nix
    ./normal.nix
    ./visual.nix
  ];

  keymaps = [
    {
      mode = [ "n" "v" "i" ];
      key = "<Home>";
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
      key = "<S-Up>";
      action = "<C-u>";
      options = {
        desc = "No accidental scrolling";
        remap = true;
        silent = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Down>";
      action = "<C-d>";
      options = {
        desc = "No accidental scrolling";
        remap = true;
        silent = true;
      };
    }
  ];
}
