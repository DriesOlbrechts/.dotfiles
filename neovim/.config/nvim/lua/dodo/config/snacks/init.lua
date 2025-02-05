local req = function(file)
	return require('dodo.config.snacks.' .. file)
end
local M = {
	pickers = req('pickers'),
	git = req('git')
}

return M
