{
  plugins = {
    windsurf-nvim = {
      enable = true;
      settings = {
        enable_chat = true;
        enable_cmp_source = true;
        workspace_root = {
          use_lsp = true;
        };
        # key_bindings = {
        #   next = "<Tab>";
        #   prev = "<C-[>";
        # };
      };
    };
  };
}
