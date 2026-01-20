{
  plugins = {
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          markdownlint = {
            enable = true;
            settings.extra_args = [
              "-c" "~/.config/markdownlint/.markdownlint.yaml"
            ];
          };
        };
      };
    };
  };
}
