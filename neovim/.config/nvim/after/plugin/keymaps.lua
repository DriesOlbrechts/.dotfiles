-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- jk to Escape 
vim.keymap.set({'!'}, 'jk', [[<c-\><c-n>]], {})


-- no arrow keys - do it the right way you monster
vim.keymap.set({'', '!', 'l', 't'} , "<Up>", "<Nop>")
vim.keymap.set({'', '!', 'l', 't'} , "<Right>", "<Nop>")
vim.keymap.set({'', '!', 'l', 't'} , "<Left>", "<Nop>")
vim.keymap.set({'', '!', 'l', 't'} , "<Down>", "<Nop>")
-- CTRL + SHIFT + C copy
vim.keymap.set({'v'}, '<C-C>', [["+y]], {
    desc = 'Copy to system clipboard',
    noremap = true, silent = true
})
