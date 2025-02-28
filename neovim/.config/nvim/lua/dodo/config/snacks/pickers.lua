local M = {
	keys = {
		{
			"<leader><leader>",
			function()
				Snacks.picker.files()
			end,
			desc = "find files, excluding hidden",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.files({ ignored = true, hidden = true })
			end,
			desc = "find files, including gitignore",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.grep()
			end,
			desc = "ripgrep over project",
		},

		{
			"<leader>sh",
			function()
				Snacks.picker.grep({ ignored = true, args = { "--hidden" } })
			end,
			desc = "ripgrep over project with hidden files",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Show keymaps",
		},
		{
			"<leader>ft",
			function()
				Snacks.explorer.open()
			end,
			desc = "file tree snacks",
		},
	}
}


return M
