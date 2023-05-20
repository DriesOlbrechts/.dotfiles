vim.api.nvim_create_user_command("Messages",
	function()
		local msg = vim.api.nvim_command_output("messages")
		local output = vim.split(msg, "\n")
		vim.cmd("new")
		vim.api.nvim_buf_set_lines(0, 0, 0, false, output)
	end,
	{ desc = "messages in buffer" }
)
