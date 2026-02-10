let
  setIcon = (import ./../../../keymaps/_shared.nix).setIcon;

in
{
  plugins.which-key.settings.spec = [
    (setIcon { key = "gb";  icon = "";  color = "purple"; })
    (setIcon { key = "gf";  icon = "";  color = "purple"; })
    (setIcon { key = "gH";  icon = ""; color = "purple"; })
    (setIcon { key = "gpc"; icon = "󰏘"; color = "purple"; })
    (setIcon { key = "gpd"; icon = "";  color = "purple"; })
    (setIcon { key = "gpD"; icon = "";  color = "purple"; })
    (setIcon { key = "gpk"; icon = "";  color = "purple"; })
    (setIcon { key = "gpu"; icon = "";  color = "purple"; })
    (setIcon { key = "<leader>b"; icon = ""; color = "green"; })
    (setIcon { key = "<leader>c"; icon = ""; color = "green"; })
    (setIcon { key = "<leader>f"; icon = ""; color = "green"; })
    (setIcon { key = "<leader>g"; icon = "󰊢"; color = "red"; })
    (setIcon { key = "<leader>:"; icon = ""; color = "green"; })
  ];

  keymaps = [
    {
      action = "<CMD>lua Snacks.picker.lines({ layout = { preset = 'vertical' } })<CR>";
      mode = "n";
      key = "/";
      options = {
        desc = "Search line";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.grep({ regex = false })<CR>";
      key = "gB";
      mode = "n";
      options = {
        desc = "Search code";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.files({ hidden = true })<CR>";
      key = "gf";
      mode = "n";
      options = {
        desc = "Search files";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.git_log_file()<CR>";
      key = "gH";
      mode = "n";
      options = {
        desc = "Open git history";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.colorschemes({ layout = { preset = 'dropdown' } })<CR>";
      key = "gpc";
      mode = "n";
      options = {
        desc = "Show colorschemes";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.diagnostics_buffer()<CR>";
      key = "gpd";
      mode = "n";
      options = {
        desc = "Show buffer diagnostics";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.diagnostics()<CR>";
      key = "gpD";
      mode = "n";
      options = {
        desc = "Show diagnostics";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.keymaps()<CR>";
      key = "gpk";
      mode = "n";
      options = {
        desc = "Show keymaps";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.undo()<CR>";
      key = "gpu";
      mode = "n";
      options = {
        desc = "Show undo history";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.grep({ regex = false })<CR>";
      key = "<leader>b";
      mode = "n";
      options = {
        desc = "Search code";
      };
    }
    {
      action.__raw = builtins.readFile ./functions/search_sidebar.lua;
      key = "<leader>c";
      mode = "n";
      options = {
        desc = "Open code search sidebar";
      };
    }
    {
      action = "<CMD>lua Snacks.picker.files({ hidden = true })<CR>";
      key = "<leader>f";
      mode = "n";
      options = {
        desc = "Search files";
      };
    }
    {
      action = "<CMD>lua Snacks.lazygit.open()<CR>";
      key = "<leader>g";
      mode = "n";
      options = {
        desc = "Open Lazygit";
      };
    }
    {
      action = "<CMD>lua Snacks.lazygit.commands()<CR>";
      key = "<leader>:";
      mode = "n";
      options = {
        desc = "Search commands";
      };
    }
  ];
}
