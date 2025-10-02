return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                }
            })
        end
    },
    { 
        "jay-babu/mason-nvim-dap.nvim", 
        config = function()
            require("mason-nvim-dap").setup()
        end
    }
}
