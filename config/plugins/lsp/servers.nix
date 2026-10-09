{ lib, pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub fetchgit;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  globals = {
    OmniSharp_server_use_mono = 1;
  };

  plugins = {
    lsp.servers = {

      basedpyright = {           # Python
        enable = true;
        settings = {
          basedpyright = {
            analysis = {
              autoImportCompletions = true;
              diagnosticMode = "workspace";
              inlayHints = {
                callArgumentNames = true;
                callArgumentNamesMatching = true;
                genericTypes = true;
                variableTypes = false;
              };
              typeCheckingMode = "basic";
            };
          };
        };
      };

      csharp_ls.enable = false;  # C#

      cssls.enable = true;       # CSS

      dockerls.enable = true;    # Docker

      emmylua_ls.enable = true;  # Lua

      gopls.enable = true;       # Go

      html.enable = true;        # HTML

      jdtls.enable = true;       # Java

      marksman.enable = true;    # Markdown

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

      sqls = {                   # SQL
        enable = true;
      };

      taplo.enable = true;       # TOML

      yamlls.enable = true;      # Yaml
    };

    easy-dotnet = {              # C#
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

    flutter-tools = {                     # Dart
      enable = true;
    };

    rustaceanvim = {                      # Rust
      enable = true;
    };

    roslyn.enable = false;

    # rzls.enable = true;

    typescript-tools = {                  # JavaScript / TypeScript
      enable = true;

      settings = {
        publish_diagnostic_on = "insert_leave";
        separate_diagnostic_server = true;

        tsserver_file_preferences = {
          includeInlayEnumMemberValueHints         = true;
          includeInlayFunctionLikeReturnTypeHints  = true;
          includeInlayParameterNameHints           = "all";
          includeInlayParameterTypeHints           = true;
          includeInlayPropertyDeclarationTypeHints = true;
          includeInlayVariableTypeHints            = true;
          includeInlayFunctionParameterTypeHints   = true;

          importModuleSpecifierPreference = "non-relative";
          updateImportsOnFileMove         = "always";

          includeCompletionsWithSnippetText        = true;
          includeCompletionsWithInsertText         = true;
        };

        tsserver_format_options = {
          allowIncompleteCompletions    = false;
          insertSpaceAfterCommaDelimiter = true;
        };

        expose_as_code_action = [ "fix_all" "add_missing_imports" "remove_unused_imports" ];

        typescript = {
          format.enable = false;
          suggest.completeFunctionCalls = true;
        };

        javascript = {
          format.enable = false;
          suggest.completeFunctionCalls = true;
        };
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvim-lsp-file-operations

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
