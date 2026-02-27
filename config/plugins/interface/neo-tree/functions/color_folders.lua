function(state, node)
  local name = node.name
  local icon = node.get_icon(state)
  local highlight = icon.highlight

  -- Custom logic to change highlight for specific folder names
  pp(name)
  if node.type == "directory" then
    if name == "src" then
      print(true)
      -- Apply a specific highlight group for the "src" folder
      -- Replace "NeoTreeDirectoryName" and "MySrcFolderHighlight" with actual highlight groups
      highlight = "MySrcFolderHighlight"
    elseif name == "config" then
      -- Apply another highlight group for the "config" folder
      highlight = "MyConfigFolderHighlight"
    end
  end

  return {
    text = icon.text .. name,
    highlight = highlight,
  }
end
