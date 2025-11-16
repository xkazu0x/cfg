return {
  { 
    "chrisgrieser/nvim-spider", 
    lazy = true,
    keys = {
      { "L", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "H", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
}
