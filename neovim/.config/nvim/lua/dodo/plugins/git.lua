return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gbt", "<cmd>GitBlameToggle<CR>", desc = "git blame" },
		},
		opts = {
			enabled = false,
		},
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy"
	}
}
