{
  imports = [
    ./keymaps.nix
  ];

  plugins = {
    bufferline = {
      enable = true;

      settings = {
        highlights.buffer_selected.italic = false;

        options = {
          custom_filter.__raw = builtins.readFile ./functions/custom_filter.lua;

          diagnostics = "nvim_lsp";

          diagnostics_indicator.__raw = ''
            function(count, level, diagnostics_dict, context)
              local icon = level:match("error") and "󱈸 " or ""
              return icon
            end
          '';

          name_formatter.__raw = builtins.readFile ./functions/name_formatter.lua;

          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              text_align = "center";
              separator = true;
            }
            {
              filetype = "snacks_picker_list";
            }
          ];

          separator_style = "padded";
        };
      };
    };

    snacks.settings.bufdelete.enabled = true;
  };
}
