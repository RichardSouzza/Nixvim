{
  plugins = {
    web-devicons = {
      enable = true;
      settings = {
        override = {
          license = {
            icon = "󰄤";
            color = "#d0bf41";
            name = "License";
          };
        };
        override_by_extension = {
          "kv" = {
            icon = "";
            color = "#fbf7f7";
            name = "Kivy";
          };
          "spec" = {
            icon = "";
            color = "#6d8086";
            name = "Specification";
          };
        };
        override_by_filename = {
          "LICENSE" = {
            icon = "󰄤";
            color = "#d0bf41";
            name = "License";
          };
        };
      };
    };
  };
}
