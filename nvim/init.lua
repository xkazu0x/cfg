require("config.options")
require("config.keymaps")
require("config.lazy")

--- Transparency ---------------

-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]]

--- Neovide --------------------

if vim.g.neovide then
  vim.o.guifont = "Iosevka Fixed:h15"
end
