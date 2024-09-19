local M = {}

local config = vim.fn["sonokai#get_configuration"]()
local palette = vim.fn["sonokai#get_palette"](config.style, config.colors_override)

local colors = M.colors or {}

if next(colors) == nil then
	for k, v in pairs(palette) do
		colors[k] = v[1]
	end
	M.colors = colors
end

M.setup = function()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local colors_picker = function(opts)
		opts = opts or {}
		pickers
			.new(opts, {
				prompt_title = "Colors",
				finder = finders.new_table({
					results = vim.tbl_map(function(k)
						return { k, colors[k] }
					end, vim.tbl_keys(colors)),
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry[1] .. ": " .. vim.inspect(entry[2]),
							ordinal = entry[1],
						}
					end,
				}),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						print(vim.inspect(selection.value))
						-- You can add more actions here, like copying the color to clipboard
					end)
					return true
				end,
			})
			:find()
	end

	vim.api.nvim_create_user_command("TelescopePalette", colors_picker, {})
end

return M
