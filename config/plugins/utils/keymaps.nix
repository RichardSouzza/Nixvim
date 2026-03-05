let
  setIcon = (import ./../../keymaps/_shared.nix).setIcon;

in
{
  plugins.which-key.settings.spec = [
    (setIcon { key = "gj";  icon = "";  color = "green"; })
    (setIcon { key = "<leader>z"; icon = ""; })
  ];

  keymaps = [
    {
      mode = "n";
      key = "gj";
      action = "<CMD>Navbuddy<CR>";
      options = {
        desc = "Navigate the breadcrumbs";
      };
    }
    {
      mode = "n";
      key = "<leader>z";
      action = "<CMD>NoNeckPain<CR>";
      options = {
        desc = "Center buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>t";
      action = "<CMD>Trouble<CR>";
      options = {
        desc = "Trouble";
        silent = true;
      };
    }
  ];
}
