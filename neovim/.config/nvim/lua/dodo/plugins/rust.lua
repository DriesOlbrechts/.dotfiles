return {
    -- Fork of rust-tools that fixes inline
    "kdarkhan/rust-tools.nvim",
    -- "simrat39/rust-tools.nvim",
    {
        'saecki/crates.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
}
