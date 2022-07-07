

-- Filetypes
-------------------------------------------------------------------------------

-- define custom filetypes
local file_group = "filetypes_basic_settings"
-- Have a function to easy write code
local function multi_buf_event(pattern, command)
	vim.api.nvim_create_autocmd(
		{ "BufNewFile", "BufEnter", "BufRead" },
		{ pattern = pattern, command = command, group = file_group }
	)
end
-- augroup
vim.api.nvim_create_augroup(file_group, { clear = true })
multi_buf_event({ "*" }, "filetype on")
multi_buf_event({ "*" }, "filetype plugin on")
multi_buf_event({ "*.vim", "*.vimrc", "*vifmrc" }, "setlocal filetype=vim")
multi_buf_event({ "*.ipynb" }, "setlocal filetype=ipynb")
multi_buf_event({ "*.tex", "*.sty" }, "setlocal filetype=tex")
multi_buf_event({ "*.txt", "/tmp/neomutt*" }, "setlocal filetype=text")
multi_buf_event({ "*.md", "/tmp/calcurse*", "~/.calcurse/notes/*" }, "setlocal filetype=vimwiki")
multi_buf_event({ "*.pic.yml" }, "call DetectSls")
vim.api.nvim_create_autocmd(
	{ "BufEnter" },
	{ pattern = { "/usr/share/nvim/runtime/doc/*.txt" }, command = "setlocal nospell", group = file_group }
)

-------------------------------------------------------------------------------


require("settings.python")