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
		event = { "BufReadPre", "BufNewFile" },
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
	{
		"ziontee113/color-picker.nvim",
		keys = {
			{
				"<leader>cp",
				"<cmd>PickColor<cr>",
				desc = "Open color picker",
				noremap = true,
				silent = true,
			},
		},
		opts = {
			icons = { "", "" },
		},
	},
	{
		"philosofonusus/ecolog.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp", -- Optional: for autocompletion support (recommended)
		},
		-- Optional: you can add some keybindings
		-- (I personally use lspsaga so check out lspsaga integration or lsp integration for a smoother experience without separate keybindings)
		keys = {
			{ "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
			{ "<leader>ep", "<cmd>EcologShelterLinePeek<cr>", desc = "Ecolog peek variable" },
			{ "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
		},
		-- Lazy loading is done internally
		lazy = false,
		opts = {
			integrations = {
				-- WARNING: for both cmp integrations see readme section below
				nvim_cmp = true, -- If you dont plan to use nvim_cmp set to false, enabled by default
				-- If you are planning to use blink cmp uncomment this line
				-- blink_cmp = true,
			},
			-- Enables shelter mode for sensitive values
			shelter = {
				configuration = {
					-- Partial mode configuration:
					-- false: completely mask values (default)
					-- true: use default partial masking settings
					-- table: customize partial masking
					-- partial_mode = false,
					-- or with custom settings:
					partial_mode = {
						show_start = 3, -- Show first 3 characters
						show_end = 3, -- Show last 3 characters
						min_mask = 3, -- Minimum masked characters
					},
					mask_char = "*", -- Character used for masking
				},
				modules = {
					cmp = false, -- Enabled to mask values in completion
					peek = false, -- Enable to mask values in peek view
					files = false, -- Enabled to mask values in file buffers
					telescope = false, -- Enable to mask values in telescope integration
					telescope_previewer = false, -- Enable to mask values in telescope preview buffers
					fzf = false, -- Enable to mask values in fzf picker
					fzf_previewer = false, -- Enable to mask values in fzf preview buffers
					snacks_previewer = false, -- Enable to mask values in snacks previewer
					snacks = false, -- Enable to mask values in snacks picker
				},
			},
			-- true by default, enables built-in types (database_url, url, etc.)
			types = true,
			path = vim.fn.getcwd(), -- Path to search for .env files
			preferred_environment = "development", -- Optional: prioritize specific env files
			-- Controls how environment variables are extracted from code and how cmp works
			provider_patterns = true, -- true by default, when false will not check provider patterns
		},
	},
}
