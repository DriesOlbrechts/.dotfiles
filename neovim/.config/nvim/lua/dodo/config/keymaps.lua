vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.keymap.set({'v'}, '<C-C>', [["+y]], {
    desc = 'Copy to system clipboard',
    noremap = true, silent = true
})
