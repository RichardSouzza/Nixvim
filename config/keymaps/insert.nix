let
  deleteWordAhead = (import ./_shared.nix).deleteWordAhead;

in
{
  keymaps = [
    {
      mode = "i";
      key = "<Up>";
      action = "<Esc>gka";
      options = {
        desc = "Move up by one display line";
      };
    }
    {
      mode = "i";
      key = "<Down>";
      action = "<Esc>gja";
      options = {
        desc = "Move down by one display line";
      };
    }
    {
      mode = "i";
      key = "<C-BS>";
      action = "<C-w>";
      options.desc = "Delete word behind the cursor";
    }
    {
      mode = "i";
      key = "<C-h>";
      action = "<C-w>";
      options.desc = "Delete word behind the cursor";
    }
    {
      mode = "i";
      key = "<C-delete>";
      action = deleteWordAhead;
      options = {
        desc = "Delete word ahead of the cursor";
      };
    }
    {
      mode = "i";
      key = "<C-kDel>";
      action = deleteWordAhead;
      options = {
        desc = "Delete word ahead of the cursor";
      };
    }
    {
      mode = "i";
      key = "<C-/>";
      action = "<Esc>gcci";
      options = {
        desc = "Comment line";
      };
    }
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>yya";
      options = {
        desc = "Yank line";
      };
    }
    {
      mode = "i";
      key = "<C-v>";
      action = "<C-r>+";
      options = {
        desc = "Paste from the system clipboard";
      };
    }
    {
      mode = "i";
      key = "<A-[>";
      action = "<Esc>O";
      options = {
        desc = "Open line above";
      };
    }
    {
      mode = "i";
      key = "<A-]>";
      action = "<Esc>o";
      options = {
        desc = "Open line bellow";
      };
    }
    {
      mode = "i";
      key = "<A-left>";
      action = "<Esc><C-o>a";
      options = {
        desc = "Jump back";
      };
    }
    {
      mode = "i";
      key = "<A-right>";
      action = "<Esc><C-i>a";
      options = {
        desc = "Jump forward";
      };
    }
    {
      mode = "i";
      key = "<A-S-up>";
      action = "<CMD>t. -1<CR>";
      options = {
        desc = "Duplicate line up";
      };
    }
    {
      mode = "i";
      key = "<A-S-down>";
      action = "<CMD>t.<CR>";
      options = {
        desc = "Duplicate line down";
      };
    }
  ];
}
