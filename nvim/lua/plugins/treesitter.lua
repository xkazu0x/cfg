return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ignore_install = {},
            ensure_installed = {
                "lua",
                "c",
            },
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            module = {},
            sync_install = true,
            auto_install = true,
        })
    end
}
