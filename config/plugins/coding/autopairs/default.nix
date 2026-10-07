{
  plugins = {
    nvim-autopairs = {
      enable = true;
      settings = {
        fast_wrap.chars = [ "{" "[" "(" "\"" "'" "`"  "─" ];
      };
    };
  };

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
