local function req(file) require("dodo.configs.interface." .. file) end
return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		priority = 1000,
		config = function()
			req("catppuccin")
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},

	{
		'freddiehaddad/feline.nvim',
		event = 'VimEnter',
		config = function()
			req("feline")
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
