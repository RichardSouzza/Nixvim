{ pkgs, ... }:

{
  imports = [
    ./autocmds
    ./keymaps
    ./options
    ./plugins
    ./settings.nix
  ];

  extraPackages = with pkgs; [
  # Dependecy    # Required by
    fzf          # Blink
    gcc          # TreeSitter
    krabby       # Snacks.dashboard
    lsof         # OpenCode
    nodejs-slim  # markdown-preview
    ripgrep      # Blink and Snacks.picker
    ruff         # Conform
    typescript   # typescript-tools
    wakatime-cli # Wakatime
    yamlfmt      # Conform
  ];
}
