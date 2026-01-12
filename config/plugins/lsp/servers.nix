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

      roslyn_ls = {              # C#
        enable = false;
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
              enumMemberValues.enabled = true;
              functionLikeReturnTypes.enabled = true;
              parameterNames.enabled = "all";
              parameterTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              variableTypes.enabled = true;
            };
          };

          typescript = {
            inlayHints = {
              enumMemberValues.enabled = true;
              functionLikeReturnTypes.enabled = true;
              parameterNames.enabled = "all";
              parameterTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              variableTypes.enabled = true;
            };
            suggest = {
              completeFunctionCalls = true;
            };
            updateImportsOnFileMove = { enabled = "always"; };
          };
        };
      };

      yamlls.enable = true; # Yaml
    };

    easy-dotnet = {         # C#
      enable = true;
      settings = {
        get_sdk_path.__raw = ''
          function()
            local sdk_version = vim.trim(vim.fn.system("dotnet --version"))
            local sdk_list = vim.trim(vim.fn.system("dotnet --list-sdks"))
            local base = nil
            for line in sdk_list:gmatch("[^\n]+") do
              if line:find(sdk_version, 1, true) then
                base = vim.fs.normalize(line:match("%[(.-)%]"))
                break
              end
            end
            local sdk_path = polyfills.fs.joinpath(base, sdk_version):gsub("Program Files", '"Program Files"')
            return sdk_path
          end
        '';
        lsp = {
          enabled = true;
          roslynator_enabled = true;
        };
        picker = "snacks";
      };
    };

    # roslyn.enable = true;

    # rzls.enable = true;
  };
}
