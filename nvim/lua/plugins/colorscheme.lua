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
        highlights = {
          CursorLine = { bg = "#101010" },
          ["@variable.parameter"] = { fg = "#c1c1c1" },
          ["@punctuation.bracket"] = { fg = "#999999" },
          ["@punctuation.special"] = { fg = "#999999" },
        },
      })
      require("black-metal").load()
    end
  },
}
