source ~/.vimrc
set undodir=~/.config/nvim/undo

au TextYankPost * silent! lua vim.highlight.on_yank ({timeout=69})

lua require('dodo.plugins')
