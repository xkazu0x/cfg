-- Basic ----------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.cmdheight = 1
vim.opt.shadafile = "NONE"

-- Line Wrapping --------------------------------------------------------------
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 2)

-- Tabbing --------------------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Indentation ----------------------------------------------------------------
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.cindent = false
vim.opt.cinoptions = "l1,t0"

-- Search ---------------------------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual ---------------------------------------------------------------------
vim.opt.fillchars = {vert = " ", vertleft = " ", vertright = " ", verthoriz = " ", horiz = " ", horizup = " ", horizdown = " "}
vim.opt.termguicolors = true

-- File Handling --------------------------------------------------------------
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
-- vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.autoread = true
vim.opt.autowrite = false

-- Behavior -------------------------------------------------------------------
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"
