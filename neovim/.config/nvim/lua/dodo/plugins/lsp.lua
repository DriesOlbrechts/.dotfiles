return {
    {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        config = function()
            local cmp = require 'cmp'
            cmp.setup.cmdline('/', {
                completion = {
                    completeopt = 'menu,menuone,noinsert,noselect'
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                completion = {
                    completeopt = 'menu,menuone,noinsert,noselect'
                },
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end

    },
    {
        'L3MON4D3/LuaSnip',
        event = "InsertEnter",
        config = function()
            require('luasnip').config.set_config({
                history = false,
                update_events = 'TextChanged, TextChangedI',
                region_check_events = 'InsertEnter',
            })

            vim.api.nvim_create_autocmd("InsertLeave", {
                callback = function()
                    if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not require("luasnip").session.jump_active then
                        require("luasnip").unlink_current()
                    end
                end,
            })
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            local lsp = require('lsp-zero')
            local lspkind = require('lspkind')
            local cmp = require("cmp");

            lsp.preset('recommended')

            lsp.ensure_installed({
                'tsserver',
                'lua_ls',
                'rust_analyzer',
                'marksman',
            })
            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                local bufopts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

                -- Trouble keybinds
                vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
                    { silent = true, noremap = true, desc = "Toggle trouble diagnostics" }
                )
                vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
                    { silent = true, noremap = true, desc = "Toggle trouble workspace diagnostics" }
                )
                vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
                    { silent = true, noremap = true, desc = "Toggle trouble document diagnostics" }
                )
                vim.keymap.set("n", "<leader>gr", "<cmd>TroubleToggle lsp_references<cr>",
                    { silent = true, noremap = true, desc = "Toggle trouble lsp references" }
                )

                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts, {
                    desc = 'LSP rename',
                    noremap = true,
                    silent = true
                })
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts, {
                    desc = 'Hover doc',
                    noremap = true,
                    silent = true
                })


                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts,
                    { silent = true, noremap = true, desc = "Go to declaration" })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts,
                    { silent = true, noremap = true, desc = "Go to definition" })
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

                vim.keymap.set('n', '<leader>f', "<cmd>LspZeroFormat<cr>",
                    { silent = true, noremap = true, desc = "Format document" })

                vim.keymap.set('n', '<leader>tl', function()
                    require('lsp_lines').toggle()
                    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
                end,
                    bufopts)
            end)

            lsp.nvim_workspace()

            lsp.setup()




            local cmp_config = lsp.defaults.cmp_config({
                    window = {
                        completion = cmp.config.window.bordered({
                            winhighlight = "Normal:Normal,FloatBorder:Border,Search:None",
                            -- zindex = 10,
                        }),
                        documentation = {
                            -- zindex = 1,
                        }

                    },
                    formatting = {
                        format = lspkind.cmp_format({
                            mode = 'symbol',
                            maxwidth = 30,
                            before = function(entry, vim_item)
                                -- ...
                                return vim_item
                            end,
                        })
                    },
                })




            cmp.setup(cmp_config)

            vim.diagnostic.config({
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                virtual_text = true,
                virtual_lines = false,
            })
        end,
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
        event = {"BufReadPre", "BufNewFile"},
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        event = {"BufReadPre", "BufNewFile"},
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
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require('lspsaga').setup({
                symbol_in_winbar = {
                    enable = false
                },
                diagnostic = {
                    on_insert = false
                },
                ui = {
                    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
                },
            })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {
                desc = 'Code action menu',
                noremap = true,
                silent = true
            })
            vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>', {
                desc = 'LSP peek definition',
                noremap = true,
                silent = true
            })
            vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>', {
                desc = 'LSOutlineTogglLSP hover documentation',
                noremap = true,
                silent = true
            })
        end,
        branch = "main",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = { "vue", "typescript" },
                        extra_args = function(params)
                            return params.options
                                and params.options.tabSize
                                and {
                                    "--tab-width",
                                    params.options.tabSize
                                }
                        end,
                    }),
                    null_ls.builtins.formatting.deno_fmt.with({
                        filetypes = { "markdown" }, -- only runs `deno fmt` for markdown

                        extra_args = function(params)
                            return params.options
                                and params.options.tabSize
                                and {
                                    "--tab-width",
                                    params.options.tabSize
                                }
                        end,
                    }),
                }
            })
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
