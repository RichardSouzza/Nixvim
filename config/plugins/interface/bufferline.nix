{
  plugins = {
    bufferline = {
      enable = true;

      settings = {
        highlights.buffer_selected.italic = false;

        options = {
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
