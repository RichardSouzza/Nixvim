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
    autoindent = true;        # Basic automatic indentation
    confirm = true;           # Ask for confirmation instead of failing
    cursorline = true;        # Highlight the current line
    cursorlineopt = "number"; # Highlight the line number of the cursor
    expandtab = true;         # Use spaces instead of tabs
    foldmethod = "indent";    # Creates folds based on indentation
    foldlevelstart = 99;      # No closed folds when starting the buffer
    ignorecase = true;        # Case-insensitive search by default
    relativenumber = true;    # Side relative numbers
    scrolloff = 1000;         # Keep cursor vertically centered
    shiftwidth = 2;           # Size of an indent step
    showmode = false;         # Disables in favor of Lualine
    sidescrolloff = 1000;     # Keep cursor vertically centered while scrolling
    signcolumn = "yes";       # Always show sign column
    smartcase = true;         # Override ignorecase if the search pattern contains uppercase
    smoothscroll = true;      # Smooth scroll
    softtabstop = 2;          # Number of spaces inserted when pressing <Tab>
    splitbelow = true;        # Horizontal splits open below
    splitright = true;        # Vertical splits open to the right
    swapfile = false;         # Disable swapfiles
    tabstop = 2;              # Width of a tab character
    termguicolors = true;     # Enables support for 24-bit RGB color
    undofile = true;          # Persistent undo
    virtualedit = "block";    # Allow virtual editing in Visual block mode
    winborder = "rounded";    # Default border style of floating windows
    wrap = false;             # Do not wrap the text
    fillchars = {
      eob = " ";
    };
  };
}
