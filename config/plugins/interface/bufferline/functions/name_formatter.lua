(function ()
  local function parent(buf)
    return vim.fn.fnamemodify(buf.path, ":h:t")
  end

  local short = {
    ["default.nix"] = function (buf)
      return parent(buf) .. "/df.nix"
    end
    -- examples:
    -- ["script.js"] = function (buf)
    --   return parent(buf) .. "/script"
    -- end,
    -- ["index.tsx"] = function (buf)
    --   return parent(buf) .. ".tsx"
    -- end
  }

  return function (buf)
    local handler = short[buf.name]
    return handler and handler(buf) or buf.name
  end
end)()
