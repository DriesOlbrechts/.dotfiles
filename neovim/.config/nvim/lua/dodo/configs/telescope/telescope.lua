require('telescope').setup {
	defaults = {
		layout_strategy = "vertical",
		preview = {
			height = 0.95,
			prompt_position = "bottom"
		},
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	}
}
