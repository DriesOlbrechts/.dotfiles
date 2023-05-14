return {
	{
		'numToStr/Comment.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			require('Comment').setup()
		end
	},
	    {
        "kylechui/nvim-surround",
        event = {"BufReadPre", "BufNewFile"},
        config = function()
            require("nvim-surround").setup()
        end
    },
}
