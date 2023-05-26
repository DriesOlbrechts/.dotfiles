require('catppuccin').setup({
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
	},
	integrations = {
		cmp = true,
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
		}
	}
})
vim.cmd.colorscheme "catppuccin"