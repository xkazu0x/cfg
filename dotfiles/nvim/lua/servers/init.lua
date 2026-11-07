local lspconfig = require("lspconfig")
local on_attach = require("utils.lsp").on_attach

require("servers.jdtls")(lspconfig, on_attach)
