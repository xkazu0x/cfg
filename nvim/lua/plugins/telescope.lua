return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            ".git", ".obj",
            ".pdb", ".exp", ".lib", ".dll", ".exe",
            ".so"
          };
          sorting_strategy = "ascending",
          scroll_strategy = "limit",
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            anchor = "CENTER",
            height = 0.8,
            width = 0.67,
            preview_width = 0.67,
          },
          border = {
            prompt = { 1, 1, 1, 1 },
            results = { 1, 1, 1, 1 },
            preview = { 1, 1, 1, 1 },
          },
          borderchars = {
            prompt = { "─", " ", " ", "│", "┌", "─", " ", "│" },
            results = { " ", " ", "─", "│", "│", " ", "─", "└" },
            preview = { "─", "│", "─", "│", "┬", "┐", "┘", "┴" },
          },
          -- dynamic_preview_title = true,
          -- results_title = "",
        },
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
          find_files = {
            hidden = false,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      });
      local builtin = require("telescope.builtin");
      vim.keymap.set("n", "<leader>fd", builtin.find_files);
      vim.keymap.set("n", "<leader>fg", builtin.live_grep);
    end,
  },
}
