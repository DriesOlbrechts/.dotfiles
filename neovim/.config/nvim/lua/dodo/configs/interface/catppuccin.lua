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
		ts_rainbow = true,
		gitsigns = true,
		telescope = true,
		neotree = true,
		headlines = true,
		markdown = true,
		lsp_trouble = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		}
	}
})
vim.cmd.colorscheme "catppuccin"
