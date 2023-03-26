return {

    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function()
            local git_blame = require('gitblame')
            require('lualine').setup {

                options = { theme = 'catppuccin' },
                sections = {
                    lualine_c = {
                        'filename',
                        { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
                    }
                }
            }
        end,
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'yamatsum/nvim-cursorline',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require("nvim-cursorline").setup {
                cursorline = {
                    enable = true,
                    timeout = 0,
                    number = false
                },
                cursorword = {
                    enable = true,
                    min_length = 2,
                    hl = { underline = true }
                }
            }
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                rainbow = {
                    enable = true,
                    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil, -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                },
            }
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
            { '<leader>nt' , "<cmd>Neotree toggle<cr>", desc = "open neotree"}
        },
        config = function()
            -- Unless you are still migrating, remove the deprecated commands from v1.x
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

            -- If you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint",
                { text = "", texthl = "DiagnosticSignHint" })
            -- NOTE: this is changed from v1.x, which used the old style of highlight groups
            -- in the form "LspDiagnosticsSignWarning"
            require("neo-tree").setup({
                default_component_configs = {
                    close_if_last_window = true,
                    popup_border_style = "rounded",
                    enable_git_status = true,
                    enable_diagnostics = true,
                    modified = {
                        symbol = "*",
                        highlight = "NeoTreeModified",
                    },
                    indent = {
                        padding = 0,
                        with_expanders = false
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                        default = "",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted   = "✖", -- this can only be used in the git_status source
                            renamed   = "", -- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored   = "",
                            unstaged  = "",
                            staged    = "",
                            conflict  = "",
                        }
                    }
                },
                window = {
                    position = "right",
                    width = 25,
                },
                filesystem = {
                    filtered_items = {
                        visible = false,
                        hide_dotfiles = false,
                        hide_by_name = {
                            "node_modules",
                            ".DS_Store",
                            "thumbs.db",
                            "__pycache"
                        },
                    },
                    follow_current_file = true,
                    hijack_netrw_behavior = "open_current",
                    use_libuv_file_watcher = true,
                },
                git_status = {
                    window = {
                        position = "float"
                    },
                },
                event_handlers = {
                    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
                },
            })

            
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
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    },
}
