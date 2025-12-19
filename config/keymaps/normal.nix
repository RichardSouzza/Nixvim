{
  keymaps = [
    {
      action = ":edit <cfile><CR>";
      key = "gF";
      mode = "n";
      options = {
        desc = "Go to file under cursor";
        silent = true;
      };
    }
    {
      action = ":NoNeckPain<CR>";
      key = "gkz";
      mode = "n";
      options = {
        desc = "Center buffer";
        silent = true;
      };
    }
    {
      action = "gx";
      key = "go";
      mode = "n";
      options = {
        desc = "Opens filepath or URI under cursor with the system handler";
        remap = true;
        silent = true;
      };
    }
    {
      action = "<S-n>";
      key = "n";
      mode = "n";
      options = {
        desc = "Next";
        silent = true;
      };
    }
    {
      action = "-";
      key = "<BS>";
      mode = "n";
      options = {
        desc = "Go up";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
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
        desc = "Switches between line ^ and 0";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<insert>";
      action = "a";
      options = {
        desc = "Append as default insertion mode";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-a>";
      action = "ggVG";
      options = {
        desc = "Select all";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-i>";
      action = "<C-a>";
      options = {
        desc = "Increment number under the cursor";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-q>";
      action = ":qa<CR>";
      options = {
        desc = "Exit NeoVim";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
      options = {
        desc = "Save file";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-c>";
      action = "\"+yy";
      options = {
        desc = "Copy line to clipboard";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-delete>";
      action = "dw";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-/>";
      action = "gcc";
      options = {
        desc = "Comment line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-[>";
      action = "O";
      options = {
        desc = "New line above";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-]>";
      action = "o";
      options = {
        desc = "New line bellow";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-up>";
      action = ":m .-2<CR>==";
      options = {
        desc = "Move line up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-down>";
      action = ":m .+1<CR>==";
      options = {
        desc = "Move line down";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-S-up>";
      action = "<CMD>t. -1<CR>";
      options = {
        desc = "Duplicate line up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-S-down>";
      action = "<CMD>t.<CR>";
      options = {
        desc = "Duplicate line down";
        silent = true;
      };
    }
    {
      action = "n";
      key = "<S-n>";
      mode = "n";
      options = {
        desc = "Previous";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-q>";
      action = ":q<CR>";
      options = {
        desc = "Close buffer";
        silent = true;
      };
    }
  ];
}
