{
  plugins = {
    noice = {
      enable = true;
      settings = {
        cmdline = {
          enabled = true;
          format = {
            lua = {
              pattern = [ "^:%s*lua%s+" "^:%s*lua%s*=%s*" "^:%s*=%s*" ];
              conceal = false;
            };
            help = {
              pattern = [ "^:%s*he?l?p?%s+" "^:%s*FloatingHelp%s+" ];
              conceal = false;
            };
            filter = {
              conceal = false;
            };
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
            view = "mini";
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
          }
          {
            view = "notify";
            filter = {
              event = "msg_showmode";
            };
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
