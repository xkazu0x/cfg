vim.deprecate = function() end

require("config.options")
require("config.globals")
require("config.keymaps")
require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    local home = os.getenv("HOME")
    local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = workspace_path .. project_name
    local lombok_path = "/nix/store/l049141q9rx6xjjd6m68hvzwfjm4b0j2-lombok-1.18.42/share/java/lombok.jar"

    local config = {
      cmd = {
        vim.fn.exepath("jdtls"),
        "-data",
        workspace_dir,
      },

      cmd_env = {
        JAVA_TOOL_OPTIONS = "-javaagent:" .. lombok_path,
      },

      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

      settings = {
        java = {},
      },

      init_options = {
        bundles = {},
      },
    }

    require("jdtls").start_or_attach(config)

    vim.keymap.set("n", "<leader>co", "<Cmd>lua require('jdtls').organize_imports()<CR>", { desc = "Organize Imports" })
    vim.keymap.set("n", "<leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = "Extract Variable" })
    vim.keymap.set("v", "<leader>crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = "Extract Variable" })
    vim.keymap.set("n", "<leader>crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = "Extract Constant" })
    vim.keymap.set("v", "<leader>crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = "Extract Constant" })
    vim.keymap.set("v", "<leader>crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = "Extract Method" })
  end
})
