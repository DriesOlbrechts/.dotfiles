require('lspsaga').setup({
    symbol_in_winbar = {
        enable = false
    },
    diagnostic = {
        on_insert = false
    }
})
vim.keymap.set({'n', 'v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
    desc = 'Code action menu',
    noremap = true, silent = true
})
vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>', {
    desc = 'LSP peek definition',
    noremap = true, silent = true
})
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>', {
    desc = 'LSOutlineTogglLSP hover documentation',
    noremap = true, silent = true
})
