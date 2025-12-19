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

    colorizer.enable = true;


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
        indent.enable = true;
      };
    };
  };
}
