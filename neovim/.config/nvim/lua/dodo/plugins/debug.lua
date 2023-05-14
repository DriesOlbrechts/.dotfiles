return {
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require('dodo.configs.dapui').config()
        end,
        keys = {
            { "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>" },
            { "<leader>dc", ":lua require'dap'.continue()<CR>" },
            { "<leader>di", ":lua require'dap'.step_into()<CR>" },
            { "<leader>do", ":lua require'dap'.step_over()<CR>" },
            { "<leader>dr", ":lua require'dap'.repl.open()<CR>" },
            { "<leader>ds", ":lua require'dap'.continue()<CR>" },
            { "<leader>dt", ":lua require'dap'.step_out()<CR>" },
            { "<leader>dv", ":lua require'dapui'.toggle()<CR>" },
        },
        requires = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>" },
            { "<leader>dc", ":lua require'dap'.continue()<CR>" },
            { "<leader>di", ":lua require'dap'.step_into()<CR>" },
            { "<leader>do", ":lua require'dap'.step_over()<CR>" },
            { "<leader>dr", ":lua require'dap'.repl.open()<CR>" },
            { "<leader>ds", ":lua require'dap'.continue()<CR>" },
            { "<leader>dt", ":lua require'dap'.step_out()<CR>" },
            { "<leader>dv", ":lua require'dapui'.toggle()<CR>" },
        },
        config = function()
            require('dodo.configs.dap').config()
        end,
    }
}
