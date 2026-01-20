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
      action = "<CMD>Navbuddy<CR>";
      mode = "n";
      key = "gj";
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
  ];
}
