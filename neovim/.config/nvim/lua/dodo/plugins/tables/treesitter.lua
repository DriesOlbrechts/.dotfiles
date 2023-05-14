local function req(file) require("dodo.configs.treesitter." .. file) end

return {
	{
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			req("nvim-treesitter")
		end,
		build = ':TSUpdate'
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("treesitter-context").setup()
		end
	},
}
