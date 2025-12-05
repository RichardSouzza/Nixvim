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
  };
}
