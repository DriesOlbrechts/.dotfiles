return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato",
			transparent_background = true,

			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				markdown = true,
				mason = true,
				neotree = true,
				alpha = true,
				diffview = true,
				nvim_surround = true,
				octo = true,
				lsp_trouble = true,
				mini = {
					enabled = true,
					indentscope_color = "maroon",
				},
				indent_blankline = {
					enabled = true,
					scope_color = "maroon",
					colored_indent_levels = false,
				},
			},
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
			{ "catppuccin" },
		},
		opts = {
			options = {
				theme = "catppuccin",
			},
		},
	},
}
