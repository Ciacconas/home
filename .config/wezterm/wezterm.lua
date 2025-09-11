-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Font settings
-- config.font = wezterm.font('UbuntuMono Nerd Font Propo')
config.font = wezterm.font_with_fallback {
  'UbuntuMono Nerd Font Propo',
  'FiraCode Nerd Font'
}
config.font_size = 15
-- config.line_height = 1.0

config.default_cursor_style = 'SteadyUnderline'

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- Window padding (margin)
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- config.window_decorations = "NONE"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'Catppuccin Mocha (Gogh)'
-- config.color_scheme = 'Butrin' -- very nice color


-- custom colorscheme:
config.colors = {
  -- The default text color
  foreground = '#F2F2F2',
  -- The default background color
  background = '#4B3B3C',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#E39D93',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = 'black',

  -- the foreground color of selected text
  selection_fg = '#4B3B3C',
  -- the background color of selected text
  selection_bg = '#F2F2F2',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#444444',

  ansi = {
    '#8C7E78',
    '#E68A8A',
    '#99CC99',
    '#FAD7A0',
    '#6699CC',
    '#C8A2C8',
    '#6FC3B2',
    '#E2CEBE',
  },
  brights = {
    '#BFACA4',
    '#F2B1B1',
    '#B2D8B2',
    '#F7DCB4',
    '#87CEFA',
    '#D8BFD8',
    '#64DBDB',
    '#F2F2F2',
  },
}

config.keys = {
  { key = 'n', mods = 'SUPER', action = wezterm.action.SpawnCommandInNewWindow { cwd=wezterm.home_dir } },
}

-- and finally, return the configuration to wezterm
return config
