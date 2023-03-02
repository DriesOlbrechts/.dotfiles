return {
    'andweeb/presence.nvim',
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    "ekickx/clipboard-image.nvim",
    { 'anuvyklack/fold-preview.nvim',
        dependencies = 'anuvyklack/keymap-amend.nvim',
        config = function()
            require('fold-preview').setup()
        end
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter"
    }
}

