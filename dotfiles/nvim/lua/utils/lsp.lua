local M = {}

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local km = vim.keymap.set

  -- Common
  km("n", "<leader>gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  km("n", "<leader>gS", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  km("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  km("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  km("n", "<leader>D",  "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>", opts)
  km("n", "<leader>d",  "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  km("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  km("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  -- km("n", "<leader>K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  -- Fzf
  km("n", "<leader>gd", "<cmd>Fzf lsp_finder<CR>", opts)
  km("n", "<leader>gr", "<cmd>Fzf lsp_references<CR>", opts)
  km("n", "<leader>gt", "<cmd>Fzf lsp_typedefs<CR>", opts)
  km("n", "<leader>ds", "<cmd>Fzf lsp_document_symbols<CR>", opts)
  -- km("n", "<leader>ws", "<cmd>Fzf lsp_workspace_symbols<CR>", opts)
  km("n", "<leader>gi", "<cmd>Fzf lsp_implementations<CR>", opts)

  -- Jdtls
  km("n", "<leader>co",  "<Cmd>lua require('jdtls').organize_imports()<CR>")
  km("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
  km("v", "<leader>crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
  km("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>")
  km("v", "<leader>crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
  km("v", "<leader>crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
end

return M
