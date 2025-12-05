{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        default_format_opts = {
          lsp_format = "fallback";
        };

        format_on_save = builtins.readFile ./format_on_save.lua;

        format_after_save = {
          lsp_format = "fallback";
        };

        formatters_by_ft = {
          "*" = [ "trim_newlines" "trim_whitespace" ];
          "_" = [ "trim_newlines" "trim_whitespace" ];
          lua = [ "stylua" ];
          sql = [ "sqlfluff" ];
        };

        formatters = {
          sqlfluff = {
            command = "sqlfluff";
            args = [ "fix" "-" ];
            stdin = true;
          };
        };

        log_level = "debug";
        notify_no_formatters = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "gw";
      action.__raw = ''
        function()
        require("conform").format({ async = true, lsp_fallback = true })
        end
        '';
      options = {
        desc = "Format";
      };
    }
  ];

  # xdg.homeFile.".sqlfluff".source = ./sqlfluff.toml;
}
