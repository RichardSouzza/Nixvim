local Terminal = require('toggleterm.terminal').Terminal

local scooter = Terminal:new({
  cmd = 'scooter --hidden',
  display_name = 'Scooter',
  direction = 'float',
  dir = 'git_dir',
  hidden = false,
  on_open = function()
    vim.cmd('SunglassesEnable')
  end,
  on_close = function()
    vim.cmd('SunglassesDisable')
  end,
})

function Scooter()
  scooter:toggle()
end

local function find_alt_win(term_win, alt_buf)
  if alt_buf <= 0 then return nil end

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= term_win and vim.api.nvim_win_get_buf(win) == alt_buf then
      return win
    end
  end

  return nil
end

function goto_previous_window()
  local term_win = vim.api.nvim_get_current_win()
  local alt_buf = vim.fn.bufnr('#')
  local target_win = find_alt_win(term_win, alt_buf)

  if target_win then
    vim.api.nvim_set_current_win(target_win)
  else
    vim.cmd('wincmd p')
  end
end
