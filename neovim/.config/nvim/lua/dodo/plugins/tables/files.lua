local function req(file) require("dodo.configs.files." .. file) end
return {
	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>fe",
				function() require("oil").open_float(vim.fn.getcwd()) end,
				{desc = "open oil in floating window" }
			},
		},
		config = function()
			req("oil")
		end
	}
}
