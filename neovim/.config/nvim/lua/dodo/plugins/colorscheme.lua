return {
	{
		"sainnhe/sonokai",
		name = "sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_inlay_hints_background = "dimmed"
			vim.g.sonokai_dim_inactive_windows = 1

			vim.cmd.colorscheme("sonokai")

			local config = vim.fn["sonokai#get_configuration"]()
			local palette = vim.fn["sonokai#get_palette"](config.style, config.colors_override)
			vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", fg = palette.fg[1] })
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
		config = function()
			require("lualine").setup({
				options = {
					theme = "sonokai",
				},
			})
		end,
	},
}
