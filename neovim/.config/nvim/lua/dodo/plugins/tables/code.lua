return {
	{
		'numToStr/Comment.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			require('Comment').setup()
		end
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		'windwp/nvim-autopairs',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			require('nvim-autopairs').setup()
		end
	},
	{
		"zbirenbaum/copilot.lua",
		keys = {
			{ "<leader>tc", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
		},
		config = function()
			require('copilot').setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end
	}
}
