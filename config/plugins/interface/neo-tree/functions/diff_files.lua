function(state)
  local node = state.tree:get_node()
  local log = require("neo-tree.log")
  state.clipboard = state.clipboard or {}
  if diff_Node and diff_Node ~= tostring(node.id) then
    local current_Diff = node.id
    require("neo-tree.utils").open_file(state, diff_Node, open)
    vim.cmd("vert diffs " .. current_Diff)
    log.info("Diffing " .. diff_Name .. " against " .. node.name)
    diff_Node = nil
    current_Diff = nil
    state.clipboard = {}
    require("neo-tree.ui.renderer").redraw(state)
  else
    local existing = state.clipboard[node.id]
    if existing and existing.action == "diff" then
      state.clipboard[node.id] = nil
      diff_Node = nil
      require("neo-tree.ui.renderer").redraw(state)
    else
      state.clipboard[node.id] = { action = "diff", node = node }
      diff_Name = state.clipboard[node.id].node.name
      diff_Node = tostring(state.clipboard[node.id].node.id)
      log.info("Diff source file " .. diff_Name)
      require("neo-tree.ui.renderer").redraw(state)
    end
  end
end
