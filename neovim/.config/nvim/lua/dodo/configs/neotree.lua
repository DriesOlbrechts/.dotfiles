local M = {}

M.config = function()
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
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            modified = {
                symbol = "*",
                highlight = "NeoTreeModified",
            },
            indent = {
                padding = 0,
                with_expanders = false
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                default = "",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added     = "",          -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified  = "",       -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted   = "✖",       -- this can only be used in the git_status source
                    renamed   = "",       -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "",
                    staged    = "",
                    conflict  = "",
                }
            }
        },
        window = {
            position = "right",
            width = 25,
        },
        filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = false,
                hide_by_name = {
                    "node_modules",
                    ".DS_Store",
                    "thumbs.db",
                    "__pycache"
                },
            },
            follow_current_file = true,
            hijack_netrw_behavior = "open_current",
            use_libuv_file_watcher = true,
        },
        git_status = {
            window = {
                position = "float"
            },
        },
        event_handlers = {
            { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
        },
    })
end

return M
