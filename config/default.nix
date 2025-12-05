{ pkgs, ... }:

{
  imports = [
    ./keymaps
    ./plugins
    ./settings.nix
  ];

  extraPackages = with pkgs; [
  # Dependecy    # Required by
    fzf          # Blink
    gcc          # TreeSitter
    krabby       # Snacks.dashboard
    ripgrep      # Blink and Snacks.picker
    stylua       # Lua formatter
    sqlfluff     # SQL formatter
    wakatime-cli # Wakatime
    wordnet      # Blink
  ];
}
