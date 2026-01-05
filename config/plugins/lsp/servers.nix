{ pkgs, ... }:

{
  globals = {
    OmniSharp_server_use_mono = 1;
  };

  plugins = {
    lsp.servers = {
      csharp_ls.enable = false;  # C#

      cssls.enable = true;       # CSS

      dockerls.enable = true;    # Docker

      emmylua_ls.enable = true;  # Lua

      gopls.enable = true;       # Go

      html.enable = true;        # HTML

      jsonls.enable = true;      # JavaScript

      nixd = {                   # Nix
        enable = true;
        cmd = [ "nixd" "--inlay-hints=false" "--semantic-tokens" ];
      };

      omnisharp = {              # C#
        enable = false;
        settings = {
          enable_import_completion = true;
          enable_roslyn_analyzers = true;
          organize_imports_on_format = true;
        };
      };

      ruff.enable = true;        # Python

      sqlls = {                  # SQL
        enable = true;
        package = pkgs.sqls;
      };

      tailwindcss.enable = true; # Tailwind CSS

      ts_ls = {                  # TypeScript
        enable = true;
        settings = {
          completions = {
            completeFunctionCalls = true;
          };

          javascript = {
            format.enable = false;
            inlayHints = {
              parameterNames.enabled = "all";
              parameterTypes.enabled = true;
              variableTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              functionLikeReturnTypes.enabled = true;
              enumMemberValues.enabled = true;
            };
          };

          typescript = {
            inlayHints = {
              parameterNames.enabled = "all";
              parameterTypes.enabled = true;
              variableTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              functionLikeReturnTypes.enabled = true;
              enumMemberValues.enabled = true;
            };
          };
        };
      };

      yamlls.enable = true;    # Yaml
    };
  };
}
