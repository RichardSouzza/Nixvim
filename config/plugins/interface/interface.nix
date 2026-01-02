{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

  buffers = [
    "all"
    "Float"
    "FloatBorder"
    "NormalFloat"
    "Pmenu"
  ];
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
