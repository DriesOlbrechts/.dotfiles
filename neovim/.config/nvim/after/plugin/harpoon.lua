require('harpoon').setup({
    -- Sets mark on toggle
    save_on_toggle = true,

    save_on_change = true
})


vim.api.nvim_set_keymap('n', '<leader>hh', '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>',
    { desc = 'Open harpoon quick menu', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>hn', '<CMD>lua require("harpoon.ui").nav_next()<CR>',
    { desc = 'Go to next harpoon mark', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>hp', '<CMD>lua require("harpoon.ui").nav_prev()<CR>',
    { desc = 'Go to previous harpoon mark', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>mf', '<CMD>lua require("harpoon.mark").add_file()<CR>',
    { desc = 'Mark file for harpoon', noremap = true,
        silent = true })
