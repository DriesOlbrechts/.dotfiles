-- accent.lua
-- a simple Neovim colorscheme with a configurable accent color.
-- fork of accent.vim converted to lua
-- https://github.com/Alligator/accent.vim

vim.opt.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "accent"

local accent_colours = {
	red = {
		fg = "#e06c75",
		bg = "#b04c55",
		ctermfg = "167",
		ctermbg = "131",
		keywordfg = "#ffb3b3",
		keywordctermfg = "217",
	},
	orange = {
		fg = "#ee9360",
		bg = "#b66930",
		ctermfg = "173",
		ctermbg = "166",
		keywordfg = "#ffd6a0",
		keywordctermfg = "223",
	},
	green = {
		fg = "#98c379",
		bg = "#689349",
		ctermfg = "149",
		ctermbg = "107",
		keywordfg = "#c3f7b6",
		keywordctermfg = "157",
	},
	yellow = {
		fg = "#e5c07b",
		bg = "#a5803b",
		ctermfg = "179",
		ctermbg = "136",
		keywordfg = "#fff5b1",
		keywordctermfg = "229",
	},
	blue = {
		fg = "#61afe7",
		bg = "#3876af",
		ctermfg = "74",
		ctermbg = "67",
		keywordfg = "#b3d8ff",
		keywordctermfg = "153",
	},
	magenta = {
		fg = "#c688cd",
		bg = "#965498",
		ctermfg = "176",
		ctermbg = "133",
		keywordfg = "#f3b3ff",
		keywordctermfg = "219",
	},
	cyan = {
		fg = "#56b6c2",
		bg = "#3696a2",
		ctermfg = "73",
		ctermbg = "30",
		keywordfg = "#a8f0ff",
		keywordctermfg = "159",
	},
}

local accent_order = { "red", "orange", "green", "yellow", "blue", "magenta", "cyan" }

local accent_auto_color = vim.g.accent_auto_color or 0
local accent = vim.g.accent_colour or "red"
accent = vim.g.accent_color or accent
local invert_status = vim.g.accent_invert_status or 0
local no_bg = vim.g.accent_no_bg or 0

-- 32 bit Fowler–Noll–Vo hash
--

