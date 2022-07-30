-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- jk to Escape 
vim.keymap.set({'!'}, 'jk', [[<c-\><c-n>]], {})

-- CTRL + SHIFT + C copy
vim.keymap.set({'v'}, '<C-C>', [["+y]], {
    desc = 'Copy to system clipboard',
    noremap = true, silent = true
})
