{ pkgs, ... }:

{
  viAlias = true;
  vimAlias = true;

  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };

  extraConfigLua = builtins.readFile ./extra_config.lua;

  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };

    combinePlugins = {
      enable = true;
      standalonePlugins = with pkgs.vimPlugins; [
        nvim-treesitter
      ];
    };
  };

  opts = {
    expandtab = true;      # Use the appropriate number of spaces to insert a tab
    relativenumber = true; # Side relative numbers
    scrolloff = 1000;      # Centers the cursor in the buffer during navigation
    showmode = false;      # Disables in favor of Lualine
    shiftwidth = 2;        # Number of columns used for autoindent
    smartcase = true;      # Ignore case only when the search pattern contains uppercase characters
    smartindent = true;    # Do smart autoindenting when starting a new line
    smoothscroll = true;   # Smooth scroll
    swapfile = false;      # Disable swapfiles
    tabstop = 4;           # Width of a tab character
    termguicolors = true;  # Enables support for 24-bit RGB color
    winborder = "rounded"; # Default border style of floating windows
    wrap = false;          # Do not wrap the text
  };
}
