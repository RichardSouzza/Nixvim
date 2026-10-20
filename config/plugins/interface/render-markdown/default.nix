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
          icons = [ "# " "## " "### " "#### " "##### " "###### " ];
          width = "block";
          min_width = 80;
          right_pad = 0;
        };
        bullet = {
          icons = "󰧞"; # nf-md-circle_medium
        };
        code = {
          width = "block";
          min_width = 80;
          left_pad = 2;
          right_pad = 2;
          language_pad = 1;
          border = "thin";
        };
        pipe_table = {
          border_virtual = true;
        };
      };
    };
  };
}
