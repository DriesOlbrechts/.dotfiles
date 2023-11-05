vim.api.nvim_create_user_command("Messages",
	function()
		local msg = vim.api.nvim_exec2("messages", { output = true })
		local output = vim.split(msg.output, "\n")
		vim.cmd("new")
		vim.api.nvim_buf_set_lines(0, 0, 0, false, output)
	end,
	{ desc = "messages in buffer" }
)
