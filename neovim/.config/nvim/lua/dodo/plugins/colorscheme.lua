return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha",
	-- 			background = {
	-- 				light = "latte",
	-- 				dark = "mocha",
	-- 			},
	-- 			transparent_background = true,
	-- 			term_colors = false,
	-- 			styles = {
	-- 				comments = { "italic" },
	-- 				conditionals = { "italic" },
	-- 			},
	-- 			integrations = {
	-- 				cmp = true,
	-- 				barbecue = {
	-- 					dim_dirname = true, -- directory name is dimmed by default
	-- 					bold_basename = true,
	-- 					dim_context = false,
	-- 					alt_background = false,
	-- 				},
	-- 				treesitter = true,
	-- 				treesitter_context = true,
	-- 				mason = true,
	-- 				ts_rainbow = false,
	-- 				gitsigns = true,
	-- 				telescope = true,
	-- 				neotree = true,
	-- 				headlines = false,
	-- 				markdown = false,
	-- 				lsp_trouble = false,
	-- 				indent_blankline = {
	-- 					enabled = true,
	-- 					scope_color = "lavender",
	-- 					colored_indent_levels = false,
	-- 				},
	-- 				mini = {
	-- 					enabled = true,
	-- 					indentscope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"sainnhe/sonokai",
		name = "sonokai",
		priority = 1000,
		config = function()
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_transparent_background = 1

			vim.cmd.colorscheme("sonokai")
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
