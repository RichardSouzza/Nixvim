function(config, node, state)
  local name_component = require("neo-tree.sources.filesystem.components").name
  local name = name_component(config, node, state)

  if node:get_depth() == 1 then
    local cwd = vim.fs.basename(vim.loop.cwd() or "")
    cwd = cwd:gsub("^%l", string.upper)
    name.text = cwd
  end
  return name
end
