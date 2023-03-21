return {
    {
        "simrat39/rust-tools.nvim",
        event = "BufEnter ^(?!alpha)",
    },
    {
        'saecki/crates.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'BufEnter Cargo.toml',
        config = function()
            require('crates').setup()
        end,
    },
}
