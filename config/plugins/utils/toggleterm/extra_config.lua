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

function goto_previous_window()
  local alt_buf = vim.fn.bufnr("#")
  if alt_buf <= 0 then
    return
  end

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == alt_buf then
      vim.api.nvim_set_current_win(win)
      return
    end
  end

  vim.cmd("bprevious")
end
