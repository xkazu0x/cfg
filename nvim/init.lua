require("config.options")
require("config.keymaps")
require("config.lazy")

-- Neovide ---------------------
if vim.g.neovide then
  vim.o.guifont = "Iosevka Fixed:h15"
end
