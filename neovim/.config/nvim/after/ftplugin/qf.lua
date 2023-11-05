function Qf_remove_entry()
	local current = vim.fn.line('.')
	local qflist = vim.fn.getqflist()

	table.remove(qflist, current)

	vim.fn.setqflist(qflist, 'r')

	vim.fn.execute(':' .. current)
end

vim.keymap.set('n', 'dd', Qf_remove_entry, { silent = true, noremap = true, desc = "remove qflist entry" })
