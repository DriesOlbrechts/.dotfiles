return {
	{
		'andweeb/presence.nvim',
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("presence").setup({
				-- General options
				auto_update         = true,               -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text   = "Vscode++",         -- Text displayed when hovered over the Neovim image
				main_image          = "neovim",           -- Main image display (either "neovim" or "file")
				log_level           = nil,                -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout    = 10,                 -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number  = false,              -- Displays the current line number instead of the current project
				blacklist           = {},                 -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons             = true,               -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets         = {},                 -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				-- Rich Presence text options
				editing_text        = "Pretending to be a developer", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text  = "Browsing %s",      -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text        = "Reading %s",       -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text      = "Working on %s",    -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	},
	{
		'norcalli/nvim-colorizer.lua',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require 'colorizer'.setup({
				'*',       -- Highlight all files, but customize some others.
				css = { css = true, }, -- Enable parsing rgb(...) functions in css.
				--html = { names = false; } -- Disable parsing "names" like Blue or Gray
			}, { RRGGBBAA = true })
		end
	},
	{
		"Isrothy/neominimap.nvim",
		enabled = false,
		event = { "VimEnter" },
		keys = {
			{ "<leader>nt",  "<cmd>Neominimap toggle<cr>",      desc = "Toggle minimap" },
			{ "<leader>ns",  "<cmd>Neominimap toggleFocus<cr>", desc = "Focus on minimap" },
			{ "<leader>nwt", "<cmd>Neominimap winToggle<cr>",   desc = "Toggle minimap for current window" },
			{ "<leader>nwr", "<cmd>Neominimap winRefresh<cr>",  desc = "Refresh minimap for current window" },
			{ "<leader>nbt", "<cmd>Neominimap bufToggle<cr>",   desc = "Toggle minimap for current buffer" },
			{ "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>",  desc = "Refresh minimap for current buffer" },
		},
		init = function()
			vim.opt.wrap = false
			vim.opt.sidescrolloff = 36
			vim.g.neominimap = {
				auto_enable = true, -- Changed to false
				buf_filter = function(bufnr)
					local line_count = vim.api.nvim_buf_line_count(bufnr)
					return line_count < 4096
				end,
			}

			local function update_minimap()
				local current_win = vim.api.nvim_get_current_win()
				local wins = vim.api.nvim_list_wins()
				for _, win in ipairs(wins) do
					if vim.api.nvim_win_is_valid(win) then
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.api.nvim_buf_is_valid(buf) then
							local bt = vim.bo[buf].buftype
							local ft = vim.bo[buf].filetype
							if bt == "" and ft ~= "" then
								if win == current_win then
									pcall(require('neominimap').winOn, { win })
								else
									pcall(require('neominimap').winOff, { win })
								end
							end
						end
					end
				end
			end

			vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "VimEnter" }, {
				callback = update_minimap
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
			{ "<Leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" }
		}
	},
}
