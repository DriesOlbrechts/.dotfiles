local opt = vim.opt

vim.cmd.colorscheme('catppuccin')

opt.termguicolors = true
opt.compatible = false

opt.confirm = true

opt.undofile = true
opt.undodir = os.getenv("HOME") .. '/.config/nvim/undo'
opt.undolevels = 10000

opt.errorbells = false

opt.title = true
opt.titlestring = '%<%F%=%l/%L-%P'

opt.swapfile = false
opt.mouse = 'a'
opt.updatetime = 69
opt.completeopt = 'menu,menuone,preview,noinsert,noselect'
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.guicursor = 'a:block,i:ver20,v-r:hor20'
opt.hlsearch = false
opt.list = true
opt.listchars = {
	tab = '| ',
	trail = '.'
}
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

opt.laststatus = 3
opt.showmode = false


opt.colorcolumn = '100'
opt.signcolumn = 'yes'
opt.splitbelow = true
opt.splitright = true
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.textwidth = 100
opt.wrap = false
opt.formatoptions = 'crqn2lj'
opt.tildeop = true


vim.g.netrw_liststyle = 1
