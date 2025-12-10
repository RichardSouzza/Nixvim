{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

in
{
  plugins = {
    guess-indent.enable = true;


    nvim-autopairs = {
      enable = true;
      settings = {
        fast_wrap.chars = [ "{" "[" "(" "\"" "'" "`"  "─" ];
      };
    };

    trim.enable = true;

    ts-autotag.enable = true;
  };

  extraConfigLua = builtins.readFile ./extra_config.lua;

  extraPlugins = [
    (buildVimPlugin {
      pname = "visual-surround";
      version = "1.0.1";
      src = fetchFromGitHub {
        owner = "NStefan002";
        repo = "visual-surround.nvim";
        rev = "v1.0.1";
        hash = "sha256-R1IuhysQODTJtJYETsWk/23/EWud7hphVM5ufKVUowU=";
      };
    })
  ];

}
