{
  smart_jump = key: ''
    function()
      local count = vim.v.count
      if count > 5 then
        vim.cmd("normal! m'")
      end
      vim.cmd("normal! " .. (count > 0 and count or 1) .. "${key}")
    end
  '';
}
