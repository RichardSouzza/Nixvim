{
  plugins = {
    visual-multi = {
      enable = true;

      settings = {
        default_mappings = 0;
        leader = "\\";

        maps = {
          "Add Cursor At Pos"    = "mp";
          "Add Cursor Up"        = "<C-Up>";
          "Add Cursor Down"      = "<C-Down>";
          "Align"                = "<A-a>";
          "Case Conversion Menu" = "<A-c>";
          "Find Under"           = "<C-n>";
          "Move Left"            = "<A-Left>";
          "Move Right"           = "<A-Right>";
          "Start Regex Search"   = "mr";
          "Select All"           = "ma";
        };

        mouse_mappings = 1;
        show_warnings = 1;
        skip_shorter_lines = 0;
        silent_exit = 1;
        theme = "iceblue";
      };
    };
  };
}
