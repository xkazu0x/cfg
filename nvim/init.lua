require("config.options")
require("config.keymaps")
require("config.lazy")
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
