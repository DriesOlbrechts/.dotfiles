return {
	{
		'goolord/alpha-nvim',
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
				'                                  ████████                                ',
				'                              ████▒▒▒▒▒▒▒▒████                            ',
				'                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                          ',
				'                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
				'                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ',
				'                        ██      ▒▒▒▒▒▒▒▒▒▒▒▒      ██                      ',
				'                        ██        ████████        ██                      ',
				'                        ██    ██  ████████  ██    ██                      ',
				'                        ██▒▒      ████████      ▒▒██                      ',
				'                          ██▒▒▒▒  ████████  ▒▒▒▒██                        ',
				'                          ██▒▒▒▒▒▒████████▒▒▒▒▒▒██                        ',
				'                            ██▒▒▒▒▒▒████▒▒▒▒▒▒██                          ',
				'                          ██  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ██                        ',
				'                        ██▓▓  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▓▓                        ',
				'                        ██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██                      ',
				'                        ██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██                      ',
				'                        ██▓▓██▒▒▒▒▒▒████▒▒▒▒▒▒██▓▓██                      ',
				'                      ▓▓▓▓██▓▓██████▓▓▓▓██████▓▓██▓▓▓▓                    ',
				'                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                    ',
				'                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                    ',
				'                                ██▒▒▒▒▒▒▒▒██                              ',
				'                                  ██▒▒▒▒██                                ',
				'                                    ████                                  ',
				'                                                                          ',
				'                                *Chirp Chirp*                             ',
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  > Find file", ":cd $HOME/Documents/projects | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}

			-- Set footer
			vim.api.nvim_create_autocmd("User", {
				pattern = "",
				callback = function()
					local stats = require('lazy').stats()
					local startup = stats.startuptime
					local plugins = stats.count
					local loaded = stats.loaded
					local v = vim.version()
					local datetime = os.date " %d-%m-%Y   %H:%M:%S"
					local platform = vim.fn.has "win32" == 1 and "" or ""
					dashboard.section.footer.val = string.format("⚡ %d 󰂕 %d/%d   v%d.%d.%d %s  %s", startup,
						loaded, plugins, v.major, v.minor, v.patch, platform,
						datetime)
					pcall(vim.cmd.AlphaRedraw)
				end
			})

			-- Send config to alpha

			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end
	},
}
