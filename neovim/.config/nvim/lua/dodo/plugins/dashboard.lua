return {
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        init = function()
            require('dodo.configs.alpha').init()
        end
    },
}
