{
  plugins = {
    edgy = {
      enable = true;
      settings = {
        animate.enabled = false;
        left = [
          {
            ft = "neo-tree";
            title = "Neotree";
            filter = ''
              function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
              end
            '';
            wo = {
              winbar = false;
              winhighlight = "";
            };
          }
          {
            ft = "neo-tree";
            title = "Neotree Git";
            filter = ''
              function(buf)
                return vim.b[buf].neo_tree_source == "git_status"
              end
            '';
            wo = {
              winbar = false;
              winhighlight = "";
            };
          }
          {
            ft = "neo-tree";
            title = "Neotree Buffers";
            filter = ''
              function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
              end
            '';
            wo = {
              winbar = false;
              winhighlight = "";
            };
          }
        ];
        bottom = [
          {
            ft = "toggleterm";
            title = "Terminal";
            filter = ''
              function(buf, win)
                return vim.api.nvim_win_get_config(win).relative == ""
              end
            '';
            wo = {
              winhighlight = "";
            };
          }
          {
            ft = "trouble";
            wo = {
              winbar = false;
              winhighlight = "";
            };
          }
        ];
        options = {
          left = {
            size = 42;
          };
          bottom = {
            size = 16;
          };
        };
        icons = {
          closed = "";
          open = "";
        };
      };
    };
  };
}
