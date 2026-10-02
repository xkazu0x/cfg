return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "bash",
        "javascript",
        "html",
        "css",
      },
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = false },
    })
  end,
}
