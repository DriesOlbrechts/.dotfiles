local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'sumneko_lua',
    'rust_analyzer',
    'html',
    'bashls',
    'marksman',
    'volar',
    'emmet_ls'
})
local rust_lsp = lsp.build_options('rust_analyzer', {})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>CodeActionMenu<cr>', {
        desc = 'Code action menu',
        noremap = true, silent = true
    })

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
        { silent = true, noremap = true, desc = "Go to declaration"})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts,
        {silent = true, noremap = true, desc = "Go to definition"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts, 
        { silent = true, noremap = true, desc = "Show docs"})
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

require('rust-tools').setup({ server = rust_lsp })

vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    virtual_text = true,
    virtual_lines = false,
})
