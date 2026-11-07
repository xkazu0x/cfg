return {
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
        cursor_line = "#101010",
        string = "#aaaaaa",
        special = "#999999",
      },
      highlights = {
        CursorLine               = { bg = "$cursor_line" },
        Visual                   = { fg = "$bg", bg = "$special" },
        ["@string"]              = { fg = "$string" },
        ["@variable.parameter"]  = { fg = "$fg" },
        ["@punctuation.bracket"] = { fg = "$special" },
        ["@punctuation.special"] = { fg = "$special" },
      },
    })
    require("black-metal").load()
  end,
}
