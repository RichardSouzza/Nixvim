{ pkgs, ... }:

let
  breadcrumbs = {
    __raw = ''
      function()
        local ok, saga = pcall(require, "lspsaga.symbol.winbar")
        if not ok then
          return vim.fn.expand("%:t")
        end

        local bar = saga.get_bar()

        if bar == nil or bar == "" then
          return vim.fn.expand("%:t")
        end

        return bar
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
  wakatime = {
    __raw = ''
      function()
        local output = vim.fn.execute("WakaTimeToday")
        output = output:gsub("\n", "")
        return output
      end
    '';
  };
  wakatime2 = {
    __raw = ''
      function()
        local result = vim.api.nvim_exec3("WakaTimeToday", { output = true })
        local output = result.output

        if not output or output == "" then
          return ""
        end

        output = output:gsub("\n", "")

        return output
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
            { __unkeyed-1 = "mode"; }
          ];

          lualine_b = [
            { __unkeyed-1 = "branch";    }
            { __unkeyed-1 = breadcrumbs; }
          ];

          lualine_c = [
            { __unkeyed-1 = ""; }
          ];

          lualine_x = [
            { __unkeyed-1 = "encoding"; }
            { __unkeyed-1 = "get_wakatime_time"; }
          ];

          lualine_y = [
            { __unkeyed-1 = "diff";        }
            { __unkeyed-1 = "diagnostics"; }
            { __unkeyed-1 = "lsp_status";  }
            { __unkeyed-1 = "searchcount"; }
            { __unkeyed-1 = linesSelected; cond = linesSelectedCond; }
          ];

          lualine_z = [
            { __unkeyed-1 = "location"; }
          ];
        };
      };
    };
  };

  extraConfigLua = builtins.readFile ./wakatime.lua;
}
