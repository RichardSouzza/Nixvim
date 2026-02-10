let
  setIcon = (import ./_shared.nix).setIcon;
  setIconGroup = (import ./_shared.nix).setIconGroup;
  smartJump = (import ./_shared.nix).smartJump;

in
{
  plugins.which-key.settings.spec = [
    (setIcon { key = "gF"; icon = ""; })
    (setIcon { key = "go"; icon = ""; })
    (setIcon { key = "<leader><CR>"; icon = "󰛗"; })
    (setIconGroup { group = "Debug"; key = "<leader>d"; icon = ""; color = "green"; })
    (setIconGroup { group = "Format actions"; key = "<leader>w<Space>"; icon = "󰯉"; color = "pink"; })
  ];

  keymaps = [
    {
      mode = "n";
      key = "gb";
      action = "gc";
      options = {
        desc = "Toggle comment";
        remap = true;
        silent = true;
      };
    }
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
      key = "go";
      action = ":vertical wincmd f";
      options = {
        desc = "Opens filepath or URI under cursor in a new buffer";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "n";
      action = "<CMD>normal! <S-n><CR>";
      options = {
        desc = "Next";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<BS>";
      action.__raw = smartJump "-";
      options = {
        desc = "Go up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<CR>";
      action.__raw = smartJump "+";
      options = {
        desc = "Go up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Insert>";
      action = "a";
      options = {
        desc = "Append as default insertion mode";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<Tab>";
      action = "a <Esc>";
      options = {
        desc = "Add spaces in normal mode";
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
      key = "<Tab>"; # <C-i>
      action = "<CMD>normal! <C-a><CR>";
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
      key = "<C-delete>";
      action = "dw";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-S-Up>";
      action = "<C-w>k";
      options = {
        desc = "Go to the up window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-S-Down>";
      action = "<C-w>j";
      options = {
        desc = "Go to the down window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-S-Left>";
      action = "<C-w>h";
      options = {
        desc = "Go to the left window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-S-Right>";
      action = "<C-w>l";
      options = {
        desc = "Go to the right window";
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
      key = "<A-v>";
      action = "<C-S-v>";
      options = {
        desc = "Visual-block mode";
        silent = true;
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-up>";
      action = "<CMD>silent! m .-2<CR>";
      options = {
        desc = "Move line up";
        silent = true;
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-down>";
      action = "<CMD>silent! m .+1<CR>";
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
      mode = "n";
      key = "<S-n>";
      action = "<CMD>normal! n<CR>";
      options = {
        desc = "Previous";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-left>";
      action = "<C-o>";
      options = {
        desc = "Jump back";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-right>";
      action = "<C-i>";
      options = {
        desc = "Jump forward";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader><CR>";
      action = "a<CR>";
      options = {
        desc = "Break line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>D";
      action = "<C-w>d";
      options = {
        desc = "Show diagnostics";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>w<Space>";
      action.__raw = ''
        function()
          vim.cmd([[silent keeppatterns %s/\(\S\)\s\{2,}/\1 /ge]])
        end
      '';
      options = {
        desc = "Remove duplicate spaces";
        silent = true;
      };
    }
  ];
}
