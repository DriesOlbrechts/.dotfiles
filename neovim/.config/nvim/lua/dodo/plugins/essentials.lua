return {

    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function()
            require('dodo.configs.lualine').config()
        end,
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'yamatsum/nvim-cursorline',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('dodo.configs.cursorline').config()
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('dodo.configs.treesitter').config()
        end,
        build = ':TSUpdate'
    },
    {
        "p00f/nvim-ts-rainbow",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('Comment').setup()
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { '<leader>nt', "<cmd>Neotree toggle<cr>", desc = "open neotree" }
        },
        config = function()
            require('dodo.configs.neotree').config()
        end,
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require('dodo.configs.nvim-autopairs').config()
        end
    },

}
