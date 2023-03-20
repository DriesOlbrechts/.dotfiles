return {
    { 
        'TimUntersberger/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        event = 'VimEnter',
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'akinsho/git-conflict.nvim',
        event = 'BufRead',
    },
}
