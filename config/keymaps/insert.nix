{
  keymaps = [
    {
      mode = "i";
      key = "<C-backspace>";
      action = "<Esc>ldbi";
      options = {
        desc = "Delete word behind of the cursor";
      };
    }
    {
      mode = "i";
      key = "<C-delete>";
      action = "<Esc>ldwi";
      options = {
        desc = "Delete word ahead of the cursor";
      };
    }
    {
      mode = "i";
      key = "<C-kDel>";
      action = "<Esc>ldwi";
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
