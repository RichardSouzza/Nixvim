{
  plugins = {
    toggleterm = {
      enable = true;
      settings = {
        size = ''
          function(term)
            if term.direction == "horizontal" then
              return 16
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.4
            end
          end
        '';
      };
    };
  };

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
  ];
}
