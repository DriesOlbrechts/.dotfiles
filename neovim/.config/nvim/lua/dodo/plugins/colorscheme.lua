return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
