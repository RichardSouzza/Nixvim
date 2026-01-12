{
  keymaps = [
    {
      mode = "n";
      key = "<A-;>";
      action = "<CMD>ToggleTerm direction=horizontal<CR>";
      options = {
        desc = "Toggle terminal";
      };
    }
    {
      mode = "n";
      key = "<A-j>";
      action = "<CMD>ToggleTerm direction=float<CR>";
      options = {
        desc = "Toggle float terminal";
      };
    }
    {
      mode = "n";
      key = "<A-:>";
      action = "<CMD>TermNew<CR>";
      options = {
        desc = "Open new terminal";
      };
    }
    {
      mode = "n";
      key = ";";
      action = "<CMD>TermSelect<CR>";
      options = {
        desc = "Switch terminal";
      };
    }
    {
      mode = "t";
      key = "<A-j>";
      action = ''<C-\><C-n><C-w><C-p>'';
      options = {
        desc = "Exit terminal mode and go to the previous buffer";
      };
    }
    {
      mode = "t";
      key = "<A-;>";
      action = ''<C-\><C-n><C-w><C-p>'';
      options = {
        desc = "Exit terminal mode and go to the previous buffer";
      };
    }
    {
      mode = "t";
      key = "<A-:>";
      action = "<CMD>TermNew<CR>";
      options = {
        desc = "Open new terminal";
      };
    }
    {
      mode = "n";
      key = "<leader>s";
      action.__raw = "function() Scooter() end";
      options = {
        desc = "Open Scooter";
      };
    }
  ];
}
