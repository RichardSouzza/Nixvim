{
  extraConfigLuaPre = ''
    package.preload['config.keymaps.windows'] = function()
      ${builtins.readFile ./lua/windows.lua}
    end
  '';

  keymaps = [
    {
      mode = [ "n" "t" "i" ];
      key = "<C-A-Up>";
      action.__raw = "function() require('config.keymaps.windows').focus('k') end";
      options.desc = "Go to the up window";
    }
    {
      mode = [ "n" "t" "i" ];
      key = "<C-A-Down>";
      action.__raw = "function() require('config.keymaps.windows').focus('j') end";
      options.desc = "Go to the down window";
    }
    {
      mode = [ "n" "t" "i" ];
      key = "<C-A-Left>";
      action.__raw = "function() require('config.keymaps.windows').focus('h') end";
      options.desc = "Go to the left window";
    }
    {
      mode = [ "n" "t" "i" ];
      key = "<C-A-Right>";
      action.__raw = "function() require('config.keymaps.windows').focus('l') end";
      options.desc = "Go to the right window";
    }
    {
      mode = "n";
      key = "<A-kPlus>";
      action = "<C-w>>";
      options = {
        remap = true;
        desc = "Increase width";
      };
    }
    {
      mode = "n";
      key = "<A-kMinus>";
      action = "<C-w><";
      options = {
        remap = true;
        desc = "Decrease width";
      };
    }
    {
      mode = "n";
      key = "<A-kMultiply>";
      action = "<C-w>+";
      options = {
        remap = true;
        desc = "Increase height";
      };
    }
    {
      mode = "n";
      key = "<A-kDivide>";
      action = "<C-w>-";
      options = {
        remap = true;
        desc = "Decrease height";
      };
    }
  ];
}
