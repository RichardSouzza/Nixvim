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

          menu = {
            draw.columns = [
              { __raw = "{ 'kind_icon', 'label', 'label_description', gap = 1 }"; }
              { __raw = "{ 'source_name' }"; }
            ];
          };

          trigger = {
            prefetch_on_insert = true;
            show_in_snippet = true;
            show_on_accept_on_trigger_character = true;
            show_on_backspace = false;
            show_on_backspace_after_accept = true;
            show_on_backspace_in_keyword  = true;
            show_on_insert = false;
            show_on_insert_on_trigger_character = true;
            show_on_keyword = true;
          };
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
              score_offset = -2;
            };

            dictionary = {
              async = true;
              name = "Dict";
              module = "blink-cmp-dictionary";
              min_keyword_length = 3;
              score_offset = -4;
            };

            "easy-dotnet" = {
              async = true;
              enabled = true;
              name = "easy-dotnet";
              module = "easy-dotnet.completion.blink";
              score_offset = -3;
            };

            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = -6;
              opts = {
                insert = true;
              };
            };

            lsp = {
              fallbacks = [ ];
              score_offset = -3;
            };

            path = {
              score_offset = -1;
              opts.trailing_slash = false;
            };

            ripgrep = {
              async = true;
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = -5;
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

    blink-cmp-dictionary.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;
  };
}
