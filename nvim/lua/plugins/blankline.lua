return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    -- local highlight = {
    --   "scope_hl",
    -- }
    -- local hooks = require("ibl.hooks")
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --   vim.api.nvim_set_hl(0, "scope_hl", { fg = "#888888" })
    -- end)
    require("ibl").setup({
      indent = {
        -- char = "│",
        char = "╎",
      },
      scope = {
        enabled = true,
        show_start = false,
        -- highlight = highlight,
      }
    })
    -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end
}
