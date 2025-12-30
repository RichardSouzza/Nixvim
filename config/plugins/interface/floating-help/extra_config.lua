local fh = require("floating-help")

fh.setup({
  width = 120,
  height = 0.9,
  position = "C",
  border = "rounded",
  onload = function(query_type) end,
})

vim.keymap.set("n", "<F1>", fh.toggle)
vim.keymap.set("n", "<F2>", function()
  fh.open("t=cppman", vim.fn.expand("<cword>"))
end)
vim.keymap.set("n", "<F3>", function()
  fh.open("t=man", vim.fn.expand("<cword>"))
end)

local function cmd_abbrev(abbrev, expansion)
  local cmd = "cabbr "
    .. abbrev
    .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "'
    .. expansion
    .. '" : "'
    .. abbrev
    .. '")<CR>'
  vim.cmd(cmd)
end

cmd_abbrev("h", "FloatingHelp")
cmd_abbrev("help", "FloatingHelp")
cmd_abbrev("helpc", "FloatingHelpClose")
cmd_abbrev("helpclose", "FloatingHelpClose")
