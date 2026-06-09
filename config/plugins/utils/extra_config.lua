require('hover').config({
  providers = {
    'hover.providers.dap',
    'hover.providers.diagnostic',
    'hover.providers.fold_preview',
    'hover.providers.lsp',
  },
  preview_opts = {
    border = 'single',
  },
  show_no_result = false,
  preview_window = false,
  title = true,
  mouse_providers = {
    'hover.providers.lsp',
  },
  mouse_delay = 500,
})

vim.keymap.set('n', 'K', function()
  require('hover').open()
end, { desc = 'hover.nvim (open)' })

vim.keymap.set('n', 'gK', function()
  require('hover').enter()
end, { desc = 'hover.nvim (enter)' })

vim.keymap.set('n', '<C-p>', function()
  require('hover').switch('previous')
end, { desc = 'hover.nvim (previous source)' })

vim.keymap.set('n', '<C-n>', function()
  require('hover').switch('next')
end, { desc = 'hover.nvim (next source)' })

vim.keymap.set('n', '<MouseMove>', function()
  require('hover').mouse()
end, { desc = 'hover.nvim (mouse)' })

vim.o.mousemoveevent = true

require('tail').setup({
  -- enable timestamps by default
  timestamps = false,
  -- customise the format (see `:help os.date`)
  timestamp_format = '%Y-%m-%d %H:%M:%S',
  -- customise the highlight group used for the timestamp
  timestamp_hl = 'Comment',
  -- enable log level highlighting by default
  log_level_hl = true,
})
