return {
	{
		"simonmclean/triptych.nvim",
		keys = {
			{
				"<leader>fe",
				function()
					local current_dir = vim.fn.expand("%:p:h") ~= "" and vim.fn.expand("%:p:h") or vim.fn.getcwd()
					require("triptych").toggle_triptych(current_dir)
				end,
				{ desc = "Open triptych" },
			},
		},
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- optional
		},
		opts = {},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<Leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
		},
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			buffer = {
				follow_current_file = {
					enabled = true,
				},
			},
		},
	},
}
