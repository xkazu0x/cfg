return {
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                theme = "marduk",
                variant = "dark",
                code_style = {
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    keywords = "none",
                    headings = "bold",
                    operators = "none",
                    keyword_return = "none",
                    strings = "none",
                    variables = "none",
                },
            })
            require("black-metal").load()
        end
    },
}
