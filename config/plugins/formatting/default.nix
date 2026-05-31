{ lib, pkgs, ... }:

let
  inherit (lib) concatStrings getExe;
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

in
{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        default_format_opts = {
          lsp_format = "fallback";
        };

        format_on_save = builtins.readFile ./scripts/format_on_save.lua;

        format_after_save = "function() end";

        formatters_by_ft = {
          "*"             = [ "trim_newlines" "trim_whitespace"     ];
          "_"             = [ "trim_newlines" "trim_whitespace"     ];
          bash            = [ "shfmt"                               ];
          lua             = [ "stylua"                              ];
          java            = [ "astyle"                              ];
          javascript      = [ "biome" "biome-organize-imports"      ];
          javascriptreact = [ "biome" "biome-organize-imports"      ];
          markdown        = [ "injected"                            ];
          python          = [ "ruff_format" "ruff_organize_imports" ];
          sh              = [ "shfmt"                               ];
          sql             = [ "sleek"                               ];
          toml            = [ "taplo"                               ];
          typescript      = [ "biome" "biome-organize-imports"      ];
          typescriptreact = [ "biome" "biome-organize-imports"      ];
          yaml            = [ "yamlfmt"                             ];
        };

        formatters = {
          astyle = {
            command = getExe pkgs.astyle;
          };

          biome = {
            command = getExe pkgs.biome;
          };

          biome-organize-imports = {
            command = getExe pkgs.biome;
          };

          ruff = {
            command = getExe pkgs.ruff;
          };

          shfmt = {
            command = getExe pkgs.shfmt;
          };

          sleek = {
            command = getExe pkgs.sleek;
          };

          stylua = {
            command = getExe pkgs.stylua;
          };

          toml = {
            command = getExe pkgs.taplo;
          };

          yaml = {
            command = getExe pkgs.yamlfmt;
          };
        };

        log_level = "debug";
        notify_no_formatters = true;
      };
    };
  };

  extraConfigLua = concatStrings [
    (builtins.readFile ./scripts/align_tables.lua)
    (builtins.readFile ./scripts/commands.lua)
    (builtins.readFile ./scripts/replace_parameters.lua)
  ];

  extraPlugins = [
    (buildVimPlugin {
      pname = "vim-easy-align";
      version = "2.10.0-unstable-2024-04-13";
      src = fetchFromGitHub {
        owner = "junegunn";
        repo = "vim-easy-align";
        rev = "9815a55dbcd817784458df7a18acacc6f82b1241";
        hash = "sha256-9CfWi83DCzWBARNG6AA0MQllEfQ/3UtYtYPDWLdmDwk=";
      };
      meta = {
        homepage = "https://github.com/junegunn/vim-easy-align";
        license = lib.licenses.unlicense;
      };
    })
  ];

  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "gw";
      action.__raw = ''
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end
      '';
      options = {
        desc = "Format";
      };
    }
  ];
}
