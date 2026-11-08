return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-d>"] = { "show", "show_documentation", "hide_documentation" };
    },
    appearance = { nerd_font_variant = "mono" },
  },
}
