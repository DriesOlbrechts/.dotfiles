return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			hint_enable = false,
		},
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lsp_lines").setup()
		end,
	},
}
