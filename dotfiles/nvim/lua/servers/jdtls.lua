return function(lspconfig, on_attach, capabilities)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function(args)
      local home = os.getenv("HOME")
      local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = workspace_path .. project_name
      local lombok_path = "/nix/store/l049141q9rx6xjjd6m68hvzwfjm4b0j2-lombok-1.18.42/share/java/lombok.jar"

      local config = {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { vim.fn.exepath("jdtls"), "-data", workspace_dir },
        cmd_env = { JAVA_TOOL_OPTIONS = "-javaagent:" .. lombok_path },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
        settings = { java = {} },
        init_options = { bundles = {} },
      }

      require("jdtls").start_or_attach(config)
    end
  })
end
