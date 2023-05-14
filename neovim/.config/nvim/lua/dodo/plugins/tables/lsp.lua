local function req(file) require("dodo.configs.lsp." .. file) end

return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			req("lsp-zero")
		end,
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' },

			-- icons
			{ "onsails/lspkind.nvim" },

		}
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lsp_lines").setup()
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require('lspsaga').setup({
				symbol_in_winbar = {
					enable = false
				},
				diagnostic = {
					on_insert = false
				},
				ui = {
					kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				},
			})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
				desc = 'Code action menu',
				noremap = true,
				silent = true
			})
			vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>', {
				desc = 'LSP peek definition',
				noremap = true,
				silent = true
			})
		end,
		branch = "main",
	},
}
