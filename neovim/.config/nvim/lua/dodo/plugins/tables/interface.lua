local function req(file) require("dodo.configs.interface." .. file) end
return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			req("catppuccin")
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		'nvim-lualine/lualine.nvim',
		event = 'VimEnter',
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'catppuccin' },
		},
		config = function()
			req("lualine")
		end
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		event = { 'BufReadPre', 'BufNewFile' },
		version = "*",
		dependencies = {
			{ "SmiteshP/nvim-navic" },
			{ "nvim-tree/nvim-web-devicons" }, -- optional dependency
			{ "catppuccin" },
		},
		config =function()
			req("barbecue")
		end
	},
	{
		'norcalli/nvim-colorizer.lua',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			req("nvim-colorizer")
		end
	},
	{
		'goolord/alpha-nvim',
		event = "VimEnter",
		init = function()
			req("alpha")
		end
	},
}
