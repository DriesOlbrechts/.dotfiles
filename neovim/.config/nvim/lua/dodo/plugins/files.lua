return {

	{
		"stevearc/oil.nvim",
		-- dir = "/home/dries/Documents/projects/neovim-plugins/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>fe",
				function()
					local oil = require("oil")
					oil.open_float()
					vim.wait(1000, function()
						return oil.get_cursor_entry() ~= nil
					end)
					if oil.get_cursor_entry() then
						oil.open_preview()
					end
					-- oil.open_parent_dir()
				end,
				{ desc = "open oil in floating window" },
			},
			{
				"<leader>fr",
				function()
					require("oil").open_float(vim.fn.getcwd())
				end,
			},
		},
		config = function()
			-- :help luaref-patterns
			local hidden_list = { "node_modules", "dist", ".git" }

			local function hide_file(name, bufnr)
				for _, pattern in ipairs(hidden_list) do
					if string.match(name, "^" .. pattern .. "$") ~= nil then
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
					["<C-l>"] = "actions.select",
					["<C-h>"] = "actions.parent",
					["<C-s>"] = "actions.select_vsplit",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["_"] = "actions.open_cwd",
					["g."] = "actions.toggle_hidden",
				},
				view_options = {
					is_hidden_file = function(name, bufnr)
						return hide_file(name, bufnr)
					end,
				},
			})
		end,
	},
}
