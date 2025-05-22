local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
	      local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	      window:gui_window():maximize()
end)

local config = wezterm.config_builder()
-- config.default_prog = { "powershell.exe", "-NoLogo" }
-- config.default_prog = { "cmd.exe", "-NoLogo" }

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.color_scheme = "Black Metal (Marduk) (base16)"
config.font = wezterm.font("Iosevka Fixed")
config.font_size = 18.0
config.front_end = "WebGpu"
config.term = "xterm-256color"
config.max_fps = 75

config.window_decorations = "NONE | RESIZE"

config.window_padding = {
   left = 0,
   right = 0,
   top = 0,
   bottom = 0,
}

config.window_frame = {
   font = wezterm.font({ family = "Iosevka", weight = "Regular" }),
   active_titlebar_bg = "#0c0b0f",
}

config.keys = {   
   {
      key = "h",
      mods = "CTRL|SHIFT|ALT",
      action = wezterm.action.SplitPane({
	    direction = "Right",
	    size = { Percent = 50 },
      }),
   },
   {
      key = "v",
      mods = "CTRL|SHIFT|ALT",
      action = wezterm.action.SplitPane({
	    direction = "Down",
	    size = { Percent = 50 },
      }),
   },
   
   {
      key = "U",
      mods = "CTRL|SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
   },
   {
      key = "I",
      mods = "CTRL|SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
   },
   {
      key = "O",
      mods = "CTRL|SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
   },
   {
      key = "P",
      mods = "CTRL|SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
   },
   
   { key = "9", mods = "CTRL", action = wezterm.action.PaneSelect },
   { key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },

   { key = "N", mods = "CTRL|SHIFT", action = wezterm.action.ToggleFullScreen },
}

return config
