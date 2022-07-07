-- Options
-- Leader Key
vim.g.mapleader = " "

-- Filetypes
-- neovim 0.7: only use filetype.lua not fallback to filtype.vim
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.cmd 'filetype plugin indent on'

-- vim.cmd 'syntax on' -- disabled for treesitter syntax

--when scrolling, keep cursor in the middle of the page (disabled, use zz to center)
vim.o.scrolloff = 10

-- allow pattern matching with special characters during search
vim.o.magic = 1

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
-- vim.api.nvim_create_autocmd(
--     { "FileType" },
--     { pattern = "yaml" ,
--         -- command = "call DetectSls()",
--         command = "echo '123123123'",
--         group = file_group })
-- multi_buf_event({ "*" }, "filetype on")
-- multi_buf_event({ "*" }, "filetype plugin on")
-- multi_buf_event({ "*.vim", "*.vimrc", "*vifmrc" }, "setlocal filetype=vim")
-- multi_buf_event({ "*.ipynb" }, "setlocal filetype=ipynb")
-- multi_buf_event({ "*.tex", "*.sty" }, "setlocal filetype=tex")
-- multi_buf_event({ "*.txt", "/tmp/neomutt*" }, "setlocal filetype=text")
-- multi_buf_event({ "*.md", "/tmp/calcurse*", "~/.calcurse/notes/*" }, "setlocal filetype=vimwiki")
-- multi_buf_event({ "*.pic.yml" }, "call DetectSls")
-- vim.api.nvim_create_autocmd(
-- 	{ "BufEnter" },
-- 	{ pattern = { "/usr/share/nvim/runtime/doc/*.txt" }, command = "setlocal nospell", group = file_group }
-- )

-------------------------------------------------------------------------------
