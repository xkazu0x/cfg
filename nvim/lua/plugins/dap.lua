return {
  { 
    "jay-babu/mason-nvim-dap.nvim", 
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "codelldb",
        }
      })
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("nvim-dap-virtual-text").setup()
      require("dapui").setup({
        layouts = { 
          {
            elements = {
              {
                id = "scopes",
                size = 0.25
              },
              {
                id = "breakpoints",
                size = 0.25
              },
              {
                id = "stacks",
                size = 0.25
              },
              {
                id = "watches",
                size = 0.25
              }
            },
            position = "right",
            size = 40
          },
        }
      })

      dap.adapters.codelldb = {
        type = "executable",
        port = "${port}",
        command = "codelldb",
        name = "codelldb",
        executable = {
          command = "$HOME/.local/share/nvim/mason/bin/codelldb",
          args = { "--port", "${port}" }
        }
      }

      dap.configurations.c = {
        {
          type = "codelldb",
          name = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("path to exe: ", vim.fn.getcwd() .. "/build", "file")
          end,
          cwd = function()
            return vim.fn.input("cwd: ", vim.fn.getcwd() .. "/build", "file")
          end,
          stopOnEntry = false
        }
      }

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F4>", dap.terminate)

      vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
