return {
    {
        'TimUntersberger/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        lazy = false,
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
        config = function()
            require("git-conflict").setup({
                default_mappings = true, -- disable buffer local mapping created by this plugin
                disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
                highlights = { -- They must have background color, otherwise the default color will be used
                    incoming = 'DiffChange',
                    current = 'DiffAdd',
                }
            })
        end,
        event = 'BufRead',
    },
}
