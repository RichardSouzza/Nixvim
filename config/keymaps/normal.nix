let
  smartJump = (import ./_shared.nix).smartJump;

in
{
  keymaps = [
    {
      mode = "n";
      key = "gb";
      action = "gc";
      options = {
        remap = false;
      };
    }
    {
      mode = "n";
      key = "gF";
      action = ":edit <cfile><CR>";
      options = {
        desc = "Go to file under cursor";
      };
    }
    {
      mode = "n";
      key = "go";
      action = ":vertical wincmd f";
      options = {
        desc = "Opens filepath or URI under cursor in a new buffer";
      };
    }
    {
      mode = "n";
      key = "gT";
      action = "gT";
      options = {
        desc = "Go to previous tab page";
      };
    }
    {
      mode = "n";
      key = "gv";
      action = "gv";
      options = {
        desc = "Last visual selection";
      };
    }
    {
      mode = "n";
      key = "g,";
      action = "g,";
      options = {
        desc = "Go to newer position in change list";
      };
    }
    {
      mode = "n";
      key = "g;";
      action = "g;";
      options = {
        desc = "Go to older position in change list";
      };
    }
    {
      mode = "n";
      key = "<BS>";
      action.__raw = smartJump "-";
      options = {
        desc = "Go up";
      };
    }
    {
      mode = "n";
      key = "<CR>";
      action.__raw = smartJump "+";
      options = {
        desc = "Go up";
      };
    }
    {
      mode = "n";
      key = "<Insert>";
      action = "a";
      options = {
        desc = "Append as default insertion mode";
      };
    }
    {
      mode = "n";
      key = "<Tab>"; # <C-i>
      action = "<CMD>normal! <C-a><CR>";
      options = {
        desc = "Increment number under the cursor";
      };
    }
    {
      mode = "n";
      key = "<C-a>";
      action = "ggVG";
      options = {
        desc = "Select all";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-x>";
      options = {
        desc = "Decrement number under the cursor";
      };
    }
    {
      mode = "n";
      key = "<C-q>";
      action = ":qa<CR>";
      options = {
        desc = "Exit NeoVim";
      };
    }
    {
      mode = "n";
      key = "<C-Delete>";
      action = "dw";
      options = {
        desc = "Delete word ahead of the cursor";
      };
    }
    {
      mode = "n";
      key = "<C-Space>"; # <Tab>
      action = "a <Esc>";
      options = {
        desc = "Add spaces in normal mode";
      };
    }
    {
      mode = "n";
      key = "<C-A-Up>";
      action = "<C-w>k";
      options = {
        desc = "Go to the up window";
      };
    }
    {
      mode = "n";
      key = "<C-A-Down>";
      action = "<C-w>j";
      options = {
        desc = "Go to the down window";
      };
    }
    {
      mode = "n";
      key = "<C-A-Left>";
      action = "<C-w>h";
      options = {
        desc = "Go to the left window";
      };
    }
    {
      mode = "n";
      key = "<C-A-Right>";
      action = "<C-w>l";
      options = {
        desc = "Go to the right window";
      };
    }
    {
      mode = "n";
      key = "<A-[>";
      action = "O";
      options = {
        desc = "New line above";
      };
    }
    {
      mode = "n";
      key = "<A-]>";
      action = "o";
      options = {
        desc = "New line bellow";
      };
    }
    {
      mode = "n";
      key = "<A-v>";
      action = "<C-S-v>";
      options = {
        desc = "Visual-block mode";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-up>";
      action = "<CMD>silent! m .-2<CR>";
      options = {
        desc = "Move line up";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-down>";
      action = "<CMD>silent! m .+1<CR>";
      options = {
        desc = "Move line down";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-+>";
      action = "<C-w>>";
      options = {
        desc = "Increase width";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-->";
      action = "<C-w><";
      options = {
        desc = "Decrease width";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-*>";
      action = "<C-w>+";
      options = {
        desc = "Increase height";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<A-/>";
      action = "<C-w>-";
      options = {
        desc = "Decrease height";
      };
    }
    {
      mode = "n";
      key = "<A-S-up>";
      action = "<CMD>t. -1<CR>";
      options = {
        desc = "Duplicate line up";
      };
    }
    {
      mode = "n";
      key = "<A-S-down>";
      action = "<CMD>t.<CR>";
      options = {
        desc = "Duplicate line down";
      };
    }
    {
      mode = "n";
      key = "<S-b>";
      action = "ge";
      options = {
        desc = "Prev end of word";
      };
    }
    {
      mode = "n";
      key = "<S-w>";
      action = "e";
      options = {
        desc = "Next end of word";
        remap = false;
      };
    }
    {
      mode = "n";
      key = "<S-Left>";
      action = "<C-o>";
      options = {
        desc = "Jump back";
      };
    }
    {
      mode = "n";
      key = "<S-Right>";
      action = "<C-i>";
      options = {
        desc = "Jump forward";
      };
    }
    {
      mode = "n";
      key = "<leader><CR>";
      action = "a<CR>";
      options = {
        desc = "Break line";
      };
    }
    {
      mode = "n";
      key = "<leader>D";
      action = "<C-w>d";
      options = {
        desc = "Show diagnostics";
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
      };
    }
  ];
}
