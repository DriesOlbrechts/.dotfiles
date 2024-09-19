return {
	{
		"sainnhe/sonokai",
		name = "sonokai",
		priority = 1000,
		config = function()
			local colors = require("dodo.utils").colors
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_inlay_hints_background = "dimmed"
			vim.g.sonokai_dim_inactive_windows = 1
			vim.g.sonokai_diagnostic_virtual_text = "highlighted"

			vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", fg = colors.fg })

			-- call when colorscheme has been set up (uses colorscheme)
			require("dodo.utils").setup()
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "sonokai" },
		},
		opts = {
			options = {
				theme = "sonokai",
			},
		},
	},
}
