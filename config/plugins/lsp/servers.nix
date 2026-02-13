{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
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

      nixd = {                   # Nix
        enable = true;
        cmd = [ "nixd" "--inlay-hints=false" "--semantic-tokens" ];
      };

      pyright = {                # Python
        enable = true;
        settings = {
          python = {
            analysis = {
              diagnosticMode = "workspace";
            };
          };
        };
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

      sqls = {                   # SQL
        enable = false;
      };

      tailwindcss.enable = true; # Tailwind CSS

      taplo.enable = true;       # TOML

      ts_ls = {                  # JavaScript / TypeScript
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

      vale_ls = {           # Spell
        enable = true;
      };

      yamlls.enable = true; # Yaml
    };

    easy-dotnet = {         # C#
      enable = false;
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

    flutter-tools = {
      enable = true;
    };

    roslyn.enable = true;

    # rzls.enable = true;
  };

  extraPlugins = [
    (buildVimPlugin {
      pname = "mssql.nvim";
      version = "0-unstable-2025-10-23";
      src = fetchFromGitHub {
        owner = "Kurren123";
        repo = "mssql.nvim";
        rev = "d3d3078b42988ae90b9d0a17d7bdb44b1b6d18e3";
        hash = "sha256-/jG3xSfvWqK8KbpnCOz4xvZc1+dkyJzMFQFl30VKwYk=";
      };
      nvimSkipModule = [
        "mssql"
        "mssql.default_opts"
        "mssql.display_query_results"
        "mssql.find_object"
        "mssql.interface"
        "mssql.query_manager"
        "mssql.tools_downloader"
        "mssql.utils"
        "runtests"
      ];
      meta = {
        homepage = "https://github.com/Kurren123/mssql.nvim";
        license = lib.licenses.unlicense;
      };
    })
  ];
}
