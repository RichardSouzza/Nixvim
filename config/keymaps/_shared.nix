{
  rmMap = { key, mode ? "n" }:
    {
      mode = mode;
      key = key;
      action = "<Nop>";
    };

  setIcon = { key, icon, color ? "azure" }:
    {
      __unkeyed-1 = key;
      icon = {
        icon = icon;
        color = color;
      };
      mode = [ "n" ];
    };

  setIconGroup = { group, key, icon, color ? "azure" }:
    {
      __unkeyed-1 = key;
      group = group;
      icon = {
        icon = icon;
        color = color;
      };
      mode = [ "n" ];
    };

  smartJump = key: ''
    function()
      local count = vim.v.count
      if count >= 3 then
        vim.cmd("normal! m'")
      end
      vim.cmd("normal! " .. (count > 0 and count or 1) .. "${key}")
    end
  '';
}
