-- quickfix window
--
function ToggleQuickfix()
    if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
        vim.cmd('copen')
    else
        vim.cmd('cclose')
    end
end

local function qf_remove_entry()
	 local current = vim.api.line('.')
	 local qflist = vim.api.getqflist()

	vim.api.remove(qflist, current - 1)
	vim.api.setqflist(qflist, 'r')
	vim.api.execute("':' . current")
end



vim.keymap.set('n', '<leader>q', ToggleQuickfix, { silent = true, noremap = true, desc = "toggle qflist" })

