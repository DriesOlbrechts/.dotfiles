local M = {}

M.config = function()
    require("nvim-autopairs").setup {
        check_ts = true,
    }
end

return M
