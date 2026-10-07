-- Disable deprecation warnings

vim.deprecate = function() end

-- Allow Neovim to use language-specific indent rules

vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting

vim.cmd('syntax on')

-- Configure diff

vim.o.diffopt =
  'internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram'

-- Set persistence

vim.opt.sessionoptions = {
  -- "buffers",
  'curdir',
  -- "folds",
  'globals',
  'help',
  'skiprtp',
  'tabpages',
  'winsize',
}

-- Custom commands

vim.api.nvim_create_user_command('LintingEnable', function()
  vim.diagnostic.enable(true)
end, {})

vim.api.nvim_create_user_command('LintingDisable', function()
  vim.diagnostic.enable(false)
end, {})

-- Invert search direction

vim.keymap.set('n', 'n', 'N')
vim.keymap.set('n', 'N', 'n')

-- Remap 'Comment' and set 'Search code' keymap
-- https://github.com/neovim/neovim/discussions/29075#discussioncomment-11140291

local copy_keymap = function(mode, cur_lhs, new_lhs)
  local map_data = vim.fn.maparg(cur_lhs, mode, false, true)
  map_data.lhs, map_data.lhsraw = new_lhs, vim.keycode(new_lhs)
  vim.fn.mapset(map_data)
end

copy_keymap('n', 'gc', 'gb')
copy_keymap('x', 'gc', 'gb')
copy_keymap('o', 'gc', 'gb')
copy_keymap('n', 'gcc', 'gbb')

vim.keymap.del('n', 'gc')
vim.keymap.del('x', 'gc')
vim.keymap.del('o', 'gc')
vim.keymap.del('n', 'gcc')

vim.keymap.set('n', 'gc', function()
  Snacks.picker.grep({ regex = false })
end, { desc = 'Search code', noremap = true, nowait = true })

-- Disable scrolloff on click to prevent scrolling

vim.keymap.set(
  'n',
  '<LeftMouse>',
  ':let temp=&so<CR>:set so=0<CR><LeftMouse>:let &so=temp<CR>',
  { noremap = true, silent = true }
)