if accent_auto_color == 1 then
	local current_tmux_session =
		vim.trim(vim.system({ "sh", "-c", "tmux list-sessions | grep -n '(attached)' | cut -c1" }):wait().stdout)
	local session = tonumber(current_tmux_session)
	local key_index = ((session - 1) % #accent_order) + 1
	accent = accent_order[key_index]
end

-- foreground
local fg = " guifg=#bcbfc4 ctermfg=250"
local fg_b1 = " guifg=#efefff ctermfg=255"
local fg_d1 = " guifg=#999999 ctermfg=246"
local fg_d2 = " guifg=#777777 ctermfg=244"
local fg_inv = " guifg=#282c34 ctermfg=236"
local fg_invd = " guifg=#181c24 ctermfg=234"
local fg_c = " guifg=" .. accent_colours[accent].fg .. " ctermfg=" .. accent_colours[accent].ctermfg
local fg_keyword = " guifg=" .. accent_colours[accent].keywordfg .. " ctermfg=" .. accent_colours[accent].keywordctermfg

-- background
local bg = " guibg=#282c34 ctermbg=236"
local bg_b1 = " guibg=#383c44 ctermbg=237"
local bg_b2 = " guibg=#484c54 ctermbg=238"
local bg_none = " guibg=NONE"
local bg_inv = " guibg=#cccfd4 ctermbg=188"
local bg_red = " guibg=" .. accent_colours.red.bg .. " ctermbg=" .. accent_colours.red.ctermbg
local bg_c = " guibg=" .. accent_colours[accent].bg .. " ctermbg=" .. accent_colours[accent].ctermbg

-- special
local sp_red = " guisp=" .. accent_colours.red.fg .. " ctermfg=" .. accent_colours.red.ctermfg
local sp_magenta = " guisp=" .. accent_colours.magenta.fg .. " ctermfg=" .. accent_colours.magenta.ctermfg
local sp_blue = " guisp=" .. accent_colours.blue.fg .. " ctermfg=" .. accent_colours.blue.ctermfg
local sp_cyan = " guisp=" .. accent_colours.cyan.fg .. " ctermfg=" .. accent_colours.cyan.ctermfg

-- modifiers
local bold = " gui=bold"
local none = " gui=none cterm=none"
local underline = " gui=underline"
local undercurl = " gui=undercurl"

-- general
if no_bg == 1 then
	vim.cmd("hi Normal" .. fg .. bg_none)
else
	vim.cmd("hi Normal" .. fg .. bg)
end
if invert_status == 1 then
	vim.cmd("hi StatusLine" .. fg_invd .. bg_c .. none)
else
	vim.cmd("hi StatusLine" .. fg_b1 .. bg_c .. none)
end
vim.cmd("hi StatusLineNC" .. fg_d1 .. bg_b2 .. none)
vim.cmd("hi VertSplit" .. fg_c .. bg_b1 .. none)
vim.cmd("hi LineNr" .. fg_d2 .. bg_none .. none)
vim.cmd("hi CursorLineNr" .. fg_b1 .. bg_none .. none)
vim.cmd("hi CursorLine" .. bg_b1 .. none)
vim.cmd("hi MatchParen" .. fg_b1 .. bg_b1 .. bold)
vim.cmd("hi NonText" .. fg_d2 .. bg_none .. none)
vim.cmd("hi WildMenu" .. fg_inv .. bg_inv .. none)
vim.cmd("hi Search" .. fg_inv .. bg_c .. none)
vim.cmd("hi Folded" .. fg_b1 .. bg_b1 .. none)
vim.cmd("hi Visual" .. bg_b2)
vim.cmd("hi Pmenu" .. fg_d1 .. bg_b1 .. none)
vim.cmd("hi PmenuSel" .. fg_c .. bg_b2 .. none)
vim.cmd("hi TabLine" .. fg_d1 .. bg_b1 .. none)
vim.cmd("hi TabLineFill" .. fg_d1 .. bg_b2 .. none)

vim.cmd("hi! link StatusLineTerm StatusLine")
vim.cmd("hi! link StatusLineTermNC StatusLineNC")

vim.cmd("hi Question" .. fg_c)
vim.cmd("hi! link MoreMsg Question")
vim.cmd("hi! link FoldColumn Folded")

-- spellchecking
vim.cmd("hi SpellBad" .. " ctermbg=NONE" .. undercurl .. sp_red)
vim.cmd("hi SpellRare" .. " ctermbg=NONE" .. undercurl .. sp_magenta)
vim.cmd("hi SpellCap" .. " ctermbg=NONE" .. undercurl .. sp_blue)
vim.cmd("hi SpellLocal" .. " ctermbg=NONE" .. undercurl .. sp_cyan)

-- syntax
if no_bg == 1 then
	vim.cmd("hi Normal" .. fg .. bg_none)
else
	vim.cmd("hi Normal" .. fg .. bg)
end
vim.cmd("hi Comment" .. fg_d2 .. bg_none .. none)
vim.cmd("hi String" .. fg_c .. bg_none .. none)
vim.cmd("hi Type" .. fg_keyword .. bg_none .. none)
vim.cmd("hi PreProc" .. fg_d1 .. bg_none .. none)
vim.cmd("hi Underlined" .. fg .. bg_none .. underline)
vim.cmd("hi Special" .. fg_c .. bg_none .. none)
vim.cmd("hi Error" .. fg_b1 .. bg_red .. none)
vim.cmd("hi @variable" .. fg .. bg_none .. none)

vim.cmd("hi! link Operator     Normal")
vim.cmd("hi! link Identifier   Normal")
vim.cmd("hi! link Todo         Normal")
vim.cmd("hi! link Macro        PreProc")
vim.cmd("hi! link Statement    Type")
vim.cmd("hi! link Constant     Type")
vim.cmd("hi! link SpecialKey   Comment")
vim.cmd("hi! link Title        Type")
vim.cmd("hi! link Directory    Type")
vim.cmd("hi! link Function     Type")
vim.cmd("hi! link Number       String")
vim.cmd("hi! link Character    String")
vim.cmd("hi! link ErrorMsg     Error")

-- special stuff
vim.cmd("hi! link xmlAttrib    Normal")
vim.cmd("hi! link sqlKeyword   Type")

-- diff
local diff_red = " guifg=#e06c75 guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE"
local diff_green = " guifg=#98c379 guibg=NONE ctermfg=149 ctermbg=NONE"
local diff_purple = " guifg=#c688cd guibg=NONE ctermfg=176 ctermbg=NONE"

vim.cmd("hi DiffAdd" .. diff_green)
vim.cmd("hi DiffDelete" .. diff_red)
vim.cmd("hi DiffChange" .. bg_b1)
vim.cmd("hi DiffText" .. fg_b1 .. bg_red .. none)

vim.cmd("hi! link diffAdded    DiffAdd")
vim.cmd("hi! link diffRemoved  DiffDelete")
