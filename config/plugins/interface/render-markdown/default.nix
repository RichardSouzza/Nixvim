{
  plugins = {
    render-markdown = {
      enable = true;
      settings = {
        anti_conceal = {
          enabled = false;
          disabled_modes = [ "n" "c" "v" ];
        };
        heading = {
          enabled = true;
          icons = [ "# " "## " "### " "#### " "##### " "###### " ];
          width = "block";
          min_width = 80;
          right_pad = 0;
        };
        code = {
          width = "block";
          min_width = 80;
          left_pad = 2;
          right_pad = 2;
          language_pad = 1;
          border = "thin";
        };
      };
    };
  };
}
