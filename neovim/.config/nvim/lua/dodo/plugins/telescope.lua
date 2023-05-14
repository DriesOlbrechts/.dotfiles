return {
    {
        'nvim-telescope/telescope.nvim',
        keys = {
            {
                "<leader><leader>",
                function()
                    require("dodo.telescope-config").project_files()
                end,
                desc = "find project files"
            },
            {
                "<leader>F",
                function()
                    require("telescope.builtin").find_files({ hidden = true })
                end,
                desc = "find files, including hidden"
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").find_files({ no_ignore = true })
                end,
                desc = "find files including gitignore"
            },
            {
                "<leader>sp",
                function()
                    require("dodo.telescope-config").project_live_grep()
                end,
                desc = "ripgrep over project"
            },
            { "<leader>gb", ":Telescope git_branches<CR>", desc = "show git branches" },
            { "<leader>gc", ":Telescope git_commits<CR>",  desc = "show commits" },
            { "<leader>fk", ":Telescope keymaps<CR>",      desc = "show keymaps" },
            { "<leader>lf", ":Telescope file_browser<CR>", desc="Browser files with telescope"}

        },
        config = function()
            require('telescope').setup {
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,

                    layout_strategy = "vertical",
                    preview = {
                        height = 0.95,
                        prompt_position = "bottom"
                    },
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-h>"] = "which_key"
                        }
                    }
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                }
            }
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',

            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
        }
    },
}
