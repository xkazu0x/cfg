return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup({
      indent = {
        -- char = "│",
        char = "╎",
      },
      scope = {
        enabled = true,
        show_start = false,
      }
    })
  end
}
