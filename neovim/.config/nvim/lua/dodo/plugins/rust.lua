return {
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        config = function()
            local rust_lsp = require('lsp-zero').build_options('rust_analyzer', {})
            require('rust-tools').setup({server = rust_lsp})
        end,
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
