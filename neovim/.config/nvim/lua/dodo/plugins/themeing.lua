return {

    -- {
    --     'sainnhe/gruvbox-material',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruvbox_material_background = 'medium'
    --         vim.g.gruvbox_material_foreground = 'material'
    --         vim.g.gruvbox_material_better_perofrmance = 1
    --         vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    --
    --         vim.cmd("colorscheme gruvbox-material")
    --         vim.cmd("hi Normal guibg=None  ctermbg=None")
    --
    --         vim.cmd [[highlight CodeBlock guibg=#45403d]]
    --         vim.cmd [[highlight markdownH1 guibg=#4c3432]]
    --         vim.cmd [[highlight markdownH2 guibg=#4f321f]]
    --         vim.cmd [[highlight markdownH3 guibg=#4f422e]]
    --         vim.cmd [[highlight markdownH4 guibg=#3b4439]]
    --         vim.cmd [[highlight markdownH5 guibg=#374141]]
    --         vim.cmd [[highlight markdownH6 guibg=#6e5159]]
    --     end
    -- },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = "mocha",
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                term_colors = false,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                integrations = {
                    cmp = true,
                    treesitter = true,
                    treesitter_context = true,
                    mason = true,
                    ts_rainbow = true,
                    gitsigns = true,
                    telescope = true,
                    neotree = true,
                    headlines = true,
                    markdown = true,
                    lsp_trouble = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    }
                }
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require 'colorizer'.setup({
                '*',                   -- Highlight all files, but customize some others.
                css = { css = true, }, -- Enable parsing rgb(...) functions in css.
                --html = { names = false; } -- Disable parsing "names" like Blue or Gray
            }, { RRGGBBAA = true })
        end
    },
    {
        'lukas-reineke/headlines.nvim',
        ft = { 'markdown', 'org' },
        config = function()
            require('headlines').setup({
                markdown = {
                    headline_highlights = {
                        "Headline1",
                        "Headline2",
                        "Headline3",
                        "Headline4",
                        "Headline5",
                        "Headline6",
                    },
                    code_block_highlight = "CodeBlock",
                    dash_highlight = "Dash",
                    quote_highlight = "Quote",
                }
            })
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require("indent_blankline").setup({
                space_char_blankline = " ",
                show_current_context = true,
            })
        end,
    },
}
