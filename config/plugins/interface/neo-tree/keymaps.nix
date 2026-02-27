let
  setIcon = (import ./../../../keymaps/_shared.nix).setIcon;
  setIconGroup = (import ./../../../keymaps/_shared.nix).setIconGroup;

in
{
  plugins.which-key.settings.spec = [
    (setIconGroup { group = "Neotree"; key = "<leader>e"; icon = ""; })
    (setIcon { key = "<leader>eb"; icon = ""; })
    (setIcon { key = "<leader>ef"; icon = ""; })
    (setIcon { key = "<leader>eg"; icon = ""; color = "red"; })
    (setIcon { key = "<leader>es"; icon = ""; })
  ];

  keymaps = [
    {
      mode = "n";
      key = "e";
      action.__raw = builtins.readFile ./functions/focus_or_open.lua;
      options = {
        desc = "Focus on Neotree";
      };
    }
    {
      mode = "n";
      key = "<S-e>";
      action.__raw = builtins.readFile ./functions/toggle.lua;
      options = {
        desc = "Toggle Neotree";
      };
    }
    {
      mode = "n";
      key = "<leader>ef";
      action = "<CMD>Neotree focus filesystem<CR>";
      options = {
        desc = "Focus on filesystem";
      };
    }
    {
      mode = "n";
      key = "<leader>eb";
      action = "<CMD>Neotree focus buffers<CR>";
      options = {
        desc = "Focus on buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>eg";
      action = "<CMD>Neotree focus git_status<CR>";
      options = {
        desc = "Focus on git status";
      };
    }
    {
      mode = "n";
      key = "<leader>es";
      action = "<CMD>Neotree focus document_symbols<CR>";
      options = {
        desc = "Focus on document symbols";
      };
    }
  ];
}
