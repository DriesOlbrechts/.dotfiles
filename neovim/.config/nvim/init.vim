lua vim.loader.enable()

source ~/.vimrc
set undodir=~/.config/nvim/undo

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=999
set foldcolumn=2
set fillchars=eob:\ ,fold:\ ,foldopen:,foldsep:\ ,foldclose:

au TextYankPost * silent! lua vim.highlight.on_yank ({timeout=69})

lua require('dodo.plugins')
