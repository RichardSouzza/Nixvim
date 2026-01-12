{ pkgs, ... }:

{
  imports = [
    ./keymaps
    ./plugins
    ./auto_cmds.nix
    ./settings.nix
  ];

  extraPackages = with pkgs; [
  # Dependecy    # Required for:
    fzf          # blink-cmp
    gcc          # TreeSitter
    krabby       # Snacks.dashboard
    ripgrep      # blink-ripgrep and Snacks.picker
    stylua       # Conform Lua formatter
    sqlfluff     # Conform SQL formatter
    wakatime-cli # Wakatime
    wordnet      # blink-cmp-dictionary
  ];
}
