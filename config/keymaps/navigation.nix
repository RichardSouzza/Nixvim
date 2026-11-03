{
  extraConfigLuaPre = ''
    package.preload['config.keymaps.navigation'] = function()
      ${builtins.readFile ./lua/navigation.lua}
    end
  '';

  keymaps = [
    {
      mode = "n";
      key = "<Up>";
      action = "gk";
      options.desc = "Move up by one display line";
    }
    {
      mode = "n";
      key = "<Down>";
      action = "gj";
      options.desc = "Move down by one display line";
    }
    {
      mode = "n";
      key = "gF";
      action = "<CMD>edit <cfile><CR>";
      options.desc = "Go to file under cursor";
    }
    {
      mode = "n";
      key = "go";
      action = "<CMD>vertical wincmd f<CR>";
      options.desc = "Opens link under cursor (new buffer)";
    }
    {
      mode = "n";
      key = "gT";
      action = "gT";
      options.desc = "Go to previous tab page";
    }
    {
      mode = "n";
      key = "gv";
      action = "gv";
      options.desc = "Last visual selection";
    }
    {
      mode = "n";
      key = "gx";
      action = "gx";
      options.desc = "Opens link under cursor (sys handler)";
    }
    {
      mode = "n";
      key = "g,";
      action = "g,";
      options.desc = "Go to newer position in change list";
    }
    {
      mode = "n";
      key = "g;";
      action = "g;";
      options.desc = "Go to older position in change list";
    }
    {
      mode = [ "v" "o" ];
      key = "<BS>";
      action = "k";
      options = {
        desc = "Go up";
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<BS>";
      action.__raw = "function() require('config.keymaps.navigation').smart_jump('k') end";
      options.desc = "Go up";
    }
    {
      mode = "n";
      key = "<CR>";
      action.__raw = "function() require('config.keymaps.navigation').smart_jump('j') end";
      options.desc = "Go down";
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<Home>";
      action.__raw = "function() require('config.keymaps.navigation').smart_home() end";
      options.desc = "Switches the cursor position between ^ and 0";
    }
    {
      mode = "n";
      key = "<S-b>";
      action = "ge";
      options.desc = "Prev end of word";
    }
    {
      mode = "n";
      key = "<S-w>";
      action = "e";
      options = {
        desc = "Next end of word";
        remap = false;
      };
    }
    {
      mode = "n";
      key = "<S-Left>";
      action = "<C-o>";
      options.desc = "Jump back";
    }
    {
      mode = "n";
      key = "<S-Right>";
      action = "<C-i>";
      options.desc = "Jump forward";
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Up>";
      action = "<C-u>";
      options = {
        desc = "Scroll up (smooth)";
        remap = true;
      };
    }
    {
      mode = [ "n" "v" "i" ];
      key = "<S-Down>";
      action = "<C-d>";
      options = {
        desc = "Scroll down (smooth)";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<S-ScrollWheelUp>";
      action = "<ScrollWheelLeft>";
      options.desc = "Scroll left";
    }
    {
      mode = "n";
      key = "<S-ScrollWheelDown>";
      action = "<ScrollWheelRight>";
      options.desc = "Scroll right";
    }
  ];
}
