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
vim.cmd.colorscheme "catppuccin"
