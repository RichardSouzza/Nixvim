{ pkgs, ... }:

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
  };

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

  filetype = {
    extension = {
      cshtml = "razor";
      razor = "razor";
    };
  };
}
