local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup("dodo.plugins", {
    defaults = {
        lazy = true,
    },
    install = { colorscheme = { "gruvbox" } },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
            },
        },
    },
})