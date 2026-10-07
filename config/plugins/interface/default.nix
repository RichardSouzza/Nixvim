{
  plugins = {
    colorful-menu.enable = true;

    colorizer = {
      enable = true;
      settings = {
        user_default_options.names = false; # No highlight for color names
      };
    };

    csvview.enable = true;

    helpview = {
      enable = true;
      settings = {
        code_blocks = {
          enable = true;
          border_hl = "MarkviewCode";
          info_hl = "MarkviewCodeInfo";
        };
      };
    };

    smear-cursor.enable = true;

    tiny-glimmer.enable = true;
  };
}
