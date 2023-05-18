set nocompatible
set confirm
set undofile
set undodir=~/.vim/undo

set noerrorbells

set title
set titlestring=%<%F%=%l/%L-%P

set noswapfile
set mouse=a
set updatetime=69
set completeopt=menu,menuone,preview,noinsert,noselect
set ignorecase
set smartcase
set termguicolors
set cursorline
set guicursor=a:block,i:ver20,v-r:hor20
set nohlsearch
set laststatus=3
set list
set listchars=tab:│\ ,trail:· 
set number
set relativenumber
set scrolloff=8


set signcolumn=yes
set colorcolumn=80
set splitbelow
set splitright
set autoindent
set breakindent
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set textwidth=100
set nowrap
set formatoptions=crqn2lj
set tildeop
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

syntax on
filetype on

let g:netrw_liststyle=1

let g:mapleader=" "


nn <Leader>ff :find 
vn <C-C> "+y

if !has("nvim")
    colorscheme catppuccin
endif
