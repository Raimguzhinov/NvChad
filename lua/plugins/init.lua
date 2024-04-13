return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup {
                width = 120, -- Width of the floating window
                height = 15, -- Height of the floating window
                border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
                default_mappings = true,
                debug = false, -- Print debug information
                opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
                post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                references = { -- Configure the telescope UI for slowing the references cycling window.
                    telescope = require("telescope.themes").get_dropdown { hide_preview = false },
                },
                -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
                focus_on_open = true,                                        -- Focus the floating window when opening it.
                dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
                force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
                stack_floating_preview_windows = true,                       -- Whether to nest floating windows
                preview_window_title = { enable = true, position = "left" }, -- Whether
            }
        end,
    },
    { "nvim-neotest/nvim-nio" },
    {
        "gen740/SmoothCursor.nvim",
        event = "VeryLazy",
        config = function()
            require("smoothcursor").setup {
                type = "matrix",
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    { "tpope/vim-sleuth" },
    { "onsails/lspkind.nvim" },
    { "preservim/vim-pencil" },
    { "folke/zen-mode.nvim" },
    { "David-Kunz/gen.nvim" },
    { "tpope/vim-obsession" },
    { "ThePrimeagen/git-worktree.nvim" },
    { "numToStr/Comment.nvim" },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",

        keys = {
            { "<leader>on", "<cmd>ObsidianNew<cr>",         desc = "New Obsidian note",               mode = "n" },
            { "<leader>oo", "<cmd>ObsidianSearch<cr>",      desc = "Search Obsidian notes",           mode = "n" },
            { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch",                    mode = "n" },
            { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",   desc = "Show location list of backlinks", mode = "n" },
            { "<leader>ot", "<cmd>ObsidianTemplate<cr>",    desc = "Follow link under cursor",        mode = "n" },
        },
        config = function()
            require "configs.obsidian"
        end,
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nosduco/remote-sshfs.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        event = "VeryLazy",
        config = function()
            require("remote-sshfs").setup {}
            require("telescope").load_extension "remote-sshfs"
        end,
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod",                     event = "VeryLazy" },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    --   {
    --     "leoluz/nvim-dap-go",
    --     ft = "go",
    --     dependencies = "mfussenegger/nvim-dap",
    --     config = function(_, opts)
    --         require("dap-go").setup(opts)
    --         require("mappings").load_mappings "dap_go"
    --     end,
    -- },
    {
        "DreamMaoMao/yazi.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },

        keys = {
            { "<leader>op", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "liaozixin/nvim-cpptools",
        config = function()
            require("nvim-cpptools").setup()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    { "tpope/vim-fugitive" },
    {
        "rbong/vim-flog",
        dependencies = {
            "tpope/vim-fugitive",
        },
        lazy = false,
    },
    { "sindrets/diffview.nvim", lazy = false },
    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            require("leap").add_default_mappings(true)
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        lazy = false,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "tanvirtin/vgit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            require("vgit").setup()
        end,
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },

    -- {
    --     "mfussenegger/nvim-dap",
    --     config = function()
    --         require("mappings").load_mappings "dap"
    --     end,
    -- },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server", "stylua",
                "html-lsp", "css-lsp", "prettier",
                "clangd", "clang-format", "codelldb",
                "black", "debugpy", "mypy", "ruff", "pyright",
                "rust-analyzer", "cpptools", "gopls",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "go", "cpp",
            },
        },
    },
    {
        "Civitasv/cmake-tools.nvim",
        init = function()
            require("cmake-tools").setup {
                cmake_command = "cmake",                                          -- this is used to specify cmake command path
                cmake_regenerate_on_save = true,                                  -- auto generate when save CMakeLists.txt
                cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
                cmake_build_options = {},                                         -- this will be passed when invoke `CMakeBuild`
                cmake_build_directory = "build",                                  -- this is used to specify generate directory for cmake
                cmake_build_directory_prefix = "cmake_build_",                    -- when cmake_build_directory is set to "", this option will be activated
                cmake_soft_link_compile_commands = true,                          -- this will automatically make a soft link from compile commands file to project root dir
                cmake_compile_commands_from_lsp = false,                          -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
                cmake_kits_path = nil,                                            -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
                cmake_variants_message = {
                    short = { show = true },                                      -- whether to show short message
                    long = { show = true, max_length = 40 },                      -- whether to show long message
                },
                cmake_dap_configuration = {                                       -- debug settings for cmake
                    name = "cpp",
                    -- type = "cppdbg",
                    type = "codelldb",
                    request = "launch",
                    stopOnEntry = false,
                    runInTerminal = true,
                    console = "integratedTerminal",
                },
                cmake_executor = {                   -- executor to use
                    name = "quickfix",               -- name of the executor
                    opts = {},                       -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
                    default_opts = {                 -- a list of default and possible values for executors
                        quickfix = {
                            show = "always",         -- "always", "only_on_error"
                            position = "belowright", -- "bottom", "top"
                            size = 10,
                        },
                        overseer = {
                            new_task_opts = {},               -- options to pass into the `overseer.new_task` command
                            on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
                        },
                        terminal = {},                        -- terminal executor uses the values in cmake_terminal
                    },
                },
                cmake_terminal = {
                    name = "terminal",
                    opts = {
                        name = "Main Terminal",
                        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
                        split_direction = "vertical",   -- "horizontal", "vertical"
                        split_size = 46,

                        -- Window handling
                        single_terminal_per_instance = true,  -- Single viewport, multiple windows
                        single_terminal_per_tab = true,       -- Single viewport per tab
                        keep_terminal_static_location = true, -- Static location of the viewport if avialable

                        -- Running Tasks
                        start_insert_in_launch_task = true, -- If you want to enter terminal with :startinsert upon using :CMakeRun
                        start_insert_in_other_tasks = true, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
                        focus_on_main_terminal = true,      -- Focus on cmake terminal when cmake task is launched. Only used if executor is terminal.
                        focus_on_launch_terminal = true,    -- Focus on cmake launch terminal when executable target in launched.
                    },
                },
                cmake_notifications = {
                    enabled = true, -- show cmake execution progress in nvim-notify
                    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
                    refresh_rate_ms = 100, -- how often to iterate icons
                },
            }
        end,
    },
    {
        "loctvl842/breadcrumb.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        init = function()
            require("breadcrumb").setup {
                disabled_filetype = {
                    "",
                    "help",
                },
                icons = {
                    Module = " ",
                    Namespace = " ",
                    Package = " ",
                    String = "󰅳 ",
                    Number = " ",
                    Boolean = "◩ ",
                    Array = " ",
                    Object = " ",
                    Null = "󰟢 ",
                    Tag = " ",
                    Text = "󰦨 ",
                    Method = " ",
                    Function = " ",
                    Constructor = " ",
                    Field = " ",
                    Variable = " ",
                    Class = " ",
                    Interface = " ",
                    Property = " ",
                    Unit = " ",
                    Value = "󰾡 ",
                    Enum = " ",
                    Key = " ",
                    Snippet = " ",
                    Color = " ",
                    File = " ",
                    Reference = " ",
                    Folder = " ",
                    EnumMember = " ",
                    Constant = " ",
                    Struct = " ",
                    Event = "",
                    Operator = " ",
                    TypeParameter = " ",
                    Specifier = " ",
                    Statement = "",
                    Recovery = " ",
                    TranslationUnit = " ",
                    PackExpansion = " ",
                },
                separator = ">",
                depth_limit = 0,
                depth_limit_indicator = "..",
                color_icons = true,
                highlight_group = {
                    component = "BreadcrumbText",
                    separator = "BreadcrumbSeparator",
                },
            }
        end,
    },
    {
        "nvim-lualine/lualine.nvim", -- status line
        event = "VeryLazy",
        config = function()
            local lualine = require "lualine"
            local cmake = require "cmake-tools"
            local icons = require "configs.icons"
            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand "%:p:h"
                    local gitdir = vim.fn.finddir(".git", filepath .. ";")
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }
            local colors = {
                normal = {
                    bg = "#202328",
                    fg = "#bbc2cf",
                    yellow = "#ECBE7B",
                    cyan = "#008080",
                    darkblue = "#081633",
                    green = "#98be65",
                    orange = "#FF8800",
                    violet = "#a9a1e1",
                    magenta = "#c678dd",
                    blue = "#51afef",
                    red = "#ec5f67",
                },
                nightfly = {
                    bg = "#011627",
                    fg = "#acb4c2",
                    yellow = "#ecc48d",
                    cyan = "#7fdbca",
                    darkblue = "#82aaff",
                    green = "#21c7a8",
                    orange = "#e3d18a",
                    violet = "#a9a1e1",
                    magenta = "#ae81ff",
                    blue = "#82aaff ",
                    red = "#ff5874",
                },
                light = {
                    bg = "#f6f2ee",
                    fg = "#3d2b5a",
                    yellow = "#ac5402",
                    cyan = "#287980",
                    darkblue = "#2848a9",
                    green = "#396847",
                    orange = "#a5222f",
                    violet = "#8452d5",
                    magenta = "#6e33ce",
                    blue = "#2848a9",
                    red = "#b3434e",
                },
                catppuccin_mocha = {
                    -- bg       = "#1E1E2E",
                    fg = "#CDD6F4",
                    yellow = "#F9E2AF",
                    cyan = "#7fdbca",
                    darkblue = "#89B4FA",
                    green = "#A6E3A1",
                    orange = "#e3d18a",
                    violet = "#a9a1e1",
                    magenta = "#ae81ff",
                    blue = "#89B4FA",
                    red = "#F38BA8",
                },
            }
            colors = colors.catppuccin_mocha
            local breadcrumb = function()
                local breadcrumb_status_ok, breadcrumb = pcall(require, "breadcrumb")
                if not breadcrumb_status_ok then
                    return
                end
                return breadcrumb.get_breadcrumb()
            end
            local config = {
                options = {
                    icons_enabled = true,
                    component_separators = "",
                    section_separators = "",
                    disabled_filetypes = {
                        "alpha",
                        "dashboard",
                        "Outline",
                        "NvimTree",
                        "terminal",
                        "cmake_tools_terminal",
                        "dap-repl",
                        "dap",
                        "DAP Watches",
                        "DAP Stacks",
                        "DAP Breakpoints",
                        "DAP Scopes",
                    },
                    always_divide_middle = true,
                    theme = {
                        -- We are going to use lualine_c an lualine_x as left and
                        -- right section. Both are highlighted by c theme .  So we
                        -- are just setting default looks o statusline
                        normal = { c = { fg = colors.fg, bg = colors.bg } },
                        inactive = { c = { fg = colors.fg, bg = colors.bg } },
                    },
                },
                winbar = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    -- c for left
                    lualine_c = {},
                    -- x for right
                    lualine_x = {
                        --     {
                        --         require("noice").api.statusline.mode.get,
                        --         cond = require("noice").api.statusline.mode.has,
                        --         color = { fg = "#ff9e64" },
                        --     },
                    },
                },
                inactive_winbar = {
                    lualine_a = {
                        {
                            function()
                                return icons.ui.Line
                            end,
                            color = { fg = colors.blue },      -- Sets highlighting of component
                            padding = { left = 0, right = 1 }, -- We don't need space before this
                        },
                    },
                    lualine_b = {},
                    lualine_c = { breadcrumb },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {
                        "filetype",
                        {
                            "o:encoding",
                            fmt = string.upper,
                            cond = conditions.hide_in_width,
                            color = { fg = colors.red, gui = "bold" },
                        },
                        {
                            "fileformat",
                            fmt = string.upper,
                            icons_enabled = false,
                            cond = conditions.hide_in_width,
                            color = { fg = colors.red, gui = "bold" },
                        },
                        {
                            "filesize",
                            cond = conditions.hide_in_width,
                            icon = icons.documents.Filesize,
                            color = { fg = colors.orange, gui = "bold" },
                        },
                    },
                },
                sections = {},
                inactive_sections = {},
                tabline = {},
                extensions = {},
            }
            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
                table.insert(config.winbar.lualine_c, component)
            end
            -- Inserts a component in lualine_x ot right section
            local function ins_right(component)
                table.insert(config.winbar.lualine_x, component)
            end
            ins_left {
                function()
                    return icons.ui.Line
                end,
                color = { fg = colors.blue },      -- Sets highlighting of component
                padding = { left = 0, right = 1 }, -- We don't need space before this
            }
            ins_left {
                -- mode component
                function()
                    return icons.kind.Event
                end,
                color = function()
                    -- auto change color according to neovims mode
                    local mode_color = {
                        n = colors.red,
                        i = colors.green,
                        v = colors.blue,
                        ["�"] = colors.blue,
                        V = colors.blue,
                        c = colors.magenta,
                        no = colors.red,
                        s = colors.orange,
                        S = colors.orange,
                        ["�"] = colors.orange,
                        ic = colors.yellow,
                        R = colors.violet,
                        Rv = colors.violet,
                        cv = colors.red,
                        ce = colors.red,
                        r = colors.cyan,
                        rm = colors.cyan,
                        ["r?"] = colors.cyan,
                        ["!"] = colors.red,
                        t = colors.red,
                    }
                    return { fg = mode_color[vim.fn.mode()] }
                end,
                -- padding = { right = 1 },
            }
            ins_left {
                -- "filename",
                breadcrumb,
                cond = conditions.buffer_not_empty,
                color = { fg = colors.magenta, gui = "bold" },
            }
            -- Insert mid section. You can make any number of sections in neovim :)
            -- for lualine it's any number greater then 2
            ins_left {
                function()
                    return "%="
                end,
            }
            -- Add components to right sections
            ins_right {
                function()
                    local c_preset = cmake.get_configure_preset()
                    return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
                end,
                icon = icons.ui.Search,
                cond = function()
                    return cmake.is_cmake_project() and cmake.has_cmake_preset()
                end,
                on_click = function(n, mouse)
                    if n == 1 then
                        if mouse == "l" then
                            vim.cmd "CMakeSelectConfigurePreset"
                        end
                    end
                end,
            }
            ins_right {
                function()
                    local type = cmake.get_build_type()
                    return "CMake: [" .. (type and type or "") .. "]"
                end,
                icon = icons.ui.Search,
                cond = function()
                    return cmake.is_cmake_project() and not cmake.has_cmake_preset()
                end,
                on_click = function(n, mouse)
                    if n == 1 then
                        if mouse == "l" then
                            vim.cmd "CMakeSelectBuildType"
                        end
                    end
                end,
            }
            ins_right {
                function()
                    return icons.ui.Hammer
                end,
                cond = cmake.is_cmake_project,
                on_click = function(n, mouse)
                    if n == 1 then
                        if mouse == "l" then
                            vim.cmd "CMakeBuild"
                        end
                    end
                end,
            }
            ins_right {
                function()
                    return icons.ui.Run
                end,
                cond = cmake.is_cmake_project,
                on_click = function(n, mouse)
                    if n == 1 then
                        if mouse == "l" then
                            vim.cmd "CMakeRun"
                        end
                    end
                end,
            }
            ins_right {
                function()
                    return icons.ui.Debug
                end,
                cond = cmake.is_cmake_project,
                on_click = function(n, mouse)
                    if n == 1 then
                        if mouse == "l" then
                            vim.cmd "CMakeDebug"
                        end
                    end
                end,
            }
            ins_right {
                "o:encoding",       -- option component same as &encoding in viml
                fmt = string.upper, -- I'm not sure why it's upper case either ;)
                cond = conditions.hide_in_width,
                icon = icons.ui.NewFile,
                color = { fg = colors.red, gui = "bold" },
            }
            ins_right {
                "location",
                color = { fg = colors.green, gui = "bold" },
            }
            lualine.setup(config)
        end,
    },
    -- {
    --     "rcarriga/nvim-notify",
    --     config = function()
    --         require("notify").setup {
    --             background_colour = "#000000",
    --             enabled = false,
    --         }
    --     end,
    -- },
    -- {
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup {
    --             -- add any options here
    --             routes = {
    --                 {
    --                     filter = {
    --                         event = "msg_show",
    --                         any = {
    --                             { find = "%d+L, %d+B" },
    --                             { find = "; after #%d+" },
    --                             { find = "; before #%d+" },
    --                             { find = "%d fewer lines" },
    --                             { find = "%d more lines" },
    --                         },
    --                     },
    --                     opts = { skip = true },
    --                 },
    --             },
    --         }
    --     end,
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     },
    -- },
}
