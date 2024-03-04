local M = {}

M.general = {

    n = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Tmux left" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Tmux down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Tmux up" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Tmux right" },
        ["<leader>ch"] = { '<cmd>lua require("cpptool").create_file()<CR>', "New C++ header" },
        ["<leader>cf"] = { '<cmd>lua require("cpptool").create_func_def()<CR>', "New C++ function" },
        ["<leader>cg"] = {
            ":ChatGPTCompleteCode<CR>",
            "Step over",
        },
        ["<leader>gl"] = {
            ":Flog<CR>",
            "Git Flog",
        },
        ["<leader>gf"] = {
            ":DiffviewFileHistory<CR>",
            "Git File History",
        },
        ["<leader>gc"] = {
            ":DiffviewOpen HEAD~2<CR>",
            "Git Last Commit",
        },
        ["<leader>gt"] = {
            ":DiffviewToggleFile<CR>",
            "Git Last Commit",
        },
    },
    v = {
        ["v"] = { "V" },
        ["<leader><up>"] = {
            "<cmd>lua require('cpptool').move_lines(\"up\")<CR>",
            "Cpptool-up-lines",
        },
        ["<leader><down>"] = {
            "<cmd>lua require('cpptool').move_lines(\"down\")<CR>",
            "Cpptool-down-lines",
        },
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger",
        },
        ["<leader>du"] = {
            function()
                require("dapui").toggle()
            end,
            "Debug UI",
        },
        ["<leader>dd"] = {
            function()
                require("dap").continue()
            end,
            "Continue",
        },
        ["<leader>dus"] = {
            function()
                local widgets = require "dap.ui.widgets"
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end,
            "Open debugging sidebar",
        },
    },
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require("dap-go").debug_test()
            end,
            "Debug go test",
        },
        ["<leader>dgl"] = {
            function()
                require("dap-go").debug_last()
            end,
            "Debug last go test",
        },
    },
}

M.dap_python = {
    plugin = true,
    n = {
        ["<leader>dpr"] = {
            function()
                require("dap-python").test_method()
            end,
        },
    },
}

M.crates = {
    plugin = true,
    n = {
        ["<leader>rcu"] = {
            function()
                require("crates").upgrade_all_crates()
            end,
            "update crates",
        },
    },
}
vim.g.codeium_disable_bindings = 1

return M
