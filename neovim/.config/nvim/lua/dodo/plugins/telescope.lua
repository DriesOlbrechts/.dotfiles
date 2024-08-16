return {
	{
		'nvim-telescope/telescope.nvim',
		keys = {
			{
				"<leader><leader>",
				function()
					require("dodo.config.telescope-config").project_files()
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
					require("dodo.config.telescope-config").project_live_grep()
				end,
				desc = "ripgrep over project"
			},
			{ "<leader>gbr", ":Telescope git_branches<CR>", desc = "show git branches" },
			{ "<leader>gc",  ":Telescope git_commits<CR>",  desc = "show commits" },
			{ "<leader>fk",  ":Telescope keymaps<CR>",      desc = "show keymaps" },

		},
		config = function()
			require('telescope').setup {
				defaults = {
					layout_strategy = "vertical",
					preview = {
						height = 0.95,
						prompt_position = "bottom"
					},
					mappings = {
						i = {
							["<C-h>"] = "which_key"
						}
					}
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
				}
			}
		end,
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
		}
	},
}
