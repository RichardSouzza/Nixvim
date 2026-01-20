local Terminal = require("toggleterm.terminal").Terminal

local scooter = Terminal:new({
  cmd = "scooter --hidden",
  display_name = "Scooter",
  direction = "float",
  dir = "git_dir",
  hidden = false,
  on_open = function()
    vim.cmd("SunglassesEnable")
  end,
  on_close = function()
    vim.cmd("SunglassesDisable")
  end,
})

function Scooter()
  scooter:toggle()
end
