local a = false
-- following option will hide the buffer when it is closed instead of deleting
-- the buffer. This is important to reuse the last terminal buffer
-- IF the option is not set, plugin will open a new terminal every single time
vim.o.hidden = true
require('nvim-terminal').setup({
    -- keymap to disable all the default keymaps
    disable_default_keymaps = true,

})
vim.keymap.set('n', '<leader>t',
    function()
        NTGlobal["terminal"]:toggle()
        toggleTermLineCount()
    end, { desc = 'Toggles terminal window', noremap = true, silent = true })

function toggleTermLineCount()
    if not a then
        vim.api.nvim_command(':setlocal nonumber norelativenumber')
        vim.api.nvim_command(':setlocal signcolumn=no')
        a = true
    else
        a = false
    end
end
