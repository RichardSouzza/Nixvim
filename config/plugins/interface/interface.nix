{ lib, pkgs, ... }:

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

    transparent = {
      enable = true;
      settings = {
        exclude_groups = neotree;
        extra_groups = buffers ++ lualine;
      };
    };

    treesitter = {
      enable = true;
      settings = {
        auto_install = false;
        ensure_installed = [
          "astro" "bash" "c_sharp" "css" "csv"
          "html" "hyprlang" "ini" "java" "javascript"
          "jinja" "jinja_inline" "json" "nix" "python"
          "scss" "sql" "toml" "typescript"
          "tsx" "xml" "yaml"
          # Failed to build:
          # "dockerfile" "lua" "markdown"
          # "markdown_inline" "razor"
        ];
        highlight.enable = true;
      };
    };
  };

  extraConfigLua = ''
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
    (buildVimPlugin {
      pname = "cinnamon.nvim";
      version = "0-unstable-2024-08-06";
      src = fetchFromGitHub {
        owner = "declancm";
        repo = "cinnamon.nvim";
        rev = "450cb3247765fed7871b41ef4ce5fa492d834215";
        hash = "sha256-kccQ4iFMSQ8kvE7hYz90hBrsDLo7VohFj/6lEZZiAO8=";
      };
      meta = {
        homepage = "https://github.com/declancm/cinnamon.nvim";
        license = lib.licenses.mit;
      };
    })
    (buildVimPlugin {
      pname = "satellite.nvim";
      version = "0-unstable-2026-02-02";
      src = fetchFromGitHub {
        owner = "RichardSouzza";
        repo = "satellite.nvim";
        rev = "3b4ca5faeda69cdde033842bd30ccdb12faae902";
        hash = "sha256-4eI+RpvLAR8l/taibIUuWNi4vQTTw0KfLO0ZfWBN2Do=";
      };
      meta = {
        homepage = "https://github.com/RichardSouzza/satellite.nvim";
        license = lib.licenses.mit;
      };
    })
    (buildVimPlugin {
      pname = "sunglasses.nvim";
      version = "0-unstable-2025-01-13";
      src = fetchFromGitHub {
        owner = "miversen33";
        repo = "sunglasses.nvim";
        rev = "1e4c4ea4d6b46124090df1d35426a705cb3b99cf";
        hash = "sha256-opkdp6kGGQa2BY/zPhDgrnk0nVMDCJXk79U5Pi7Dnh8=";
      };
      meta = {
        homepage = "https://github.com/miversen33/sunglasses.nvim";
        license = lib.licenses.gpl3Only;
      };
    })
    (buildVimPlugin {
      pname = "scrollEOF.nvim";
      version = "0-unstable-2025-09-14";
      src = fetchFromGitHub {
        owner = "Aasim-A";
        repo = "scrollEOF.nvim";
        rev = "e462b9a07b8166c3e8011f1dcbc6bf68b67cd8d7";
        hash = "sha256-y7yOCRSGTtQcFyWVkGe3xQqstHZMQKayxtqkOVlZ4PM=";
      };
      meta = {
        homepage = "https://github.com/Aasim-A/scrollEOF.nvim";
        license = lib.licenses.mit;
      };
    })
  ];
}
