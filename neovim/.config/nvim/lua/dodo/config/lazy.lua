local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })

        vim.notify("Installed lazy.")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
        defaults = {
                lazy = true,
        },
        spec = {
                {import = "dodo.plugins"},
        },
        install = {
                missing = true,
                colorscheme = { "catppuccin" }
        },
        performance = {
                cache = {
                        enabled = true,
                },
                rtp = {
                        disabled_plugins = {
                                "gzip",
                                "tar",
                                "tarPlugin",
                                "zip",
                                "zipPlugin",
                                "tutor_mode_plugin",
                                "tutor",
                                "vimball",
                                "vimballPlugin",
                                "bugreport",
                                "fzf",
                        },
                },
        },
})
