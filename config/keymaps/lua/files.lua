local M = {}

function M.save()
  vim.cmd.stopinsert()

  if vim.bo.buftype ~= '' then return end

  if vim.api.nvim_buf_get_name(0) ~= '' then
    vim.cmd.write()
    return
  end

  Snacks.input({
    prompt = 'Save as: ',
    default = vim.fn.getcwd() .. '/',
    completion = 'file',
  }, function(name)
    if not name or name == '' then return end

    vim.fn.mkdir(vim.fn.fnamemodify(name, ':h'), 'p')

    local ok, err = pcall(vim.cmd.saveas, vim.fn.fnameescape(name))
    if not ok then vim.notify(err, vim.log.levels.ERROR) end
  end)
end

return M
