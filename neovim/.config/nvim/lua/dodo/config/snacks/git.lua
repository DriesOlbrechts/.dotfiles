local M = {
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open lazygit"

		}
	}
}

return M
