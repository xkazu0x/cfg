local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local config = wezterm.config_builder()
-- config.default_prog = { "powershell.exe", "-NoLogo" }
-- config.default_prog = { "cmd.exe", "-NoLogo" }

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Black Metal (Marduk) (base16)"
-- config.font = wezterm.font({ family = "Iosevka Fixed", weight = "Regular" })
-- config.font_size = 13
config.font = wezterm.font({ family = "Terminus (TTF) for Windows", weight = "Bold" })
config.font_size = 13.5
config.front_end = "WebGpu"

config.window_decorations = "NONE | RESIZE"
config.window_frame = {
  active_titlebar_bg = "#000000",
}

config.keys = {
  { 
    key = "Space",
    mods = "CTRL",
    action = wezterm.action.PaneSelect,
  },
  { 
    key = "n",
    mods = "CTRL",
    action = wezterm.action.ActivateTabRelative(1),
  },
  { 
    key = "N", 
    mods = "CTRL|SHIFT", 
    action = wezterm.action.ToggleFullScreen,
  },

  {
    key = "S",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    key = "\"",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },

  {
    key = "H",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "J",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "K",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "L",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
}

return config
