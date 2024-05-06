local function req(file) require("dodo.configs.completion." .. file) end
return {
	{
		'L3MON4D3/LuaSnip',
		dependencies = {'rafamadriz/friendly-snippets'},
		lazy=true,
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require('luasnip').config.set_config({
				history = false,
				update_events = 'TextChanged, TextChangedI',
				region_check_events = 'InsertEnter',
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				callback = function()
					if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
						and not require("luasnip").session.jump_active then
						require("luasnip").unlink_current()
					end
				end,
			})
		end,
	},
	{
		"hrsh7th/cmp-cmdline",
		lazy=true,
        event = "CmdlineEnter",
		config = function ()
			req("cmp-cmdline")
		end
	},
}
