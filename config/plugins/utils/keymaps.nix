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
      action = "<CMD>GrugFar<CR>";
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
