return {
	{
		"alligator/accent.vim",
		name = "accent",
		priority = 1000,
		config = function()
			vim.g.accent_auto_cwd_colour = 1
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
		},
		opts = {
			options = {
				theme = "auto",
			},
		},
	},
}
