return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua" },
            highlight = { enable = true },
            indent = { enable = true },
            sync_install = true,
            auto_install = true,
        })
    end
}
