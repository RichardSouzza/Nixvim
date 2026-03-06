let
  setIcon = (import ./helpers.nix).setIcon;
  setIconGroup = (import ./helpers.nix).setIconGroup;
  whichKeyIgnore = (import ./helpers.nix).wichKeyIgnore;

in
{
  plugins = {
    which-key = {
      enable = true;
      settings = {
        preset = "modern";
        icons = {
          group = "";
        };
        keys = {
          scroll_up = "<S-Up>";
          scroll_down = "<S-Down>";
        };
        spec = [
          # Goto
          (setIcon { key = "gF";  icon = ""; color = "azure"; })   # nf-fa-file
          (setIcon { key = "gH";  icon = ""; color = "green"; })   # nf-cod-git_pull_request
          (setIcon { key = "gc";  icon = ""; color = "green"; })   # nf-seti-search
          (setIcon { key = "gf";  icon = ""; color = "green"; })   # nf-seti-search
          (setIcon { key = "go";  icon = ""; color = "azure"; })   # nf-fa-file
          (setIcon { key = "gs";  icon = ""; color = "blue";  })   # nf-cod-window
          (setIcon { key = "gT";  icon = ""; color = "blue";  })   # nf-cod-window
          (setIcon { key = "gv";  icon = "󰮳"; color = "cyan";  })   # nf-md-page_previous_outline
          (setIcon { key = "gx";  icon = ""; color = "azure"; })   # nf-fa-file
          (setIcon { key = "g,";  icon = ""; color = "green"; })   # nf-oct-diff_added
          (setIcon { key = "g;";  icon = ""; color = "green"; })   # nf-oct-diff_removed

          # LSP
          (setIcon { key = "gD"; icon = ""; color = "yellow"; })   # nf-fa-scroll
          (setIcon { key = "gR"; icon = ""; color = "yellow"; })   # nf-fa-pen_to_square
          (setIcon { key = "gd"; icon = "󰏪"; color = "yellow"; })   # nf-md-pen
          (setIcon { key = "gi"; icon = "󰐱"; color = "yellow"; })   # nf-md-puzzle
          (setIcon { key = "gr"; icon = "󰌹"; color = "yellow"; })   # nf-md-link_variant
          (setIcon { key = "gt"; icon = "󰓹"; color = "yellow"; })   # nf-md-tag
          (setIcon { key = "gw"; icon = "󰉢"; color = "blue";   })   # nf-md-format_align_left

          # Snacks Picker
          (setIcon { key = "gpD"; icon = ""; color = "orange"; })  # nf-fa-warning
          (setIcon { key = "gpc"; icon = "󰏘"; color = "cyan";   })  # nf-md-palette
          (setIcon { key = "gpd"; icon = ""; color = "orange"; })  # nf-fa-warning
          (setIcon { key = "gpk"; icon = ""; color = "blue";   })  # nf-fa-keyboard
          (setIcon { key = "gpu"; icon = "󰕍"; color = "green";  })  # nf-md-undo_variant

          # Actions
          (setIcon { key = "<leader>b";    icon = ""; color = "green";  }) # nf-seti-search
          (setIcon { key = "<leader>c";    icon = ""; color = "green";  }) # nf-seti-search
          (setIcon { key = "<leader>f";    icon = ""; color = "green";  }) # nf-seti-search
          (setIcon { key = "<leader>g";    icon = "󰊢"; color = "red";    }) # nf-md-git
          (setIcon { key = "<leader>s";    icon = ""; color = "blue";   }) # nf-fa-refresh
          (setIcon { key = "<leader>t";    icon = ""; color = "orange"; }) # nf-fa-warning
          (setIcon { key = "<leader>z";    icon = ""; color = "azure";  }) # nf-fa-align_center
          (setIcon { key = "<leader>.";    icon = "󱐋"; color = "yellow"; }) # nf-md-lightning_bolt
          (setIcon { key = "<leader>:";    icon = ""; color = "green";  }) # nf-seti-search
          (setIcon { key = "<leader><CR>"; icon = "󰛗"; color = "azure";  }) # nf-md-format_page_break

          # NeoTree
          (setIcon { key = "<leader>eb"; icon = ""; color = "azure"; }) # nf-fa-file
          (setIcon { key = "<leader>ef"; icon = ""; color = "azure"; }) # nf-fa-folder_tree
          (setIcon { key = "<leader>eg"; icon = "󰊢"; color = "red";   }) # nf-md-git
          (setIcon { key = "<leader>es"; icon = ""; color = "azure"; }) # nf-cod-symbol_field

          # Groups
          (setIconGroup { group = " Goto";         key = "g";         icon = " "; color = "azure"; }) # nf-fa-rocket
          (setIconGroup { group = "Comment";        key = "gb";        icon = "󰆈"; color = "azure"; }) # nf-md-comment_text
          (setIconGroup { group = "Debug";          key = "<leader>d"; icon = ""; color = "green"; }) # nf-cod-debug_alt
          (setIconGroup { group = "Format actions"; key = "<leader>w"; icon = ""; color = "pink";  }) # nf-fa-marker
          (setIconGroup { group = "Git";            key = "gh";        icon = "󰊢"; color = "red";   }) # nf-md-git
          (setIconGroup { group = "Neotree";        key = "<leader>e"; icon = ""; color = "azure"; }) # nf-fa-folder_tree
          (setIconGroup { group = "Picker";         key = "gp";        icon = ""; color = "green"; }) # nf-seti-search

          # Ignore
          (whichKeyIgnore { key = "gcc"; })
          (whichKeyIgnore { key = "gg";  })
          (whichKeyIgnore { key = "gG";  })
          (whichKeyIgnore { key = "gu";  })
          (whichKeyIgnore { key = "gU";  })
          (whichKeyIgnore { key = "gn";  })
          (whichKeyIgnore { key = "gN";  })
          (whichKeyIgnore { key = "gO";  })
          (whichKeyIgnore { key = "gra"; })
          (whichKeyIgnore { key = "gri"; })
          (whichKeyIgnore { key = "grn"; })
          (whichKeyIgnore { key = "grr"; })
          (whichKeyIgnore { key = "grt"; })
          (whichKeyIgnore { key = "g#";  })
          (whichKeyIgnore { key = "g%";  })
          (whichKeyIgnore { key = "g*";  })
          (whichKeyIgnore { key = "g~";  })
        ];
      };
    };
  };
}
