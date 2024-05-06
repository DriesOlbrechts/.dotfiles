local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()


lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts, {
		desc = "LSP rename",
	})
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

	vim.keymap.set('n', '<leader>tl', function()
			require('lsp_lines').toggle()
			vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
		end,
		bufopts)
	vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions,
		{ desc = "code action menu", noremap = true, silent = true })
end
)
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		-- this first function is the "default handler"
		-- it applies to every language server without a "custom handler"
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	}
})

lsp_zero.set_sign_icons({
	error = '✘',
	warn = ' ▲',
	hint = ' ⚑',
	info = ' »'
})

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = true,
	virtual_lines = false,
})
