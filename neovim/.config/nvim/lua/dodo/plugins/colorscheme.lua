return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			require('catppuccin').setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				term_colors = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					cmp = true,
					barbecue = {
						dim_dirname = true, -- directory name is dimmed by default
						bold_basename = true,
						dim_context = false,
						alt_background = false,
					},
					treesitter = true,
					treesitter_context = true,
					mason = true,
					ts_rainbow = false,
					gitsigns = true,
					telescope = true,
					neotree = false,
					headlines = false,
					markdown = false,
					lsp_trouble = false,
					indent_blankline = {
						enabled = false,
						colored_indent_levels = false,
					},
					mini = {
						enabled = true,
						indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
					},
				}
			})
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'catppuccin' },
		},
		config = function()
			require('lualine').setup {
				options = {
					theme = "catppuccin"
				}
			}
		end
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		event = { 'BufReadPre', 'BufNewFile' },
		version = "*",
		dependencies = {
			{ "SmiteshP/nvim-navic" },
			{ "nvim-tree/nvim-web-devicons" }, -- optional dependency
			{ "catppuccin" },
		},
		config = function()
			require("barbecue").setup({
				theme = "catppuccin" })
		end
	},
}
