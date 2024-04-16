local function req(file) return require("dodo.configs.telescope." .. file) end
return {
	{
		'nvim-telescope/telescope.nvim',
		keys = {
			{
				"<leader><leader>",
				function()
					req("util").project_files()
				end,
				desc = "find project files"
			},
			{
				"<leader>F",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "find files, including hidden"
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").find_files({ no_ignore = true })
				end,
				desc = "find files including gitignore"
			},
			{
				"<leader>sp",
				function()
					req("util").project_live_grep()
				end,
				desc = "ripgrep over project"
			},
			{ "<leader>gbr", ":Telescope git_branches<CR>", desc = "show git branches" },
			{ "<leader>gc", ":Telescope git_commits<CR>",  desc = "show commits" },
			{ "<leader>fk", ":Telescope keymaps<CR>",      desc = "show keymaps" },

		},
		config= function() 
			req("telescope")
		end,
		dependencies = {
			{'nvim-lua/plenary.nvim'},
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
		}
	},
}
