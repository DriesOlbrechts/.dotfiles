vim.api.nvim_create_user_command("MarkdownToPdf",
    function()
        if (vim.bo.filetype == 'markdown') then
            local file = vim.fn.expand('%')
            vim.api.nvim_command(':!md-to-pdf ' .. file)
        else
            print('Not a markdown file')
        end
    end,
    { nargs = 0 }
)

vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        require('cmp').setup.buffer({ sources = { { name = "crates" } } })
    end,
})

