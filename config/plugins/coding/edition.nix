{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

in
{
  plugins = {
    guess-indent.enable = true;

    leap.enable = true;

    nvim-autopairs = {
      enable = true;
      settings = {
        fast_wrap.chars = [ "{" "[" "(" "\"" "'" "`"  "─" ];
      };
    };

    trim.enable = true;

    ts-autotag.enable = true;
  };

  extraConfigLua = ''
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.add_rules {
      Rule("{", "};", "nix")
        :with_pair(function(opts)
          return true
        end)
    }

    require("visual-surround").setup({
      use_default_keymaps = true,
      surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`", "*", "_", "─", "~" },
      enable_wrapped_deletion = true,
      exit_visual_mode = true,
    })

    vim.keymap.set({'n'}, 's', '<Plug>(leap)')
  '';

  extraPlugins = [
    (buildVimPlugin {
      pname = "visual-surround";
      version = "v1.0.1";
      src = fetchFromGitHub {
        owner = "NStefan002";
        repo = "visual-surround.nvim";
        rev = "v1.0.1";
        hash = "sha256-R1IuhysQODTJtJYETsWk/23/EWud7hphVM5ufKVUowU=";
      };
    })
  ];
}
