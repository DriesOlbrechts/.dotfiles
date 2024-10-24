-- Enable highlighting on yank
vim.api.nvim_create_augroup("TextYankPost", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "TextYankPost",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 69,
		})
	end,
	pattern = "*",
	desc = "Highlight yanked text",
})

-- Set *.mdx files to 'markdown' filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.mdx",
	callback = function()
		vim.bo.filetype = "markdown"
	end,
})
