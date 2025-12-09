function(a, b)
	-- 1. Directories before files
	if a.type ~= b.type then
		return a.type < b.type
	end

	-- 2. Natural sort by name (case-insensitive)
	local function split_parts(str)
		local parts = {}
		local buffer = ""
		local is_digit = nil

		for i = 1, #str do
			local c = str:sub(i, i)
			local digit = c:match("%d") ~= nil

			if is_digit == nil then
				-- first character
				is_digit = digit
				buffer = c
			elseif digit == is_digit then
				-- same type (digit/text) -> append
				buffer = buffer .. c
			else
				-- type changed -> push previous part
				if is_digit then
					table.insert(parts, tonumber(buffer))
				else
					table.insert(parts, buffer)
				end
				buffer = c
				is_digit = digit
			end
		end

		-- final buffer
		if buffer ~= "" then
			if is_digit then
				table.insert(parts, tonumber(buffer))
			else
				table.insert(parts, buffer)
			end
		end

		return parts
	end

	local nameA = a.name:lower()
	local nameB = b.name:lower()

	local partsA = split_parts(nameA)
	local partsB = split_parts(nameB)

	-- 3. Compare part-by-part
	local min_len = math.min(#partsA, #partsB)

	for i = 1, min_len do
		local x = partsA[i]
		local y = partsB[i]

		if type(x) == "number" and type(y) == "number" then
			if x ~= y then
				return x < y
			end
		elseif type(x) == "string" and type(y) == "string" then
			if x ~= y then
				return x < y
			end
		else
			-- numbers always come before text
			return type(x) == "number"
		end
	end

	-- 4. If all parts equal, shorter wins (file2 < file2a)
	return #partsA < #partsB
end
