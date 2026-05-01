{
  plugins = {
    bufferline = {
      enable = true;

      settings = {
        highlights.buffer_selected.italic = false;

        options = {
          custom_filter = ''
            function(bufnr)
              local arrow_files = vim.g.arrow_filenames or {}
              if #arrow_files == 0 then
                return true
              end

              local bufname = vim.api.nvim_buf_get_name(bufnr)
              if bufname == "" then
                return false
              end

              local bufpath = vim.fn.fnamemodify(bufname, ":p")

              for _, file in ipairs(arrow_files) do
                local full = vim.fn.fnamemodify(file, ":p")
                if full == bufpath then
                  return true
                end
              end

              return false
            end
          '';

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
        };
      };
    };

    snacks.settings.bufdelete.enabled = true;
  };

  keymaps = [
    {
      action = "<CMD>lua Snacks.bufdelete()<CR>";
      key = "<S-q>";
      mode = "n";
      options = {
        desc = "Close buffer";
        silent = true;
      };
    }
    {
      action = "<CMD>BufferLineCycleNext<CR>";
      key = "<S-tab>";
      mode = "n";
      options = {
        desc = "Next buffer";
        silent = true;
      };
    }
    {
      action = "<CMD>BufferLineCyclePrev<CR>";
      key = "<A-S-tab>";
      mode = "n";
      options = {
        desc = "Next buffer";
        silent = true;
      };
    }
    {
      action = "<CMD>lua Snacks.bufdelete.other()<CR>";
      key = "<A-S-q>";
      mode = "n";
      options = {
        desc = "Close buffer";
        silent = true;
      };
    }
  ];
}
