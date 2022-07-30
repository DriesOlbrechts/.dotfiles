-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })
-- NOTE: this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"
require("neo-tree").setup({
    default_component_configs = {
        close_if_last_window = false,
        popup_bordeR_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        modified = {
            symbol = "*",
            highlight = "NeoTreeModified",
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖", -- this can only be used in the git_status source
                renamed   = "", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        }
    },
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_by_name = {
                "node_modules"
            }
        }
    }
})

vim.keymap.set('n', '<leader>nt', '<cmd>Neotree toggle reveal<cr>', { desc = "Opens neotree", noremap = true, silent = true })
