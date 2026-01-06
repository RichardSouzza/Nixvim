{ pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

  buffers = [ "all" "Float" "FloatBorder" "NormalFloat" "Pmenu" ];
  lualine = [ "lualine" ];
  neotree = [ "CursorLine" ];

in
{
  plugins = {
    colorful-menu.enable = true;

    colorizer = {
      enable = true;
      settings = {
        user_default_options.names = false; # No highlight for color names
      };
    };

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

    noice = {
      enable = true;
      settings = {
        cmdline.format = {
          help = {
            pattern = [ "^:%s*he?l?p?%s+" "^:%s*FloatingHelp%s+" ];
          };
        };
      };
    };

    render-markdown = {
      enable = true;
      settings = {
        anti_conceal = {
          enabled = false;
          disabled_modes = [ "n" "c" "v" ];
        };
        heading = {
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

    smear-cursor.enable = true;

    tiny-glimmer.enable = true;

    transparent = {
      enable = true;
      settings = {
        exclude_groups = neotree;
        extra_groups = buffers ++ lualine;
      };
    };
  };

  extraConfigLua = ''
    require("cinnamon").setup({
      keymaps = {
          basic = true,
          extra = false,
      },
      options = {
        mode = "cursor",
        max_delta = {
         time = 250
        },
      },
    })

    require("satellite").setup({
      show_always = true,
      excluded_buftypes = {
       "nofile",
       "popup",
       "prompt",
       "scratch",
       "terminal"
      }
    })

    require("scrollEOF").setup({
      insert_mode = false
    })
  '';

  extraPlugins = [
    # (buildVimPlugin {
    #   pname = "hover";
    #   version = "2025-12-12";
    #   src = fetchFromGitHub {
    #     owner = "lewis6991";
    #     repo = "hover.nvim";
    #     rev = "main";
    #     hash = "sha256-TrBzF/jj4Q014Lhi/B9Bev+oTXTnh37lFltbdosNQ64=";
    #   };
    # })
    (buildVimPlugin {
      pname = "cinnamon";
      version = "2024-08-06";
      src = fetchFromGitHub {
        owner = "declancm";
        repo = "cinnamon.nvim";
        rev = "master";
        hash = "sha256-kccQ4iFMSQ8kvE7hYz90hBrsDLo7VohFj/6lEZZiAO8=";
      };
    })
    (buildVimPlugin {
      pname = "satellite";
      version = "2025-12-19";
      src = fetchFromGitHub {
        owner = "RichardSouzza";
        repo = "satellite.nvim";
        rev = "main";
        hash = "sha256-8HJ/FfyfXIOjAUXNKuGF+21PTsbVnh8fvBoqpOeyxkQ=";
      };
    })
    (buildVimPlugin {
      pname = "scrollEOF";
      version = "2025-09-14";
      src = fetchFromGitHub {
        owner = "Aasim-A";
        repo = "scrollEOF.nvim";
        rev = "master";
        hash = "sha256-y7yOCRSGTtQcFyWVkGe3xQqstHZMQKayxtqkOVlZ4PM=";
      };
    })
  ];
}
