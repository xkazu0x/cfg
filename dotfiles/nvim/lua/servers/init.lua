local lspconfig = require("lspconfig")
local on_attach = require("utils.lsp").on_attach
local capabilities = require("blink.cmp").get_lsp_capabilities()

require("servers.jdtls")(lspconfig, on_attach, capabilities)
