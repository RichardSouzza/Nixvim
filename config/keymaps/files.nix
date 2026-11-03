{
  extraConfigLuaPre = ''
    package.preload['config.keymaps.files'] = function()
      ${builtins.readFile ./lua/files.lua}
    end
  '';

  keymaps = [
    {
      mode = [ "n" "i" "v" ];
      key = "<C-s>";
      action.__raw = "function() require('config.keymaps.files').save() end";
      options.desc = "Save file (saveas if unnamed)";
    }
  ];
}
