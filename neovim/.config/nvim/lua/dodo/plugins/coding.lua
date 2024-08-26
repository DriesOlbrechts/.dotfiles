return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "ConformInfo" },
		config = function()
			local prettierConf = { "prettierd", "prettier", stop_after_first = true }
			require("conform").setup({

				formatters_by_ft = {
					vue = prettierConf,
					javascript = prettierConf,
					typescript = prettierConf,
					typescriptreact = prettierConf,
					css = prettierConf,
					scss = prettierConf,
					html = prettierConf,
					json = prettierConf,
					markdown = prettierConf,
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
					quiet = true,
				},
			})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_fallback = true, range = range })
			end, { range = true })
		end,
		keys = {
			{
				"<leader>fb",
				function()
					vim.cmd("Format")
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		keys = {
			{
				"<leader>xt",
				"<CMD>Trouble todo toggle<CR>",
				desc = "Open todos in Trouble",
				noremap = true,
				silent = true,
			},
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
