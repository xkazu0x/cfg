return {
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                theme = "marduk",
                variant = "dark",
                alt_bg = false,
            })
            require("black-metal").load()
        end
    },
}
