return {
	{
		"andweeb/presence.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("presence").setup({
				-- General options
				auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text = "Vscode++", -- Text displayed when hovered over the Neovim image
				main_image = "neovim", -- Main image display (either "neovim" or "file")
				log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = false, -- Displays the current line number instead of the current project
				blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				-- Rich Presence text options
				editing_text = "Pretending to be a developer", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				"*", -- Highlight all files, but customize some others.
				css = { css = true }, -- Enable parsing rgb(...) functions in css.
				--html = { names = false; } -- Disable parsing "names" like Blue or Gray
			}, { RRGGBBAA = true })
		end,
	},
	{
		"Isrothy/neominimap.nvim",
		enabled = true,
		event = { "VimEnter" },
		keys = {
			{ "<leader>nt", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
			{ "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Focus on minimap" },
			{ "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
			{ "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
			{ "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
			{ "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
		},
		config = function()
			vim.opt.wrap = false
			vim.opt.sidescrolloff = 36
			vim.g.neominimap = {
				auto_enable = true, -- Changed to false
				buf_filter = function(bufnr)
					local line_count = vim.api.nvim_buf_line_count(bufnr)
					return line_count < 4096
				end,
				layout = "split",
				split = {
					minimap_width = 20,
					close_if_last_window = true,
				},
			}
		end,
		dependencies = {
			{ "sonokai" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			scope = {
				enabled = false,
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local colors = require("dodo.utils").colors

			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = colors.bg_red })
			require("mini.indentscope").setup({
				draw = {
					delay = 100,
					animation = require("mini.indentscope").gen_animation.linear({
						duration = 100,
						unit = "total",
					}),
					priority = 2,
				},

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Textobjects
					object_scope = "ii",
					object_scope_with_border = "ai",

					goto_top = "[i",
					goto_bottom = "]i",
				},

				-- Options which control scope computation
				options = {
					-- Type of scope's border: which line(s) with smaller indent to
					-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
					border = "both",

					-- Whether to use cursor column when computing reference indent.
					-- Useful to see incremental scopes with horizontal cursor movements.
					indent_at_cursor = true,

					-- Whether to first check input line to be a border of adjacent scope.
					-- Use it if you want to place cursor on function header to get scope of
					-- its body.
					try_as_border = false,
				},

				-- Which character to use for drawing scope indicator
				symbol = "│",
			})
		end,
	},
	dependencies = {
		{ "sonokai" },
	},
}
