{
  keymaps = [
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
      key = "<leader>C";
      action.__raw = ''
        function()
          require("grug-far").toggle_instance({ instanceName = "far" })
        end
      '';
      options = {
        desc = "Open GrugFar";
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
