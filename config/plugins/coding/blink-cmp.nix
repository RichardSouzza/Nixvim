{
  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        completion = {
          documentation.auto_show = true;

          keyword.range = "full";

          list = {
            selection = {
              preselect = false;
            };
          };

          menu.draw.columns = [
            { __raw = "{ 'kind_icon', 'label', 'label_description', gap = 1 }"; }
            { __raw = "{ 'source_name' }"; }
          ];

          trigger.show_on_trigger_character = true;
        };

        keymap = {
          preset = "none";
          "<A-Left>"  = [ "select_prev" "fallback" ];
          "<A-Right>" = [ "select_next" "fallback" ];
          "<C-k>"     = [ "show_signature" "hide_signature" ];
          "<C-Space>" = [ "show" ];
        };

        signature = {
          enabled = true;
        };

        sources = {
          default = [
            "buffer"
            "dictionary"
            "emoji"
            "lsp"
            "path"
            "ripgrep"
            "snippets"
          ];

          providers = {
            buffer = {
              score_offset = 2;
            };

            dictionary = {
              async = true;
              name = "Dict";
              module = "blink-cmp-dictionary";
              score_offset = 4;
            };

            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = 10;
              opts = {
                insert = true;
              };
            };

            lsp = {
              fallbacks = [ ];
              score_offset = 3;
            };

            path = {
              score_offset = 1;
            };

            ripgrep = {
              async = true;
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = 5;
              opts = {
                prefix_min_len = 2;
                backend = {
                  context_size = 5;
                  max_filesize = "2M";
                  search_casing = "--smart-case";
                };
              };
            };
          };
        };
      };
    };

    # blink-cmp-copilot.enable = true;
    blink-cmp-dictionary.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;
  };
}
