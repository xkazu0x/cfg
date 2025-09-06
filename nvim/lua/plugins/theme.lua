return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        prioeity = 1000,
        config = function()
            require("vague").setup({})
            vim.cmd("colorscheme vague")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                bold = false,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
            })
            --vim.cmd("colorscheme gruvbox")
        end
    },
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
            --vim.cmd("colorscheme black-metal")
        end
    },
}
