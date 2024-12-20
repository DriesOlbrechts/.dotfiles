return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader><leader>",
				function()
					require("telescope.builtin").find_files({ hidden = false })
				end,
				desc = "find files, excluding hidden",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "find files, including hidden",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").find_files({ no_ignore = true })
				end,
				desc = "find files, including gitignore",
			},
			{
				"<leader>sp",
				function()
					require("telescope.builtin").live_grep({ cwd = vim.g.root_dir })
				end,
				desc = "ripgrep over project",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").live_grep({ cwd = vim.g.root_dir, additional_args = { '--hidden' } })
				end,
				desc = "ripgrep over project",
			},
			{ "<leader>gbr", ":Telescope git_branches<CR>", desc = "show git branches" },
			{ "<leader>gc",  ":Telescope git_commits<CR>",  desc = "show commits" },
			{ "<leader>fk",  ":Telescope keymaps<CR>",      desc = "show keymaps" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						prompt_position = "top",
					},
					preview = {
						height = 0.95,
						prompt_position = "bottom",
					},
					mappings = {
						i = {
							["<C-h>"] = "which_key",
						},
					},
				},
				pickers = {
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
		end,
		dependencies = {
			{ "catppuccin" },
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},
}
