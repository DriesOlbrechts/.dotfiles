local lsp = require('lsp-zero')
local lspkind = require('lspkind')
local cmp = require("cmp");

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'lua_ls',
    'rust_analyzer',
    'html',
    'cssls',
    'bashls',
    'marksman',
    'volar',
    'emmet_ls'
})

local rust_lsp = lsp.build_options('rust_analyzer', {})

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


local tabnine = require('cmp_tabnine.config')

tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = {
        -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    },
    show_prediction_strength = false
})

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}



local cmp_config = lsp.defaults.cmp_config({
        -- preselect = 'none',
        sources = {
            { name = 'cmp_tabnine' },

            --- These are the default sources for lsp-zero
            { name = 'path' },
            { name = 'nvim_lsp',   keyword_length = 3 },
            { name = 'buffer',     keyword_length = 3 },
            { name = 'luasnip',    keyword_length = 2 },
        },
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
            -- format = lspkind.cmp_format({
            --     mode = 'symbol',
            --     maxwidth = 30,
            --     before = function(entry, vim_item)
            --         if entry.source.name == "cmp_tabnine" then
            --             vim_item.kind = ""
            --         end
            --         -- ...
            --         return vim_item
            --     nd,
            -- })
            format = function(entry, vim_item)
                -- if you have lspkind installed, you can use it like
                -- in the following line:
                vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
                if entry.source.name == "cmp_tabnine" then
                    vim_item.kind = ""
                    vim_item.kind_hl_group = "TabNine"
                end
                return vim_item
            end,
        },
    })


-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})


-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
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


cmp.setup(cmp_config)
require('rust-tools').setup({ server = rust_lsp })

vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    virtual_text = true,
    virtual_lines = false,
})
