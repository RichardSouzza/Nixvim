{
  plugins = {
    leap.enable = true;
  };

  extraConfigLua = builtins.readFile ./extra_config.lua;

  keymaps = [
    {
      action = "<Plug>(leap-from-window)";
      mode = [ "n" "o" "x" ];
      key = "gs";
      options = {
        desc = "Leap from windows";
      };
    }
    {
      action = "<Plug>(leap-forward)";
      mode = [ "n" "o" "x" ];
      key = "s";
      options = {
        desc = "Leap forward";
      };
    }
    {
      action = "<Plug>(leap-backward)";
      mode = [ "n" "o" "x" ];
      key = "S";
      options = {
        desc = "Leap backward";
      };
    }
  ];
}
