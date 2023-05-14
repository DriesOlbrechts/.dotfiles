---depends om https://github.com/feline-nvim/feline.nvim
local present, feline = pcall(require, "feline")

if not present then
  return
end

-- pink #F5C2E7
-- surface1 #45475A
-- subtext1 #BAC2DE
-- red #F38BA8
-- surface0 #313244
-- base #1E1E2E
-- crust #11111B
-- lavender #B4BEFE
-- peach #FAB387
-- sapphire #74C7EC
-- sky #89DCEB
-- teal #94E2D5
-- mauve #CBA6F7
-- blue #89B4FA
-- overlay2 #9399B2
-- overlay1 #7F849C
-- maroon #EBA0AC
-- flamingo #F2CDCD
-- text #CDD6F4
-- overlay0 #6C7086
-- green #A6E3A1
-- rosewater #F5E0DC
-- mantle #181825
-- surface2 #585B70
-- yellow #F9E2AF
-- subtext0 #A6ADC8
local catppuccin = require("catppuccin.palettes").get_palette "mocha"

local theme = {
  aqua = catppuccin.sapphire,
  bg = catppuccin.base,
  blue = catppuccin.blue,
  cyan = catppuccin.teal,
  darkred = catppuccin.red,
  fg = catppuccin.text,
  gray = catppuccin.surface0,
  green = catppuccin.green,
  lime = catppuccin.sky,
  orange = catppuccin.peach,
  pink = catppuccin.pink,
  purple = catppuccin.mauve,
  red = catppuccin.maroon,
  yellow = catppuccin.yellow
}

local mode_theme = {
  ["NORMAL"] = theme.blue,
  ["OP"] = theme.cyan,
  ["INSERT"] = theme.orange,
  ["VISUAL"] = theme.yellow,
  ["LINES"] = theme.darkred,
  ["BLOCK"] = theme.aqua,
  ["REPLACE"] = theme.purple,
  ["V-REPLACE"] = theme.pink,
  ["ENTER"] = theme.pink,
  ["MORE"] = theme.pink,
  ["SELECT"] = theme.darkred,
  ["SHELL"] = theme.cyan,
  ["TERM"] = theme.lime,
  ["NONE"] = theme.gray,
  ["COMMAND"] = theme.green,
}

local component = {}

component.vim_mode = {
  provider = function()
    return vim.api.nvim_get_mode().mode:upper()
  end,
  hl = function()
    return {
      fg = "bg",
      bg = require("feline.providers.vi_mode").get_mode_color(),
      style = "bold",
      name = "NeovimModeHLColor",
    }
  end,
  left_sep = "block",
  right_sep = "block",
}

component.git_branch = {
  provider = "git_branch",
  hl = {
    fg = "fg",
    bg = "bg",
    style = "bold",
  },
  left_sep = "block",
  right_sep = "",
}

component.git_add = {
  provider = "git_diff_added",
  hl = {
    fg = "green",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.git_delete = {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.git_change = {
  provider = "git_diff_changed",
  hl = {
    fg = "purple",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.separator = {
  provider = "",
  hl = {
    fg = "bg",
    bg = "bg",
  },
}

component.diagnostic_errors = {
  provider = "diagnostic_errors",
  hl = {
    fg = "red",
  },
}

component.diagnostic_warnings = {
  provider = "diagnostic_warnings",
  hl = {
    fg = "yellow",
  },
}

component.diagnostic_hints = {
  provider = "diagnostic_hints",
  hl = {
    fg = "aqua",
  },
}

component.diagnostic_info = {
  provider = "diagnostic_info",
}

component.lsp = {
  provider = function()
    if not rawget(vim, "lsp") then
      return ""
    end

    local progress = vim.lsp.util.get_progress_messages()[1]
    if vim.o.columns < 120 then
      return ""
    end

    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #clients ~= 0 then
      if progress then
        local spinners = {
          "◜ ",
          "◠ ",
          "◝ ",
          "◞ ",
          "◡ ",
          "◟ ",
        }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        local content = string.format("%%<%s", spinners[frame + 1])
        return content or ""
      else
        return "לּ LSP"
      end
    end
    return ""
  end,
  hl = function()
    local progress = vim.lsp.util.get_progress_messages()[1]
    return {
      fg = progress and "yellow" or "green",
      bg = "gray",
      style = "bold",
    }
  end,
  left_sep = "",
  right_sep = "block",
}

component.file_type = {
  provider = {
    name = "file_type",
    opts = {
      filetype_icon = true,
    },
  },
  hl = {
    fg = "fg",
    bg = "gray",
  },
  left_sep = "block",
  right_sep = "block",
}

component.file_name = {
	provider = {
		name = 'file_info',
		opts = {
			type = 'relative'
		}
	},
	hl = {
		fg = "fg",
		bg = "bg"
	},
	left_sep = "block",
	right_sep = "block",
}

component.scroll_bar = {
  provider = function()
    local chars = {
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
    }
    local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
    local position = math.floor(line_ratio * 100)

    if position <= 5 then
      position = " TOP"
    elseif position >= 95 then
      position = " BOT"
    else
      position = chars[math.floor(line_ratio * #chars)] .. position
    end
    return position
  end,
  hl = function()
    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
    local fg
    local style

    if position <= 5 then
      fg = "aqua"
      style = "bold"
    elseif position >= 95 then
      fg = "red"
      style = "bold"
    else
      fg = "purple"
      style = nil
    end
    return {
      fg = fg,
      style = "bold",
      bg = "bg",
    }
  end,
  left_sep = "block",
  right_sep = "block",
}

local left = {
  component.vim_mode,
  component.file_type,
  component.lsp,
  component.git_branch,
}
local middle = {component.file_name}
local right = {
  component.git_add,
  component.git_delete,
  component.git_change,
  component.separator,
  component.diagnostic_errors,
  component.diagnostic_warnings,
  component.diagnostic_info,
  component.diagnostic_hints,
  component.scroll_bar,
}

local components = {
  active = {
    left,
    middle,
    right,
  },
}

feline.setup({
  components = components,
  theme = theme,
  vi_mode_colors = mode_theme,
})
