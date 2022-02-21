local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return math.floor(vim.o.lines * 0.25)
		elseif term.direction == "vertical" then
			return math.floor(vim.o.columns * 0.4)
		end
	end,
	open_mapping = [[<c-\>]],
	-- on_open = fun(t: Terminal), -- function to run when the terminal opens
	-- on_close = fun(t: Terminal), -- function to run when the terminal closes
	hide_numbers = false, -- hide the number column in toggleterm buffers
	-- shade_filetypes = {},
	start_in_insert = false,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = false,
	direction = "float", -- "vertical" | 'horizontal' | 'window' | 'float',
	close_on_exit = false, -- close the terminal window when the process exits
	-- shell = vim.o.shell, -- change the default shell
	-- -- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- 	-- The border key is *almost* the same as 'nvim_open_win'
		-- 	-- see :h nvim_open_win for details on borders however
		-- 	-- the 'curved' border is a custom border type
		-- 	-- not natively supported but implemented in this plugin.
		border = "single", --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		width = function()
			return math.floor(vim.o.columns * 0.8)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.8)
		end,
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local ipython = Terminal:new({ cmd = "ipython --matplotlib", hidden = false, direction = "horizontal" })

function _IPYTHON_TERM()
	ipython:toggle()
	vim.cmd([[execute "normal G\<C-w>k"]])
end

local cargo5 = Terminal:new({ count = 5, direction = "float" })
function _CARGORUN()
	cargo5:toggle()
	vim.cmd([[execute "normal G\<C-w>k"]])
	toggleterm.exec("cargo run", 5)
end

-- mklatex
local mklatex = Terminal:new({ count = 6, hidden = false, direction = "horizontal" })
function _MK_Latex(mklatex_arg)
	mklatex:toggle()
	print(mklatex_arg)
	toggleterm.exec(mklatex_arg, 6)
	vim.wait(100)
	vim.cmd([[execute "normal G\<C-w>k"]])
end
