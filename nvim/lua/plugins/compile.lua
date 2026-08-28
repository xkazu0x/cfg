return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.g.compile_mode = { default_command = "" }
    vim.keymap.set("n", "<leader>R", ":vertical botright Compile<CR>")
  end
}
