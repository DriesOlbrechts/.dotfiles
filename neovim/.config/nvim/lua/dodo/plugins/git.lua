return {
    { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    { 'akinsho/git-conflict.nvim' },
}
