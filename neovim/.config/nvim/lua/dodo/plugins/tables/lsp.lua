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
		"aznhe21/actions-preview.nvim",
		event = { "LspAttach" },
		config = function()
			vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions,
				{ desc = "code action menu", noremap = true, silent = true })
		end,
	},
	{
		'stevearc/conform.nvim',
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fb",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				typescript = { "prettier" },
				vue = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = {"prettier"},
				html = {"prettier"},
				
			},
		},
	}
}
