require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- cross-platform pasting
vim.cmd("inoremap <C-v> <C-r>+")
vim.cmd(
    [[
function OpenMarkdownPreview (url)
  execute "silent ! firefox --private-window " . a:url
endfunction
]]
)
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'

local api = require("nvim-tree.api")
api.tree.toggle({ focus = false })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "vv", "V")

map("n", "<leader>q", ":q <CR>", { desc = "Exit" })
map("n", "<leader>wq", ":wqa <CR>", { desc = "Exit and save" })
map("n", "<leader>w", ":w <CR>", { desc = "Save file" })
map("n", "<leader>wa", ":wa <CR>", { desc = "Save all" })
-- switch between windows
map("n", "th", "<C-w>h", { desc = "Window left" })
map("n", "tl", "<C-w>l", { desc = "Window right" })
map("n", "tj", "<C-w>j", { desc = "Window down" })
map("n", "tk", "<C-w>k", { desc = "Window up" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>i", ":GoIfErr<CR>", { desc = "GoIfErr" })
map("n", "<leader>+", ":CMakeRun<CR>", { desc = "CMakeRun" })
map("n", "<leader>k", ":GoDoc<CR>", { desc = "GoDoc" })
