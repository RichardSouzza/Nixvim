{ pkgs, ... }:

{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;

      settings = {
        auto_install = false;
        highlight = {
          enable = true;
          use_languagetree = true;
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            node_incremental = "v";
            node_decremental = "V";
          };
        };
      };
    };
  };

  extraFiles = {
    "after/queries/c_sharp/injections.scm".source = ./queries/c_sharp.scm;
    "after/queries/markdown/injections.scm".source = ./queries/markdown.scm;
    "after/queries/nix/injections.scm".source = ./queries/nix.scm;
  };
}
