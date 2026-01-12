{ pkgs, ... }:

{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;

      settings = {
        auto_install = false;
        highlight.enable = true;
      };
    };
  };

  extraFiles = {
    "after/queries/c_sharp/injections.scm".source = ./queries/c_sharp.scm;
    "after/queries/markdown/injections.scm".source = ./queries/markdown.scm;
    "after/queries/nix/injections.scm".source = ./queries/nix.scm;
  };
}
