{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

in
{
  colorscheme = "bearded-arc";

  colorschemes = {
    ayu.enable = true;
    catppuccin.enable = true;
    dracula-nvim.enable = true;
    nightfox.enable = true;
    onedark.enable = true;
    tokyonight.enable = true;
  };

  extraPlugins = [
    (buildVimPlugin {
      pname = "mini.base16";
      version = "2025-12-15";
      src = fetchFromGitHub {
        owner = "RichardSouzza";
        repo = "mini.base16";
        rev = "main";
        hash = "sha256-a0cEYo9LuVD6/mKc+Fe5RqoyUNo0avokPz7MMaFP99o=";
      };
    })
    (buildVimPlugin {
      pname = "monet";
      version = "2025-11-08";
      src = fetchFromGitHub {
        owner = "fynnfluegge";
        repo = "monet.nvim";
        rev = "main";
        hash = "sha256-fUnwv0mppD+sqlWMgbR/f/75Bau7psoSpiUVCQ/DxH4=";
      };
    })
    (buildVimPlugin {
      pname = "oasis";
      version = "4.0.0";
      src = fetchFromGitHub {
        owner = "uhs-robert";
        repo = "oasis.nvim";
        rev = "v4.0.0";
        hash = "sha256-uFO3eNhWsUmebYD6t85d8mlna2BF4qd1FU+RkGnQbvU=";
      };
    })
    (buildVimPlugin {
      pname = "radium";
      version = "2024-02-29";
      src = fetchFromGitHub {
        owner = "Sly-Harvey";
        repo = "radium.nvim";
        rev = "master";
        hash = "sha256-MJntiTaeC7ItD04mHWEw80A9Lb+IojEGiSDC0CkyDQU=";
      };
    })
    (buildVimPlugin {
      pname = "spaceduck";
      version = "2022-02-21";
      src = fetchFromGitHub {
        owner = "pineapplegiant";
        repo = "spaceduck";
        rev = "main";
        hash = "sha256-lE8y9BA2a4y0B6O3+NyOS7numoltmzhArgwTAner2fE=";
      };
    })
    (buildVimPlugin {
      pname = "witch";
      version = "1.0.0";
      src = fetchFromGitHub {
        owner = "sontungexpt";
        repo = "witch";
        rev = "1.0.0";
        hash = "sha256-NtFjXzRuHcAEuGxSk61HBN+jcagA8Bt/q5y5xc1jdHo=";
      };
    })
    (buildVimPlugin {
      pname = "yoda";
      version = "1.1.0";
      src = fetchFromGitHub {
        owner = "kuri-sun";
        repo = "yoda.nvim";
        rev = "v1.1.0";
        hash = "sha256-WSh9zrMSvvY1i4o7wMerNtyxvdT7aW4tsyPH5+9vlF4=";
      };
    })
  ];
}
