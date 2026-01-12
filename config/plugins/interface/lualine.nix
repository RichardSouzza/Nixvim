{ pkgs, ... }:

let
  breadcrumbs = {
    __raw = ''
      function()
        return require('lspsaga.symbol.winbar').get_bar()
      end
    '';
  };
  isNeoTree = {
    __raw = ''
      function()
        return vim.bo.filetype == 'neo-tree'
      end
    '';
  };
  isNotNeoTree = {
    __raw = ''
      function()
        return vim.bo.filetype ~= 'neo-tree'
      end
    '';
  };
  linesSelected = {
    __raw = ''
      -- https://github.com/sirfz/dotvim/blob/db6f47c37a5286ddd878edd32ad060fea5584201/lua/plugins/lualine.lua#L60-L66
      function()
        local starts = vim.fn.line("v")
        local ends = vim.fn.line(".")
        local count = starts <= ends and ends - starts + 1 or starts - ends + 1
        local wc = vim.fn.wordcount()
        return count .. ":" .. wc["visual_chars"]
      end
    '';
  };
  linesSelectedCond = {
    __raw = ''
      function()
        return vim.bo.filetype ~= 'neo-tree' and vim.fn.mode():find("[Vv]") ~= nil
      end
    '';
  };

in
{
  plugins = {
    lualine = {
      enable = true;
      package = pkgs.vimPlugins.lualine-nvim.overrideAttrs (old: {
        postInstall = ''
          rm -f $out/lua/lualine/themes/ayu.lua
          rm -f $out/lua/lualine/themes/onedark.lua
        '';
      });

      settings = {
        sections = {
          lualine_a = [
            { __unkeyed-1 = "mode"; cond = isNotNeoTree; }
          ];

          lualine_b = [
            { __unkeyed-1 = "branch";      cond = isNotNeoTree; }
            { __unkeyed-1 = "diff";        cond = isNotNeoTree; }
            { __unkeyed-1 = "diagnostics"; cond = isNotNeoTree; }
          ];

          lualine_c = [
            { __unkeyed-1 = "branch";    cond = isNeoTree;    }
            { __unkeyed-1 = breadcrumbs; cond = isNotNeoTree; }
          ];

          lualine_x = [
            { __unkeyed-1 = "location"; cond = isNeoTree;    }
            { __unkeyed-1 = "encoding"; cond = isNotNeoTree; }
          ];

          lualine_y = [
            { __unkeyed-1 = "filetype";    cond = isNotNeoTree;      }
            { __unkeyed-1 = "lsp_status";  cond = isNotNeoTree;      }
            { __unkeyed-1 = linesSelected; cond = linesSelectedCond; }
          ];

          lualine_z = [
            { __unkeyed-1 = "location"; cond = isNotNeoTree; }
          ];
        };

        inactive_sections = {
          lualine_c = [
            { __unkeyed-1 = "filename"; cond = isNotNeoTree; }
          ];

          lualine_x = [
            { __unkeyed-1 = "location"; cond = isNotNeoTree; }
          ];
        };
      };
    };
  };
}
