{
  plugins = {
    noice = {
      enable = true;
      settings = {
        cmdline.format = {
          help = {
            pattern = [ "^:%s*he?l?p?%s+" "^:%s*FloatingHelp%s+" ];
          };
        };

        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
          signature = {
            enabled = true;
            view = "hover2";
          };
        };

        presets = {
          command_palette = false;
        };

        routes = [
          {
            filter = {
              event = "msg_show";
              any = [
                { find = "%d+L, %d+B";     }
                { find = "%d fewer lines"; }
                { find = "%d more lines";  }
                { find = "; after #%d+";   }
                { find = "; before #%d+";  }
              ];
            };
            view = "mini";
          }
        ];

        views = {
          hover2 = {
            view = "popup";
            relative = "cursor";
            zindex = 45;
            enter = false;
            anchor = "auto";
            size = {
              width = "auto";
              height = "auto";
              max_height = 20;
              max_width = 120;
            };
            border = {
              style = "rounded";
              padding = [ 0 2 ];
            };
            position = { row = 2; col = 0; };
            win_options = {
              foldenable = false;
              linebreak = true;
              wrap = true;
            };
          };
        };
      };
    };
  };
}
