local config = require('dodo.config.snacks')

local function mergeTables(...)
	local merged = {}
	for _, t in ipairs({ ... }) do
		for _, v in ipairs(t) do
			table.insert(merged, v)
		end
	end
	return merged
end


return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = mergeTables(
			config.pickers.keys,
			config.git.keys
		),
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below

			bigfile = { enabled = true },
			explorer = {
				replace_netrw = true,
			},
			indent = { enabled = true },
			input = { enabled = true },
			scroll = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
		},
	},
}
