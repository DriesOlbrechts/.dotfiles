return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = 'dawn',
		},
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
