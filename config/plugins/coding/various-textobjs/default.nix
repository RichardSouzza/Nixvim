{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins;  [
    nvim-various-textobjs
  ];

  extraConfigLua = builtins.readFile ./extra_config.lua;
}
