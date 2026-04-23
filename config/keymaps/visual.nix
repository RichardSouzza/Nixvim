{
  keymaps = [
    {
      mode = "v";
      key = "+";
      action = "<C-a>";
      options = {
        desc = "Increment all numbers in the selection";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<C-c>";
      action = "\"+y";
      options = {
        silent = false;
        desc = "Copy selected text to clipboard";
      };
    }
    {
      mode = "v";
      key = "-";
      action = "<C-x>";
      options = {
        desc = "Decrement all numbers in the selection";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<A-up>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Move selected lines up";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<A-down>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Move selected lines down";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        desc = "Unindent while keeping selection";
        silent = true;
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        desc = "Indent while keeping selection";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "?";
      action = "#";
      options = {
        desc = "Search selection backward";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "/";
      action = "*";
      options = {
        desc = "Search selection foward";
        silent = true;
      };
    }
  ];
}
