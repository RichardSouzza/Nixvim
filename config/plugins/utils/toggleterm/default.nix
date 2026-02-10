{
  imports = [
    ./keymaps.nix
  ];

  plugins = {
    floaterm = {
      enable = true;
    };

    toggleterm = {
      enable = true;
      settings = {
        size = ''
          function(term)
            if term.direction == "horizontal" then
              return 16
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.4
            end
          end
        '';
      };
    };
  };

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
