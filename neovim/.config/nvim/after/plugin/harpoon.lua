require('harpoon').setup({
    -- Sets mark on toggle
    save_on_toggle = true,

    save_on_change = true
})


vim.api.nvim_set_keymap('n', '<leader>mm', '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>',
    { desc = 'Open harpoon quick menu', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>mn', '<CMD>lua require("harpoon.ui").nav_next()<CR>',
    { desc = 'Open harpoon quick menu', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>mp', '<CMD>lua require("harpoon.ui").nav_prev()<CR>',
    { desc = 'Open harpoon quick menu', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>fm', '<CMD>lua require("telescope.builtin").marks()<CR>',
    { desc = 'Open harpoon quick menu', noremap = true,
        silent = true })

vim.api.nvim_set_keymap('n', '<leader>mf', '<CMD>lua require("harpoon.mark").add_file()<CR>',
    { desc = 'Open harpoon quick menu', noremap = true,
        silent = true })
