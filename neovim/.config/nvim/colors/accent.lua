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
	magenta = {
		primary = "#c688cd",
		secondary = "#965498",
		highlight = "#f3b3ff",
		muted = "#6e3973",
		contrast = "#ff79c6",
		cterm_primary = "176",
		cterm_secondary = "133",
		cterm_highlight = "219",
		cterm_muted = "96",
		cterm_contrast = "212",
	},
	orange = {
		primary = "#ee9360",
		secondary = "#b66930",
		highlight = "#ffd6a0",
		muted = "#a05a2c",
		contrast = "#ffb86c",
		cterm_primary = "173",
		cterm_secondary = "166",
		cterm_highlight = "223",
		cterm_muted = "130",
		cterm_contrast = "215",
	},
	green = {
		primary = "#98c379",
		secondary = "#689349",
		highlight = "#c3f7b6",
		muted = "#4e6e3a",
		contrast = "#b8e994",
		cterm_primary = "149",
		cterm_secondary = "107",
		cterm_highlight = "157",
		cterm_muted = "65",
		cterm_contrast = "151",
	},
	yellow = {
		primary = "#e5c07b",
		secondary = "#a5803b",
		highlight = "#fff5b1",
		muted = "#7a5c1e",
		contrast = "#ffe066",
		cterm_primary = "179",
		cterm_secondary = "136",
		cterm_highlight = "229",
		cterm_muted = "94",
		cterm_contrast = "228",
	},
	blue = {
		primary = "#61afe7",
		secondary = "#3876af",
		highlight = "#b3d8ff",
		muted = "#274472",
		contrast = "#82aaff",
		cterm_primary = "74",
		cterm_secondary = "67",
		cterm_highlight = "153",
		cterm_muted = "24",
		cterm_contrast = "111",
	},

	red = {
		primary = "#e06c75",
		secondary = "#b04c55",
		highlight = "#ffb3b3",
		muted = "#7c3f4a",
		contrast = "#ff5c57",
		cterm_primary = "167",
		cterm_secondary = "131",
		cterm_highlight = "217",
		cterm_muted = "95",
		cterm_contrast = "203",
	},
	cyan = {
		primary = "#56b6c2",
		secondary = "#3696a2",
		highlight = "#a8f0ff",
		muted = "#2b6f77",
		contrast = "#8be9fd",
		cterm_primary = "73",
		cterm_secondary = "30",
		cterm_highlight = "159",
		cterm_muted = "23",
		cterm_contrast = "123",
	},
}
local accent_order = { "magenta", "orange", "green", "yellow", "blue", "red", "cyan" }

local function setTheme(setAccent)
	local accent_auto_color = vim.g.accent_auto_color or 0
	local accent = vim.g.accent_colour or "red"
	accent = setAccent or vim.g.accent_color or accent
	local invert_status = vim.g.accent_invert_status or 0
	local no_bg = vim.g.accent_no_bg or 0

	-- 32 bit Fowler–Noll–Vo hash
	--

	if accent_auto_color == 1 then
		local res = vim.system({ "tmux", "display-message", "-p", "#{session_id}" }):wait()
		if res.code == 0 and type(res.stdout) == "string" then
			local num = res.stdout:match("%d+")
			local sid = tonumber(num)
			if sid then
				local key_index = (sid % #accent_order) + 1
				accent = accent_order[key_index]
			end
		end
	end

	-- foreground
	local fg = " guifg=#bcbfc4 ctermfg=250"
	local fg_b1 = " guifg=#efefff ctermfg=255"
	local fg_d1 = " guifg=#999999 ctermfg=246"
	local fg_d2 = " guifg=#777777 ctermfg=244"
	local fg_inv = " guifg=#282c34 ctermfg=236"
	local fg_invd = " guifg=#181c24 ctermfg=234"
	local fg_c = " guifg=" .. accent_colours[accent].primary .. " ctermfg=" .. accent_colours[accent].cterm_primary
	local fg_special = " guifg="
	    .. accent_colours[accent].highlight
	    .. " ctermfg="
	    .. accent_colours[accent].cterm_highlight
	local fg_keyword = " guifg="
	    .. accent_colours[accent].contrast
	    .. " ctermfg="
	    .. accent_colours[accent].cterm_contrast

	-- background
	local bg = " guibg=#282c34 ctermbg=236"
	local bg_b1 = " guibg=#383c44 ctermbg=237"
	local bg_b2 = " guibg=#484c54 ctermbg=238"
	local bg_none = " guibg=NONE"
	local bg_inv = " guibg=#cccfd4 ctermbg=188"
	local bg_red = " guibg=" .. accent_colours.red.secondary .. " ctermbg=" .. accent_colours.red.cterm_secondary
	local bg_c = " guibg=" ..
	    accent_colours[accent].secondary .. " ctermbg=" .. accent_colours[accent].cterm_secondary

	-- special
	local sp_red = " guisp=" .. accent_colours.red.primary .. " ctermfg=" .. accent_colours.red.cterm_primary
	local sp_magenta = " guisp="
	    .. accent_colours.magenta.primary
	    .. " ctermfg="
	    .. accent_colours.magenta.cterm_primary
	local sp_blue = " guisp=" .. accent_colours.blue.primary .. " ctermfg=" .. accent_colours.blue.cterm_primary
	local sp_cyan = " guisp=" .. accent_colours.cyan.primary .. " ctermfg=" .. accent_colours.cyan.cterm_primary

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
	vim.cmd("hi Type" .. fg_special .. bg_none .. none)
	vim.cmd("hi PreProc" .. fg_d1 .. bg_none .. none)
	vim.cmd("hi Underlined" .. fg .. bg_none .. underline)
	vim.cmd("hi Special" .. fg_c .. bg_none .. none)
	vim.cmd("hi Error" .. fg_b1 .. bg_red .. none)

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

	-- language stuff
	vim.cmd("hi @variable" .. fg .. bg_none .. none)
	vim.cmd("hi @tag.attribute" .. fg .. bg_none .. none)
	vim.cmd("hi Keyword" .. fg_keyword .. bg_none .. none)

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
end

setTheme(os.getenv("THEME") or "magenta")
