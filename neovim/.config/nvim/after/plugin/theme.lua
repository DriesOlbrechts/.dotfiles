vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_better_perofrmance = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

vim.cmd("colorscheme gruvbox-material")
vim.cmd("hi Normal guibg=None  ctermbg=None")



vim.cmd[[highlight CodeBlock guibg=#45403d]]
vim.cmd[[highlight markdownH1 guibg=#4c3432]]
vim.cmd[[highlight markdownH2 guibg=#4f321f]]
vim.cmd[[highlight markdownH3 guibg=#4f422e]]
vim.cmd[[highlight markdownH4 guibg=#3b4439]]
vim.cmd[[highlight markdownH5 guibg=#374141]]
vim.cmd[[highlight markdownH6 guibg=#6e5159]]


require('headlines').setup({
    markdown = {
        fat_headlines = false,
        headline_highlights = {"markdownH1", "markdownH2", "markdownH3" ,
                               "markdownH4", "markdownH5", "markdownH6"},
        codeblock_highlight = "CodeBlock",
        dash_highlight = "markdownRule",
        quote_highlight = "markdownBlockQuote"
    }
})
