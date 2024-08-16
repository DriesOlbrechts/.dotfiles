return {
	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>fe",
				function() require("oil").open_float(vim.fn.getcwd()) end,
				{ desc = "open oil in floating window" }
			},
		},
		config = function()
			-- :help luaref-patterns
			local hidden_list = { "node_modules", "dist", ".git" }

			local function hide_file(name, bufnr)
				for _, pattern in ipairs(hidden_list) do
					if (string.match(name, "^" .. pattern .. "$") ~= nil) then
						return true
					end
				end
				return false
			end

			require("oil").setup({
				columns = {
					"icon",
					"size",
				},
				win_options = {
					wrap = false,
					signcolumn = "no",
					cursorcolumn = false,
					foldcolumn = "0",
				},
				use_default_keymaps = false,
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = "actions.select_vsplit",
					["<C-h>"] = "actions.select_split",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["g."] = "actions.toggle_hidden",
				},
				view_options = {
					is_hidden_file = function(name, bufnr)
						return hide_file(name, bufnr)
					end,
				}
			})
		end
	}
}
