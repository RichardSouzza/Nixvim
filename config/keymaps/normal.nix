let
  smart_jump = (import ./_shared.nix).smart_jump;

in
{
  keymaps = [
    {
      mode = "n";
      key = "gF";
      action = ":edit <cfile><CR>";
      options = {
        desc = "Go to file under cursor";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gkz";
      action = ":NoNeckPain<CR>";
      options = {
        desc = "Center buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "go";
      action = "gx";
      options = {
        desc = "Opens filepath or URI under cursor with the system handler";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "n";
      action = "<S-n>";
      options = {
        desc = "Next";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<BS>";
      action.__raw = smart_jump "-";
      options = {
        desc = "Go up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<CR>";
      action.__raw = smart_jump "+";
      options = {
        desc = "Go up";
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
        desc = "Switches the cursor position between ^ and 0";
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
      key = "<C-c>";
      action = "\"+yy";
      options = {
        desc = "Copy line to clipboard";
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
      key = "<C-k>";
      action = "<C-x>";
      options = {
        desc = "Decrement number under the cursor";
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
      action = ":silent! m .-2<CR>==";
      options = {
        desc = "Move line up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-down>";
      action = ":silent! m .+1<CR>==";
      options = {
        desc = "Move line down";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-left>";
      action = "<C-o>";
      options = {
        desc = "Jump back";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-right>";
      action = "<C-i>";
      options = {
        desc = "Jump forward";
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
  ];
}
