{
  keymaps = [
    {
      mode = "i";
      key = "<C-backspace>";
      action = "<Esc>ldbi";
      options = {
        desc = "Delete word behind of the cursor";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-delete>";
      action = "<Esc>ldwi";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-kDel>";
      action = "<Esc>ldwi";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-/>";
      action = "<Esc>gcci";
      options = {
        desc = "Comment line";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>yya";
      options = {
        desc = "Yank line";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-v>";
      action = "<C-r>+";
      options = {
        desc = "Paste from the system clipboard";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-[>";
      action = "<Esc>O";
      options = {
        desc = "New line above";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-]>";
      action = "<Esc>o";
      options = {
        desc = "New line bellow";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-left>";
      action = "<Esc><C-o>a";
      options = {
        desc = "Jump back";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-right>";
      action = "<Esc><C-i>a";
      options = {
        desc = "Jump forward";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-S-up>";
      action = "<CMD>t. -1<CR>";
      options = {
        desc = "Duplicate line up";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-S-down>";
      action = "<CMD>t.<CR>";
      options = {
        desc = "Duplicate line down";
        silent = true;
      };
    }
  ];
}
