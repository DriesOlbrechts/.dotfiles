return {
	{ "jannis-baum/vivify.vim", ft = "markdown" },
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	ft = "markdown", -- If you decide to lazy-load anyway
	-- 	dependencies = {
	-- 		-- You will not need this if you installed the
	-- 		-- parsers manually
	-- 		-- Or if the parsers are in your $RUNTIMEPATH
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	opts = {
	-- 		preview = {
	-- 			modes = { "n", "i", "no", "c" }, -- Change these modes
	-- 			-- to what you need
	-- 			hybrid_modes = { "i" }, -- Uses this feature on
	-- 			-- normal mode
	-- 			-- This is nice to have
	-- 			callbacks = {
	-- 				on_enable = function(_, win)
	-- 					vim.wo[win].conceallevel = 2
	-- 					vim.wo[win].conecalcursor = "c"
	-- 				end,
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"obsidian-nvim/obsidian.nvim",
		event = { "VeryLazy" },
		version = "*", -- use latest release, remove to use latest commit
		ft = "markdown",
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/projects/vaults/personal",
				},
				{
					name = "work",
					path = "~/Documents/projects/vaults/work",
				},
			},
			note_id_func = function(title)
				return title
			end,
			ui = {
				enable = false
			},
			daily_notes = {
				enabled = true,
				folder = "dailies",
				workdays_only = false
			}
		},
	}
}
