return {
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufReadPre',
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		'sindrets/diffview.nvim',
		keys = {
			{
				"<leader>dv",
				function()
					local lib = require('diffview.lib')
					local view = lib.get_current_view()
					if view then
						-- Current tabpage is a Diffview; close it
						vim.cmd.DiffviewClose()
					else
						-- No open Diffview exists: open a new one
						vim.cmd.DiffviewOpen()
					end
				end,
				desc = "diffview"
			}
		},
		config = function()
			require('diffview').setup()
		end
	},
}
