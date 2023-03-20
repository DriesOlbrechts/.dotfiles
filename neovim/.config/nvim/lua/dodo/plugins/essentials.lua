return {
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        event = 'VimEnter',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'yamatsum/nvim-cursorline',
        event = 'BufEnter',
    },

    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        event = 'VimEnter',
        build = 'make'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        build = ':TSUpdate'
    },
    {
        "p00f/nvim-ts-rainbow",
        event = "BufEnter",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufEnter",
    },
    {
        'numToStr/Comment.nvim',
        event = 'BufEnter',
        config = function()
            require('Comment').setup()
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        event = "VimEnter",
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
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    },
}
