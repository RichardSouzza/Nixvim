{
  plugins = {
    snacks = {
      enable = true;
      settings = {
        health.enabled = true;
        input.enabled = true;
        lazygit.enabled = true;
        notifier.enabled = true;
        notify.enable = true;
        picker.enabled = true;
        quickfile.enabled = true;
        scratch.enabled = true;
      };
    };
  };

  keymaps = [
    {
      action = "<CMD>lua Snacks.picker.lines({ layout = { preset = 'select' } })<CR>";
      key = "/";
      mode = "n";
      options = {
        desc = "Search line";
        silent = true;
      };
    }
    {
      action = "<CMD>lua Snacks.picker.grep({ regex = false })<CR>";
      key = "gc";
      mode = "n";
      options = {
        desc = "Search code";
        silent = true;
      };
    }
    {
      action = "<CMD>lua Snacks.picker.files({ hidden = true })<CR>";
      key = "gf";
      mode = "n";
      options = {
        desc = "Search file";
        silent = true;
      };
    }
    {
      action = "<CMD>lua Snacks.lazygit.open()<CR>";
      key = "gg";
      mode = "n";
      options = {
        desc = "Open Lazygit";
      };
    }
  ];
}
