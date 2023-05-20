-- quickfix window
--
function ToggleQuickfix()
    if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
        vim.cmd('copen')
    else
        vim.cmd('cclose')
    end
end

vim.keymap.set('n', '<leader>q', ToggleQuickfix, { silent = true, noremap = true, desc = "toggle qflist" })

