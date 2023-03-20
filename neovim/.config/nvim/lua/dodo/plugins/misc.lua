return {
    {
        'andweeb/presence.nvim',
        event = 'VimEnter',
    },
    {
        "kylechui/nvim-surround",
        event = "BufEnter",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        ft="md",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "ekickx/clipboard-image.nvim",
        ft="md",
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter"
    }
}

