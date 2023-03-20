return {
    {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",

    },
    {
        'VonHeikemen/lsp-zero.nvim',
        event = "BufEnter",
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
            },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    {
        "onsails/lspkind-nvim",
        event = "BufEnter",
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        event = "BufEnter",
    },
    {
        url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons"
    },
    {
        "glepnir/lspsaga.nvim",
        event = "BufEnter",
        branch = "main",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
