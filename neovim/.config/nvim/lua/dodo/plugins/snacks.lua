local config = require("dodo.config.snacks")

local function mergeTables(...)
	local merged = {}
	for _, t in ipairs({ ... }) do
		for _, v in ipairs(t) do
			table.insert(merged, v)
		end
	end
	return merged
end

vim.api.nvim_create_user_command("Scratch", function()
	Snacks.scratch()
end, { desc = "open a scratch buffer" })

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = mergeTables(config.pickers.keys, config.git.keys),
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
			scratch = {
				win_by_ft = {
					typescript = {
						keys = {
							["source"] = {
								"<cr>",
								function(self)
									vim.cmd("w !node")
								end,
								desc = "Source buffer",
								mode = { "n", "x" },
							},
						},
					},
				},
			},
		},
	},
}
