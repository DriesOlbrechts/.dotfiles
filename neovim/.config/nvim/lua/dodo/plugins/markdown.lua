return {
	{ "jannis-baum/vivify.vim", ft = "markdown" },
	{
		"OXY2DEV/markview.nvim",
		ft = "markdown", -- If you decide to lazy-load anyway
		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			preview = {
				modes = { "n", "i", "no", "c" }, -- Change these modes
				-- to what you need
				hybrid_modes = { "i" }, -- Uses this feature on
				-- normal mode
				-- This is nice to have
				callbacks = {
					on_enable = function(_, win)
						vim.wo[win].conceallevel = 2
						vim.wo[win].conecalcursor = "c"
					end,
				},
			},
		},
	},
}
