return {
  { "mfussenegger/nvim-jdtls" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("servers")
    end,
  },
}
