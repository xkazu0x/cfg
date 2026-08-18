-- COMMON ------------------------------------------------------

vim.g.mapleader = " "

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>o", vim.cmd.so)
vim.keymap.set("n", "<leader>Q", vim.cmd.qa)

-- HELPERS -----------------------------------------------------

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-W>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})
vim.keymap.set("x", "<leader>p", "\"_dP")

-- shift selected line up/down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- WINDOW ------------------------------------------------------

-- move between windows
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- move windows
vim.keymap.set("n", "<leader>H", "<C-w>H")
vim.keymap.set("n", "<leader>J", "<C-w>J")
vim.keymap.set("n", "<leader>K", "<C-w>K")
vim.keymap.set("n", "<leader>L", "<C-w>L")

-- resize windows
vim.keymap.set("n", "_", "<cmd>:vertical resize -4<CR>")
vim.keymap.set("n", "+", "<cmd>:vertical resize +4<CR>")
vim.keymap.set("n", "<leader>_", "<cmd>:horizontal resize -4<CR>")
vim.keymap.set("n", "<leader>+", "<cmd>:horizontal resize +4<CR>")

-- MOVEMENT ----------------------------------------------------

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

-- move to start/end of line
vim.keymap.set("n", "<leader>i", "^")
vim.keymap.set("n", "<leader>a", "$")

-- move between word/paragraph
vim.keymap.set({"n", "v"}, "H", "b")
vim.keymap.set({"n", "v"}, "J", "}")
vim.keymap.set({"n", "v"}, "K", "{")
vim.keymap.set({"n", "v"}, "L", "e")

-- move to next/prev
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move up/down by pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
