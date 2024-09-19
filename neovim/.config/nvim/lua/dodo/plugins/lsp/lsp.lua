return {
	{
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v3.x",
			lazy = true,
			config = false,
			init = function()
				vim.g.lsp_zero_extend_cmp = 0
				vim.g.lsp_zero_extend_lspconfig = 0
			end,
		},
		{
			"williamboman/mason.nvim",
			lazy = false,
			config = true,
		},
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					"hrsh7th/cmp-cmdline",
					"onsails/lspkind.nvim",
					"rafamadriz/friendly-snippets",
					"saadparwaiz1/cmp_luasnip",
				},
			},
			config = function()
				local lsp_zero = require("lsp-zero")
				lsp_zero.extend_cmp()

				local cmp = require("cmp")
				local cmp_action = lsp_zero.cmp_action()
				local lspkind = require("lspkind")

				local config = vim.fn["sonokai#get_configuration"]()
				local palette = vim.fn["sonokai#get_palette"](config.style, config.colors_override)
				print(vim.inspect(palette))

				require("luasnip.loaders.from_vscode").lazy_load()

				vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = palette.blue[1] })
				vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE", fg = palette.grey[1], bg = palette.bg_green[1] })

				cmp.setup({
					formatting = {
						format = lspkind.cmp_format({
							mode = "symbol_text",
							menu = {
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								luasnip = "[LuaSnip]",
								nvim_lua = "[Lua]",
								latex_symbols = "[Latex]",
							},
						}),
					},
					mapping = cmp.mapping.preset.insert({
						["<CR>"] = cmp.mapping.confirm({ select = false }),
						["<Tab>"] = cmp_action.luasnip_supertab(),
						["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					}),
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
						end,
					},
					sources = {
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "buffer" },
					},
				})
			end,
		},
		{
			"neovim/nvim-lspconfig",
			cmd = { "LspInfo", "LspInstall", "LspStart" },
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{ "williamboman/mason-lspconfig.nvim" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "aznhe21/actions-preview.nvim" },
			},
			config = function()
				local lsp_zero = require("lsp-zero")
				lsp_zero.extend_lspconfig()

				lsp_zero.on_attach(function(client, bufnr)
					lsp_zero.default_keymaps({ buffer = bufnr })

					vim.lsp.inlay_hint.enable(true)

					vim.api.nvim_create_autocmd("InsertEnter", {
						buffer = bufnr,
						callback = function()
							if vim.lsp.inlay_hint.is_enabled() then
								-- disable the inlay hints
								vim.lsp.inlay_hint.enable(false)
								-- create a single use autocommand to turn the inlay hints back on
								-- when leaving insert mode
								vim.api.nvim_create_autocmd("InsertLeave", {
									buffer = bufnr,
									once = true,
									callback = function()
										vim.lsp.inlay_hint.enable(true)
									end,
								})
							end
						end,
					})

					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts, {
						desc = "LSP rename",
					})
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

					vim.keymap.set("n", "<leader>tl", function()
						require("lsp_lines").toggle()
						vim.diagnostic.config({
							virtual_text = not vim.diagnostic.config().virtual_text,
						})
					end, bufopts)
					vim.keymap.set(
						{ "v", "n" },
						"<leader>ca",
						require("actions-preview").code_actions,
						{ desc = "code action menu", noremap = true, silent = true }
					)
				end)

				require("mason-lspconfig").setup({
					ensure_installed = {},
					handlers = {
						-- this first function is the "default handler"
						-- it applies to every language server without a "custom handler"
						function(server_name)
							require("lspconfig")[server_name].setup({})
						end,

						ts_ls = function()
							require("lspconfig").ts_ls.setup({
								init_options = {
									preferences = {
										includeInlayParameterNameHints = "all",
										includeInlayParameterNameHintsWhenArgumentMatchesName = true,
										includeInlayPropertyDeclarationTypeHints = true,
										includeInlayEnumMemberValueHints = true,
									},
								},
							})
						end,
					},
				})

				vim.fn.sign_define("DiagnosticSignError", { text = "✘ ", texthl = "DiagnosticSignError" })
				vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
				vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
				vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })

				lsp_zero.set_sign_icons({
					error = "✘ ",
					warn = " ",
					hint = "󰌵 ",
					info = " ",
				})

				vim.diagnostic.config({
					update_in_insert = false,
					underline = true,
					severity_sort = true,
					virtual_text = true,
					virtual_lines = false,
				})
			end,
		},
	},
}
