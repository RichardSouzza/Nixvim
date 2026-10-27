require('multiple-cursors').setup({
  custom_key_maps = {
    {
      'n',
      'x',
      function(_, count)
        vim.cmd('normal! "_' .. (count > 0 and count or '') .. 'x')
      end,
    },
    {
      'n',
      'd',
      function(_, count, motion)
        vim.cmd('normal! "_' .. (count > 0 and count or '') .. 'd' .. motion)
      end,
      'm',
    },
  },
})
