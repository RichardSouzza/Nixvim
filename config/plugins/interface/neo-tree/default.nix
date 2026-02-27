let
  luaCmd = cmd: "function() ${cmd} end";
  vimCmd = cmd: "function() vim.cmd('${cmd}') end";

in
{
  imports = [
    ./keymaps.nix
  ];

  plugins = {
    neo-tree = {
      enable = true;
      settings = {
        commands = {
          # https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
          diff_files.__raw = builtins.readFile ./functions/diff_files.lua;
        };

        default_component_configs = {
          container = {
            right_padding = 1;
          };

          diagnostics = {
            diag_sort_function = "severity";
            refresh = {
              delay = 100;
              event = "vim_diagnostic_changed";
              max_items = 10000;
            };
            show_unloaded = true;
            symbols = {
              error = "E";
              hint  = "";
              info  = "";
              warn  = "";
            };
          };

          git_status = {
            symbols = {
              added     = " ";
              modified  = " ";
              deleted   = "󰅖";
              renamed   = "󰁕";
              untracked = "?";
              ignored   = "";
              unstaged  = "󰄱";
              staged    = "";
              conflict  = "";
            };
          };

          name = {
            handler.__raw = builtins.readFile ./functions/color_folders.lua;
          };
        };

        filesystem = {
          components = {
            name = {
              __raw = builtins.readFile ./functions/filesystem_name.lua;
            };
          };
          enable_refresh_on_write = true;
          follow_current_file.enabled = true;
          sort_case_insensitive = true;
          sort_function.__raw = builtins.readFile ./functions/natural_sort.lua;
          window.mappings = {
            "F" = "filter_as_you_type";
          };
        };

        sources = [
          "filesystem"
          "buffers"
          "git_status"
          "document_symbols"
        ];

        window = {
          mappings = {
            "c".__raw = luaCmd "Snacks.picker.grep({ regex = false })";
            "e".__raw = builtins.readFile ./functions/return_from_neotree.lua;
            "f".__raw = luaCmd "Snacks.picker.files({ hidden = true })";
            "g".__raw = luaCmd "Snacks.lazygit.open()";
            "/".__raw = luaCmd "Snacks.picker.files({ hidden = true })";
            "D"          = "diff_files";
            "<A-up>"     = "close_node";
            "<A-S-up>"   = "close_all_nodes";
            "<A-down>"   = "expand_all_subnodes";
            "<A-S-down>" = "expand_all_nodes";
          };
          width = 42;
        };
      };
    };
  };

  extraConfigLua = builtins.readFile ./functions/highlights.lua;
}
