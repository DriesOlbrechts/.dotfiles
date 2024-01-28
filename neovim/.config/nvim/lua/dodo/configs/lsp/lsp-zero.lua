local lsp = require('lsp-zero')
local cmp = require("cmp")
local lspkind = require('lspkind')

lsp.preset('recommended')
lsp.ensure_installed({
	'tsserver',
	'lua_ls',
	'clangd',
	'gopls',
	'volar'
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts, {
		desc = "LSP rename",
	})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts, { desc = "Hover doc" })

	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts,
		{ silent = true, noremap = true, desc = "Go to declaration" })

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts,
		{ silent = true, noremap = true, desc = "Go to definition" })

	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set('n', '<leader>tl', function()
			require('lsp_lines').toggle()
			vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
		end,
		bufopts)

	vim.keymap.set('n', '<leader>fb', "<cmd>LspZeroFormat<cr>",
		{ silent = true, noremap = true, desc = "Format document" })

	-- diagnostics
	vim.keymap.set('n', '<leader>bd', function()
			vim.diagnostic.setloclist({ open = true })
		end,
		{ silent = true, noremap = true, desc = "show buffer diagnostics in loclist" })
	vim.keymap.set('n', '<leader>wd', function()
		vim.diagnostic.setqflist({ open = true })
	end, { silent = true, noremap = true, desc = "show workspace diagnostics in qflist" })
end)

lsp.nvim_workspace()

lsp.set_sign_icons({
	error = '✘',
	warn = ' ▲',
	hint = ' ⚑',
	info = ' »'
})

lsp.setup()

local cmp_config = lsp.defaults.cmp_config({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:Border,Search:None"
		})
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			menu = "",
		})
	},
})

cmp.setup(cmp_config)

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = true,
	virtual_lines = false,
})
