return {

	{
		"stevearc/oil.nvim",
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

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<Leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
		},
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			buffer = {
				follow_current_file = {
					enabled = true,
				},
			},
		},
	},
}
