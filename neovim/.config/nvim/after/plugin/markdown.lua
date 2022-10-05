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
