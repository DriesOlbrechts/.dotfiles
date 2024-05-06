local lsp_zero = require('lsp-zero')
lsp_zero.extend_cmp()

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()



cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			menu = "",
		})
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:Border,Search:None"
		}),

	}
})
