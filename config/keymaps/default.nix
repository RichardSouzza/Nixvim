{
  imports = [
    ./insert.nix
    ./normal.nix
    ./visual.nix
  ];

  keymaps = [
    {
      mode = [ "v" "o" ];
      key = "<BS>";
      action = "k";
      options = {
        desc = "Go up";
        noremap = true;
      };
    }
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
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<C-s>";
      action = "<Esc><CMD>w<CR>";
      options = {
        desc = "Save file";
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Up>";
      action = "<C-u>";
      options = {
        desc = "Smooth scroll";
        remap = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Down>";
      action = "<C-d>";
      options = {
        desc = "Smooth scroll";
        remap = true;
      };
    }
  ];
}
