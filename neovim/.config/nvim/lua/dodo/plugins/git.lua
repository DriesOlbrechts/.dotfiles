return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>dv",
				function()
					local lib = require("diffview.lib")
					local view = lib.get_current_view()
					if view then
						-- Current tabpage is a Diffview; close it
						vim.cmd.DiffviewClose()
					else
						-- No open Diffview exists: open a new one
						vim.cmd.DiffviewOpen()
					end
				end,
				desc = "diffview",
			},
		},
		opts = {
			enhanced_diff_hl = true,
		},
	},
	{
		"f-person/git-blame.nvim",
		keys = {
			{ "<leader>gbt", "<cmd>GitBlameToggle<CR>", desc = "git blame" },
		},
	},
	{
		'pwntester/octo.nvim',
		event = "VeryLazy",
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			-- OR 'ibhagwan/fzf-lua',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require "octo".setup()
		end
	},
}
