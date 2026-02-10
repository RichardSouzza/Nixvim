{ pkgs, ... }:

{
  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        completion = {
          documentation.auto_show = true;

          ghost_text = {
            enabled = true;
            show_with_menu = true;
          };

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

        fuzzy = {
          implementation = "prefer_rust";
          sorts = [ "exact" "score" "sort_text" "label" ];
        };

        keymap = {
          preset = "none";
          "<A-Left>"  = [ "show" "select_prev" "fallback" ];
          "<A-Right>" = [ "show" "select_next" "fallback" ];
          "<Tab>"     = [ "accept" "fallback" ];
          "<S-Up>"    = [ "scroll_documentation_up" "fallback" ];
          "<S-Down>"  = [ "scroll_documentation_down" "fallback" ];
          "<S-Left>"  = [ "snippet_backward" "fallback" ];
          "<S-Right>" = [ "snippet_forward" "fallback" ];
          "<C-k>"     = [ "show_signature" "hide_signature" ];
          "<C-Space>" = [ "show" "show_documentation" "hide_documentation"];
        };

        signature = {
          enabled = true;
        };

        snippets = {
          preset = "luasnip";
        };

        sources = {
          default = [
            "buffer"
            "codeium"
            # "dictionary"
            "emoji"
            "lsp"
            "path"
            "ripgrep"
            "snippets"
          ];

          providers = {
            buffer = {
              async = true;
              score_offset = -5;
              max_items = 3;
            };

            codeium = {
              async = true;
              name = "Codeium";
              module = "codeium.blink";
              score_offset = -3;
            };

            # dictionary = {
            #   async = true;
            #   name = "Dict";
            #   module = "blink-cmp-dictionary";
            #   max_items = 3;
            #   min_keyword_length = 2;
            #   score_offset = -6;
            #   opts = {
            #     dictionary_directories = {
            #       __unkeyed-1.__raw = ''vim.fn.expand("~/.local/share/wordlists")'';
            #     };
            #   };
            # };

            # "easy-dotnet" = {
            #   async = true;
            #   enabled = true;
            #   name = "easy-dotnet";
            #   module = "easy-dotnet.completion.blink";
            #   score_offset = -4;
            # };

            emoji = {
              async = true;
              name = "Emoji";
              module = "blink-emoji";
              score_offset = -10;
              opts = {
                insert = true;
              };
            };

            lsp = {
              async = true;
              fallbacks = [ ];
              score_offset = -4;
            };

            path = {
              score_offset = -1;
              opts.trailing_slash = false;
            };

            ripgrep = {
              async = true;
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = -7;
              max_items = 3;
              opts = {
                prefix_min_len = 2;
                backend = {
                  context_size = 5;
                  max_filesize = "2M";
                  search_casing = "--smart-case";
                };
              };
            };

            snippets = {
              async = true;
              name = "Snippets";
              module = "blink.cmp.sources.snippets";
              score_offset = -2;
              max_items = 3;
            };
          };
        };
      };
    };

    # blink-cmp-dictionary.enable = true;
    blink-compat.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;

    friendly-snippets.enable = true;

    luasnip = {
      enable = true;

      filetypeExtend = {
        typescript = [ "javascript" ];
      };

      fromVscode = [
        { }
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-avante
  ];
}
