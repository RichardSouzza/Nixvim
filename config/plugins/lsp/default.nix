{ pkgs, ... }:

{
  imports = [
    ./keymaps.nix
    ./servers.nix
  ];

  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
    };

    lspsaga = {
      enable = true;
      settings = {
        codeAction = {
          keys = {
            exec = "<CR>";
            quit = [ "<Esc>" "q" ];
          };
        };
        implement.enable = false;
        lightbulb.enable = false;
        symbol_in_winbar.enable = false; # Breadcrumbs
      };
    };

    refactoring = {
      enable = true;
      package = pkgs.vimPlugins.refactoring-nvim.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          mkdir $out/after
          mv $out/{queries,after/queries}
        '';
      });
    };
  };
}
