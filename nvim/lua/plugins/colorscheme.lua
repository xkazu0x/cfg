return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          bold = false,
          italic = false,
          transparency = false,
        },
      })
      -- vim.cmd("colorscheme rose-pine")
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
        code_style = {
          comments = "none",
          conditionals = "none",
          functions = "none",
          keywords = "none",
          headings = "none",
          operators = "none",
          keyword_return = "none",
          strings = "none",
          variables = "none",
        },
        colors = {
          fg = "#c1c1c1",
          bg = "#000000",
          line = "#101010",
          string = "#aaaaaa",
          special = "#999999",
        },
        highlights = {
          CursorLine = { bg = "$line" },
          Visual = { fg = "$bg", bg = "$special" },
          ["@variable.parameter"] = { fg = "$fg" },
          ["@string"] = { fg = "$string" },
          ["@punctuation.bracket"] = { fg = "$special" },
          ["@punctuation.special"] = { fg = "$special" },
        },
      })
      require("black-metal").load()
    end
  },
}
