return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader><leader>",
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
			{ "<leader>gbr", ":Telescope git_branches<CR>", desc = "show git branches" },
			{ "<leader>gc", ":Telescope git_commits<CR>", desc = "show commits" },
			{ "<leader>fk", ":Telescope keymaps<CR>", desc = "show keymaps" },
		},
		config = function()
			local colors = require("dodo.utils").colors
			vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = colors.bg_red, fg = colors.fg })
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
				pickers = {},
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
			{ "sonokai" },
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},
}
