{ pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

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
      version = "0-unstable-2025-12-15";
      src = fetchFromGitHub {
        owner = "RichardSouzza";
        repo = "mini.base16";
        rev = "1a0ebbd10302da803673e1703c5f31a42676efe9";
        hash = "sha256-KZl+DRNKVP7vOZbd5Xwt7u+dqmkDon82oPvsoBFcHHM=";
      };
      meta.homepage = "https://github.com/RichardSouzza/mini.base16";
    })
    (buildVimPlugin {
      pname = "monet.nvim";
      version = "0-unstable-2025-11-08";
      src = fetchFromGitHub {
        owner = "fynnfluegge";
        repo = "monet.nvim";
        rev = "8fba02c535a408d5e5255251665325a69fa12a8e";
        hash = "sha256-fUnwv0mppD+sqlWMgbR/f/75Bau7psoSpiUVCQ/DxH4=";
      };
      meta.homepage = "https://github.com/fynnfluegge/monet.nvim";
    })
    (buildVimPlugin {
      pname = "oasis.nvim";
      version = "4.0.0";
      src = fetchFromGitHub {
        owner = "uhs-robert";
        repo = "oasis.nvim";
        rev = "v4.0.0";
        hash = "sha256-uFO3eNhWsUmebYD6t85d8mlna2BF4qd1FU+RkGnQbvU=";
      };
      meta.homepage = "https://github.com/uhs-robert/oasis.nvim";
    })
    (buildVimPlugin {
      pname = "radium.nvim";
      version = "0-unstable-2024-02-29";
      src = fetchFromGitHub {
        owner = "Sly-Harvey";
        repo = "radium.nvim";
        rev = "d600092250680155c7f5ff09d073599b38d36676";
        hash = "sha256-MJntiTaeC7ItD04mHWEw80A9Lb+IojEGiSDC0CkyDQU=";
      };
      meta.homepage = "https://github.com/Sly-Harvey/radium.nvim";
    })
    (buildVimPlugin {
      pname = "spaceduck";
      version = "0-unstable-2022-02-21";
      src = fetchFromGitHub {
        owner = "pineapplegiant";
        repo = "spaceduck";
        rev = "350491f19343b24fa85809242089caa02d4dadce";
        hash = "sha256-lE8y9BA2a4y0B6O3+NyOS7numoltmzhArgwTAner2fE=";
      };
      meta.homepage = "https://github.com/pineapplegiant/spaceduck";
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
      meta.homepage = "https://github.com/sontungexpt/witch";
    })
    (buildVimPlugin {
      pname = "yoda.nvim";
      version = "1.1.0";
      src = fetchFromGitHub {
        owner = "kuri-sun";
        repo = "yoda.nvim";
        rev = "v1.1.0";
        hash = "sha256-WSh9zrMSvvY1i4o7wMerNtyxvdT7aW4tsyPH5+9vlF4=";
      };
      meta.homepage = "https://github.com/kuri-sun/yoda.nvim";
    })
  ];
}
