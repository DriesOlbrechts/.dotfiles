-- Get all LSP server configurations from the /lsp directory
local function get_configured_servers()
	local servers = {}
	local lsp_path = vim.fn.stdpath("config") .. "/lsp"

	if vim.fn.isdirectory(lsp_path) == 0 then
		vim.notify("LSP configuration directory not found: " .. lsp_path, vim.log.levels.WARN)
		return servers
	end

	local files = vim.fn.glob(lsp_path .. "/*.lua", false, true)

	for _, file in ipairs(files) do
		-- Extract server name from filename (remove path and .lua extension)
		local server_name = vim.fn.fnamemodify(file, ":t:r")
		-- Skip init.lua if it exists
		if server_name ~= "init" then
			table.insert(servers, server_name)
		end
	end

	return servers
end

local servers_to_enable = vim.iter(get_configured_servers())
	:filter(function(server_name)
		local config = vim.lsp.config[server_name]
		if not config then
			vim.notify('no LSP configuration found for "' .. server_name .. '"', vim.log.levels.WARN)
			return false
		end
		if (not config.cmd) or vim.tbl_isempty(config.cmd) then
			vim.notify('missing `cmd` in LSP configuration for "' .. server_name .. '"', vim.log.levels.WARN)
			return false
		end
		return vim.fn.executable(config.cmd[1]) == 1
	end)
	:totable()

vim.lsp.enable(servers_to_enable)

vim.fn.sign_define("DiagnosticSignError", { text = "✘ ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = true,
	virtual_lines = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘ ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = "󰌵 ",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
		},
	},
})


vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("dodo.lsp.on_attach", { clear = true }),
	callback = function(event)
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, buffer, {
				convert = function(...)
					return { menu = "  " }
				end,
			})
		end
		vim.lsp.inlay_hint.enable(true)
		local bufopts = { noremap = true, silent = true, buffer = buffer }

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts, {
			desc = "LSP rename",
		})

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts, { desc = "show diagnostics popup window" })

		vim.keymap.set(
			{ "v", "n" },
			"<leader>ca",
			require("tiny-code-action").code_action,
			{ desc = "code action menu", noremap = true, silent = true }
		)

		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts, { desc = "jump to definition" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts, { desc = "list references" })
	end,
})
