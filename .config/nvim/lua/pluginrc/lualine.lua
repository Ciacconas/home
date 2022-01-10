local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		-- component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

-- custom theme
local custom_gruvbox = require("lualine.themes.gruvbox")

-- normal mode
custom_gruvbox.normal.a.fg = 0
custom_gruvbox.normal.a.bg = 6
custom_gruvbox.normal.b.fg = 15
custom_gruvbox.normal.b.bg = 8
custom_gruvbox.normal.c.fg = 15
custom_gruvbox.normal.c.bg = 0

-- insert mode
custom_gruvbox.insert.a.fg = 0
custom_gruvbox.insert.a.bg = 4
custom_gruvbox.insert.b.fg = 15
custom_gruvbox.insert.b.bg = 8
custom_gruvbox.insert.c.fg = 15
custom_gruvbox.insert.c.bg = 0

-- visual mode
custom_gruvbox.visual.a.fg = 0
custom_gruvbox.visual.a.bg = 3
custom_gruvbox.visual.b.fg = 15
custom_gruvbox.visual.b.bg = 8
custom_gruvbox.visual.c.fg = 15
custom_gruvbox.visual.c.bg = 0

-- replace mode
custom_gruvbox.replace.a.fg = 0
custom_gruvbox.replace.a.bg = 1
custom_gruvbox.replace.b.fg = 15
custom_gruvbox.replace.b.bg = 8
custom_gruvbox.replace.c.fg = 15
custom_gruvbox.replace.c.bg = 0

-- command mode
custom_gruvbox.command.a.fg = 0
custom_gruvbox.command.a.bg = 5
custom_gruvbox.command.b.fg = 15
custom_gruvbox.command.b.bg = 8
custom_gruvbox.command.c.fg = 15
custom_gruvbox.command.c.bg = 0

-- command mode
custom_gruvbox.inactive.a.fg = 0
custom_gruvbox.inactive.a.bg = 2
custom_gruvbox.inactive.b.fg = 0
custom_gruvbox.inactive.b.bg = 7
custom_gruvbox.inactive.c.fg = 15
custom_gruvbox.inactive.c.bg = 0
