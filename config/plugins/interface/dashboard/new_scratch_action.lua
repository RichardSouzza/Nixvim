function()
  Snacks.input.input(
    { prompt = 'Scratch Name', relative = 'cursor' },
    function(value)

      function splitByPeriod(str)
        local result = {}
        for part in string.gmatch(str, "([^%.]+)") do
          table.insert(result, part)
        end
        return result
      end

      local file = splitByPeriod(value)
      Snacks.scratch({ name = file[1], ft = file[2] })
    end)
end
