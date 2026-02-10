{ pkgs, ... }:

# let
#   packages = pkgs.callPackage ./packages.nix {};
#   nvimPython = packages.nvimPython;
#
# in
{
  viAlias = true;
  vimAlias = true;

  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };

  diagnostic.settings = {
     virtual_lines = {
       only_current_line = true;
     };
     virtual_text = false;
  };

  globals = {
    mapleader = " ";
    maplocalleader = ''\'';
    # python3_host_prog = "${nvimPython}/bin/python";
    # vimspector_install_gadgets = [
    #   "debugpy"
    #   "vscode-cpptools"
    #   "CodeLLDB"
    # ];
  };

  extraConfigLua = builtins.readFile ./extra_config.lua;

  # extraPackages = [
  #   nvimPython
  # ];

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
        friendly-snippets
      ];
    };
  };

  opts = {
    autoindent = true;        # Basic automatic indentation
    confirm = true;           # Ask for confirmation instead of failing
    cursorline = true;        # Highlight the current line
    cursorlineopt = "number"; # Highlight the line number of the cursor
    expandtab = true;         # Use spaces instead of tabs
    foldmethod = "indent";    # Create folds based on indentation
    foldlevelstart = 99;      # No closed folds when starting the buffer
    ignorecase = true;        # Case-insensitive search by default
    number = true;            # Current line number
    relativenumber = true;    # Side relative numbers
    scrolloff = 1000;         # Keep cursor vertically centered
    shiftwidth = 2;           # Size of an indent step
    shortmess = "ltToOCFS";   # Disables the search count (+= S)
    showmode = false;         # Disables in favor of Lualine
    sidescrolloff = 20;       # Keep 20 columns of horizontal spacing between the cursor and the margin
    signcolumn = "yes";       # Always show sign column
    smartcase = true;         # Override ignorecase if the search pattern contains uppercase
    smoothscroll = true;      # Smooth scroll
    softtabstop = 2;          # Number of spaces inserted when pressing <Tab>
    splitbelow = true;        # Horizontal splits open below
    splitright = true;        # Vertical splits open to the right
    swapfile = false;         # Disable swapfiles
    tabstop = 2;              # Width of a tab character
    termguicolors = true;     # Enable support for 24-bit RGB color
    undofile = true;          # Persistent undo
    virtualedit = "block";    # Allow virtual editing in Visual block mode
    winborder = "rounded";    # Default border style of floating windows
    wrap = false;             # Do not wrap the text
    fillchars = {
      eob = " ";
      fold = " ";
    };
  };

  filetype = {
    extension = {
      cshtml = "razor";
      razor = "razor";
    };
  };
}
