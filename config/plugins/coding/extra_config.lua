-- ========== Autopairs =======================================================

local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.add_rules({
	Rule("{", "};", "nix"):with_pair(function(opts)
		return true
	end),
})

-- ========== Visual Surround =================================================

require("visual-surround").setup({
	use_default_keymaps = true,
	surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`", "*", "_", "─", "~" },
	enable_wrapped_deletion = true,
	exit_visual_mode = true,
})
